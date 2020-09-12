import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  final String title;
  final String size;
  final String brand;

  ProductInfo({
    @required this.title,
    @required this.size,
    @required this.brand,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        size,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        brand,
                        style: TextStyle(
                            fontSize: 16, color: Theme.of(context).accentColor),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        size,
                        style: TextStyle(
                            fontSize: 16, color: Theme.of(context).accentColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
