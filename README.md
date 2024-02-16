# Komodo Trivia

Quiz app built using Open Trivia db api, with features like theme selection, MCQ, True false question and scores.

![Mockup-01](https://github.com/s4nk37/komodotrivia/assets/44511437/bc4f31fd-2096-41d5-abd2-1d7aec1b5c11)

## Folder Structure

<pre>
lib
├── generated
│   └── assets.dart
├── main.dart
├── models
│   └── question_model.dart
├── providers
│   ├── question_provider.dart
│   └── score_provider.dart
├── services
│   └── quiz_api_service.dart
├── ui
│   ├── commons
│   │   └── internet_error.dart
│   └── screens
│       ├── home
│       │   ├── home_screen.dart
│       │   └── quiz_category_card.dart
│       └── quiz
│           ├── mcq_question.dart
│           ├── option_card.dart
│           ├── question_card.dart
│           ├── question_screen.dart
│           └── quiz_end_screen.dart
└── utils
├── configs
│   ├── app_config.dart
│   └── size_config.dart
├── constants
│   ├── api_constants.dart
│   ├── colors_constants.dart
│   ├── layout_constants.dart
│   ├── strings_constants.dart
│   └── textstyle_constants.dart
├── extensions
├── routes.dart
├── styles
│   └── simple_shadow.dart
├── theme.dart
└── validations
</pre>


## Getting Started

1) Clone the Repository: Use Git to clone this repository locally.
2) Install Dependencies: Run `flutter pub get` to install all required packages.
3) Run the App: Connect your device or start an emulator, and run `flutter run` to launch the app.

