import 'package:flutter/material.dart';

import '../widgets/product_detail/description_divder.dart';
import '../widgets/product_detail/product_price_and_availability.dart';
import '../widgets/product_detail/product_renter.dart';
import '../widgets/product_detail/product_renting_rules.dart';
import '../widgets/product_detail/product_description.dart';
import '../widgets/product_detail/product_info.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  ProductDetailScreen();

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context).settings.arguments as Product;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 500,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(product.title),
              background: Hero(
                tag: product.id,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ProductInfo(
                  brand: product.brand,
                  size: product.size,
                  title: product.title,
                ),
                DescriptionDivider(),
                ProductDescription(
                  description: product.description,
                ),
                DescriptionDivider(),
                ProductUploader(
                  uploaderId: product.uploader,
                ),
                DescriptionDivider(),
                ProductRentingRules(
                  rentingRules: product.rentingRules,
                ),
                DescriptionDivider(),
                ProductPriceAndAvailability(product: product),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    //Container(height: 20, width: double.infinity, color: Colors.black),
  }
}
