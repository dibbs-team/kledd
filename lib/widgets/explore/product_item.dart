import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  // TODO: Image;
  final String title;
  final String brand;
  final String size; //? Should this be int or String?
  //? Sizes could be either "small" or "36"

  ProductItem(
      {@required this.title, @required this.brand, @required this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: Send user to selected product.
        print(title);
      },
      child: Card(
        //* elevation = 0 makes the card appear more "futuristic" and clean
        elevation: 0,
        margin: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              // TODO: Change container/ to picture!
              Expanded(
                child: Container(
                  color: Theme.of(context).accentColor,
                  width: double.infinity,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text(brand), Text(size)],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
