import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/user.dart';

class ProductUploader extends StatelessWidget {
  final String uploaderId;

  ProductUploader({
    @required this.uploaderId,
  });

  /// Requests information about the user that uploaded the product.
  Future<DocumentSnapshot> getUploader() async {
    return FirebaseFirestore.instance.collection('users').doc(uploaderId).get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: getUploader(),
      builder: (ctx, snapshot) {
        User uploader;
        if (snapshot.hasData) {
          uploader = User.fromSnapshot(snapshot.data);
        }
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: uploader != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(uploader.imageUrl),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            uploader.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).accentColor,
                              fontSize: 14,
                            ),
                          ),
                          if (uploader.rating != null)
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Theme.of(context).accentColor,
                                ),
                                Text(uploader.rating.toStringAsFixed(1)),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
