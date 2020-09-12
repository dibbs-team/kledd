import 'package:flutter/material.dart';

import 'upload_step.dart';
import 'upload_title.dart';
import 'text_input_field.dart';
import '../../lang/my_localizations.dart';

class DescriptionStep extends UploadStep {
  final _formKey = GlobalKey<FormState>();
  final int step;

  // TODO: Update with correct data structures, localized strings and input fields.
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

  DescriptionStep(this.step) : super(step);

  String get title => _titleInput.text;
  String get brand => _brandInput.text;
  String get size => _sizeInput.text;
  String get description => _descriptionInput.text;

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
          UploadTitle(l10n.descriptionStepTitle(step)),
          _titleInput,
          _brandInput,
          _sizeInput,
          _descriptionInput,
        ],
      ),
    );
  }
}
