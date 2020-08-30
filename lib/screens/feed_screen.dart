import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

import '../widgets/explore/no_products_display.dart';
import '../widgets/explore/product_item.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  DateTime _lastRefresh = DateTime.now();

  Future<void> _reloadProducts() async {
    setState(() {
      // This causes the key parameter in PaginateFirestore to change
      // which rebuilds the entire widget with reloaded content.
      _lastRefresh = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feed Screen"),
      ),
      body: RefreshIndicator(
        backgroundColor: Theme.of(context).backgroundColor,
        onRefresh: _reloadProducts,
        child: PaginateFirestore(
          itemBuilderType: PaginateBuilderType.gridView,
          itemBuilder: (index, ctx, documentSnapshot) => ProductItem(
            title: documentSnapshot.data['title'],
            size: "plusSize",
            brand: "Eldordado",
          ),
          query: Firestore.instance.collection('products').orderBy('title'),
          emptyDisplay: NoProductsDisplay(),
          // Important to use AlwaysScrollableScrollPhysics in RefreshIndicator.
          physics: AlwaysScrollableScrollPhysics(),
          itemsPerPage: 10,
          key: Key(_lastRefresh.toString()),
        ),
      ),
    );
  }
}
