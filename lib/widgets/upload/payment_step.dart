import 'package:flutter/material.dart';

import 'upload_step.dart';
import 'upload_title.dart';
import 'text_input_field.dart';
import '../../lang/my_localizations.dart';

class PaymentStep extends UploadStep {
  final _formKey = GlobalKey<FormState>();
  final int step;

  // TODO: Update with correct data structures, localized strings and input fields.
  final _priceDayInput = TextInputField(
    title: 'Price per day (mandatory)',
    number: true,
  );
  final _priceWeekendInput = TextInputField(
    title: 'Price per weekend',
    optional: true,
  );
  final _priceWeekInput = TextInputField(
    title: 'Price per week',
    optional: true,
  );
  final _bankInput = TextInputField(
    title: 'Bank',
    optional: true,
  );
  final _accountNumberInput = TextInputField(
    title: 'Account number',
    optional: true,
  );

  PaymentStep(this.step) : super(step);

  double get priceDay => double.parse(_priceDayInput.text);
  double get priceWeekend => double.parse(_priceWeekendInput.text);
  double get priceWeek => double.parse(_priceWeekInput.text);
  String get bank => _bankInput.text;
  String get accountNumber => _accountNumberInput.text;

  @override
  bool validate() {
    return _formKey.currentState.validate();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          UploadTitle(l10n.paymentStepTitle(step)),
          _priceDayInput,
          _priceWeekendInput,
          _priceWeekInput,
          _bankInput,
          _accountNumberInput,
        ],
      ),
    );
  }
}
