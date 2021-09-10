# thesis_cancer

A new Cancer social and control application.

## Getting Started

This project is a starting point for a Flutter application.

## Setting up

First, you need to provide all required package and code to make this application works:

1. Get all packages: `flutter pub get`

   > Note: It also generates the Application Localization Delegate (step two [here](https://flutter.dev/docs/development/accessibility-and-localization/internationalization#adding-your-own-localized-messages)).

   > Note: You will find all unstraslated strings on `l10n/untrasnlated_strings.txt` file, don't forget use `flutter pub get`after translating them on its proper localization file (steps four and five [here](https://flutter.dev/docs/development/accessibility-and-localization/internationalization#adding-your-own-localized-messages)).

2. Build generated files:`flutter pub run build_runner build --delete-conflicting-outputs`

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
