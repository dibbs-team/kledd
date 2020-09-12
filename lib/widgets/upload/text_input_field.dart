import 'package:flutter/material.dart';

import '../../lang/my_localizations.dart';

class TextInputField extends StatelessWidget {
  final String title;
  final String hint;
  final bool optional;
  final bool number; // TODO: Temporary, should be an own widget.
  final _controller = TextEditingController();

  TextInputField(
      {this.title, this.hint = '', this.optional = false, this.number = false});

  get text => _controller.text;

  void clear() {
    _controller.text = '';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Column(
      children: [
        Text(title),
        TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: hint,
          ),
          validator: (value) {
            if (!optional && value.isEmpty) {
              return l10n.requiredField;
            }
            // TODO: Temporary, should be an own widget.
            // If value can not be parsed to a double.
            if (number && double.parse(value, (e) => null) == null) {
              return "This must be a number.";
            }
            return null;
          },
        ),
      ],
    );
  }
}
