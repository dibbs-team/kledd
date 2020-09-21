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

  String get requiredField => Intl.message(
        'This field is required.',
        name: 'requiredField',
        desc: 'Shown in input form when required field is empty.',
      );

  String get successfulUpload => Intl.message(
        'Product upload was successful.',
        name: 'successfulUpload',
        desc: 'Shown in snackbar after upload was successful.',
      );

  String get unsuccessfulUpload => Intl.message(
        'Product upload was unsuccessful.',
        name: 'unsuccessfulUpload',
        desc: 'Shown in snackbar after upload was unsuccessful.',
      );

  String get nextStep => Intl.message(
        'Next',
        name: 'nextStep',
        desc: 'Text on button to go to next step when uploading a product.',
      );

  String get uploadProduct => Intl.message(
        'Publish',
        name: 'uploadProduct',
        desc: 'Text on button to upload a product.',
      );

  String get errorOccured => Intl.message(
        'An error occured.',
        name: 'errorOccured',
        desc: 'General error occured text. Shown in for example a snackbar.',
      );

  String uploadStep({
    @required int current,
    @required int total,
  }) =>
      Intl.message(
        'Step $current/$total',
        name: 'uploadStep',
        args: [current, total],
        desc: 'AppBar text on when uploading product.',
        examples: const {'current': 2, 'total': 4},
      );

  String picturesStepTitle(int step) => Intl.message(
        '$step. Upload pictures',
        name: 'picturesStepTitle',
        args: [step],
        desc: 'Title on pictures step when uploading product.',
        examples: const {'step': 1},
      );

  String descriptionStepTitle(int step) => Intl.message(
        '$step. Describe your item',
        name: 'descriptionStepTitle',
        args: [step],
        desc: 'Title on description step when uploading product.',
        examples: const {'step': 2},
      );

  String rulesStepTitle(int step) => Intl.message(
        '$step. Set your rules',
        name: 'rulesStepTitle',
        args: [step],
        desc: 'Title on rules step when uploading product.',
        examples: const {'step': 3},
      );

  String paymentStepTitle(int step) => Intl.message(
        '$step. Set up payment',
        name: 'paymentStepTitle',
        args: [step],
        desc: 'Title on payment step when uploading product.',
        examples: const {'step': 4},
      );
}
