import 'package:flutter/material.dart';

import '../../screens/product_detail_screen.dart';
import '../../models/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({
    @required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: product,
          );
        },
        child: Hero(
          tag: product.id,
          child: FadeInImage(
            placeholder: AssetImage('assets/images/product-placeholder.png'),
            image: NetworkImage(product.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        title: Text(product.title),
        subtitle: Text(product.size),
      ),
    );
  }
}
