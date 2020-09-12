import 'package:flutter/material.dart';

import '../../lang/my_localizations.dart';

class TextInputField extends StatelessWidget {
  final String title;
  final String hint;
  final _controller = TextEditingController();

  TextInputField({this.title, this.hint = ''});

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
            if (value.isEmpty) {
              return l10n.requiredField;
            }
            return null;
          },
        ),
      ],
    );
  }
}
