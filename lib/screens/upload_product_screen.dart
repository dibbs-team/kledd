import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../widgets/upload/upload_step.dart';
import '../widgets/upload/pictures_step.dart';
import '../widgets/upload/description_step.dart';
import '../widgets/upload/rules_step.dart';
import '../widgets/upload/payment_step.dart';
import '../lang/my_localizations.dart';
import '../models/product.dart';

class UploadProductScreen extends StatefulWidget {
  @override
  _UploadProductScreenState createState() => _UploadProductScreenState();
}

class _UploadProductScreenState extends State<UploadProductScreen> {
  static const _numberOfSteps = 4;

  final _picturesStep = PicturesStep(1);
  final _descriptionStep = DescriptionStep(2);
  final _rulesStep = RulesStep(3);
  final _paymentStep = PaymentStep(4);
  var _currentStep = 1;

  /// Uploads the product to Firestore. Returns wheter action was succesful.
  Future<bool> _uploadProduct(BuildContext ctx) async {
    try {
      // Get reference to current user.
      final user = auth.FirebaseAuth.instance.currentUser;

      // Create a product to get a reference to an entry in the database.
      final productRef =
          await FirebaseFirestore.instance.collection('products').add({});

      // Upload the product image.
      final imageRef = FirebaseStorage.instance
          .ref()
          .child('product_image')
          .child(productRef.id)
          .child('1.jpg');
      await imageRef.putFile(_picturesStep.image).onComplete;

      // Save an URL to the image.
      var imageUrl = await imageRef.getDownloadURL();

      // Upload the product.
      await FirebaseFirestore.instance
          .collection('products')
          .doc(productRef.id)
          .set(
            Product.generateAddData(
              renter: user.uid,
              title: _descriptionStep.title,
              imageUrl: imageUrl,
              brand: _descriptionStep.brand,
              size: _descriptionStep.size,
              description: _descriptionStep.description,
              price: _paymentStep.priceDay,
              rentingRules: _rulesStep.rules,
            ),
          );
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<void> _finishStep() async {
    if (_currentStep == _numberOfSteps) {
      var res = await _uploadProduct(context);
      //* Communicates result of upload to parent screen.
      Navigator.of(context).pop(res);
    } else {
      setState(() {
        _currentStep += 1; // Navigates to next step.
      });
    }
  }

  UploadStep _getCurrentStep() {
    switch (_currentStep) {
      case 1:
        return _picturesStep;
      case 2:
        return _descriptionStep;
      case 3:
        return _rulesStep;
      case 4:
        return _paymentStep;
      default:
        throw StateError(
            "_currentStep is out of bounds. It was $_currentStep.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);
    final currentStep = _getCurrentStep();

    return WillPopScope(
      onWillPop: () async {
        //* This can happen if the user presses the back button on Android.
        if (_currentStep == 1) {
          return true; // Pop this screen.
        }
        setState(() {
          _currentStep -= 1; // Navigate to previous step.
        });
        return false; // Do not pop this screen.
      },
      child: Scaffold(
        appBar: AppBar(
          // Do not show back button on first step.
          leading: _currentStep == 1 ? Container() : BackButton(),
          title: Text(
            l10n.uploadStep(
              current: _currentStep,
              total: _numberOfSteps,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: Container(
          height: double.maxFinite,
          child: Stack(
            children: <Widget>[
              currentStep,
              Positioned(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    child: RaisedButton(
                      child: Text(_currentStep == _numberOfSteps
                          ? l10n.uploadProduct
                          : l10n.nextStep),
                      onPressed: () {
                        if (currentStep.validate()) {
                          _finishStep();
                        }
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
