import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'l10n/messages_all.dart';

class MyLocalizations {
  /// Initialize localization systems and messages
  static Future<MyLocalizations> load(Locale locale) async {
    // If we're given "en_US", we'll use it as-is. If we're
    // given "en", we extract it and use it.
    final String localeName =
        locale.countryCode == null || locale.countryCode.isEmpty
            ? locale.languageCode
            : locale.toString();
    // We make sure the locale name is in the right format e.g.
    // converting "en-US" to "en_US".
    final String canonicalLocaleName = Intl.canonicalizedLocale(localeName);
    // Load localized messages for the current locale.
    await initializeMessages(canonicalLocaleName);
    // Force the locale in Intl.
    Intl.defaultLocale = canonicalLocaleName;
    return MyLocalizations();
  }

  /// Retrieve localization resources for the widget tree
  /// corresponding to the given `context`
  static MyLocalizations of(BuildContext context) =>
      Localizations.of<MyLocalizations>(context, MyLocalizations);

  // ----------------------
  // Declare messages here.
  // ----------------------

  String get title => Intl.message(
        'Kledd',
        name: 'title',
        desc: 'App title',
      );

  String signInButtonText(String service) => Intl.message(
        'Sign in with $service',
        name: 'signInButtonText',
        args: [service],
        desc: 'Text on sign in button',
        examples: const {'service': 'Google'},
      );

  String get authFailed =>
      Intl.message('Authentication failed. Please try again.',
          name: 'authFailed',
          desc: 'Shown in snackbar if authentication is unsuccessful');
}
