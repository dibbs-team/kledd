import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/upload/text_input_field.dart';
import '../models/product.dart';
import '../lang/my_localizations.dart';

class UploadProductScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  // TODO: Refactor to use the fields from the product design.
  final _titleInput = TextInputField(
    title: 'Title',
    hint: 'Title...',
  );
  final _brandInput = TextInputField(
    title: 'Brand',
    hint: 'Brand...',
  );
  final _sizeInput = TextInputField(
    title: 'Size',
    hint: 'Size...',
  );
  final _descriptionInput = TextInputField(
    title: 'Description',
    hint: 'Description...',
  );

  showUploadResultSnackBar(BuildContext ctx, {bool success}) {
    final l10n = MyLocalizations.of(ctx);
    Scaffold.of(ctx).showSnackBar(
      SnackBar(
        content:
            Text(success ? l10n.successfulUpload : l10n.unsuccessfulUpload),
      ),
    );
  }

  resetInput() {
    _titleInput.clear();
    _brandInput.clear();
    _sizeInput.clear();
    _descriptionInput.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            try {
              final FirebaseUser user =
                  await FirebaseAuth.instance.currentUser();
              await Firestore.instance.collection('products').add(
                    Product.generateAddData(
                      renter: user.uid,
                      title: _titleInput.text,
                      // TODO: Use own image.
                      imageUrl:
                          "https://www.lulus.com/images/product/xlarge/3301380_667902.jpg",
                      brand: _brandInput.text,
                      size: _sizeInput.text,
                      description: _descriptionInput.text,
                    ),
                  );
              showUploadResultSnackBar(context, success: true);
              resetInput();
            } catch (error) {
              showUploadResultSnackBar(context, success: false);
            }
          }
        },
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _titleInput,
              _brandInput,
              _sizeInput,
              _descriptionInput,
            ],
          ),
        ),
      ),
    );
  }
}
