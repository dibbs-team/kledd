import 'package:flutter/material.dart';

import 'upload_step.dart';
import 'upload_title.dart';
import 'text_input_field.dart';
import '../../lang/my_localizations.dart';

class RulesStep extends UploadStep {
  final _formKey = GlobalKey<FormState>();
  final int step;

  // TODO: Update with correct data structures, localized strings and input fields.
  final _cancellationTermsInput = TextInputField(
    title: 'Cancellation terms',
    hint: 'Cancellation terms...',
    optional: true,
  );
  final _rulesInput = TextInputField(
    title: 'Renting rules',
    hint: 'Renting rules...',
  );
  // TODO: Get number from user entry in db and set as default.
  final _contactNumberInput = TextInputField(
    title: 'Contact number',
    hint: 'Contact number...',
    optional: true,
  );

  RulesStep(this.step) : super(step);

  String get cancellationTerms => _cancellationTermsInput.text;
  String get rules => _rulesInput.text;
  String get contactNumber => _contactNumberInput.text;

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
          UploadTitle(l10n.rulesStepTitle(step)),
          _cancellationTermsInput,
          _rulesInput,
          _contactNumberInput,
        ],
      ),
    );
  }
}
