# MINI HRIS
Application list employee form API https://hub.dummyapis.com

This project using clean architecture patern and Providers for State management

# How To Install
Generate library using command "Flutter pub get"
Generate build runner using command "dart run build_runner build"

# Project Tree
```bash
├── common
│   ├── constants.dart
│   ├── date_formatter.dart
│   ├── exceptions.dart
│   ├── failure.dart
│   ├── state_enum.dart
│   └── utils.dart
├── data
│   ├── datasources
│   │   └── remote
│   │       └── employee_remote_data_sources.dart
│   ├── models
│   │   └── employee_model.dart
│   └── repositories
│       └── employee_repository_impl.dart
├── di
│   └── injector.dart
├── domain
│   ├── entities
│   │   └── employee.dart
│   ├── repositories
│   │   └── employee_repository.dart
│   └── usecase
│       └── get_employee.dart
├── main.dart
└── presentation
    ├── page
    │   ├── employee_detail_page.dart
    │   └── employee_page.dart
    └── provider
        └── employee_list_notifier.dart
```

# Library Using
| Name                 | Description                                                                                                 | Link                                          |
|----------------------|-------------------------------------------------------------------------------------------------------------|-----------------------------------------------|
| cached_network_image | A flutter library to show images from the internet and keep them in the cache directory.                    | https://pub.dev/packages/cached_network_image |
| dio                  | A powerful HTTP networking package for Dart/Flutter                                                         | https://pub.dev/packages/dio                  |
| dartz                | Functional programming in Dart                                                                              | https://pub.dev/packages/dartz                |
| equatable            | Being able to compare objects in Dart often involves having to override the == operator as well as hashCode | https://pub.dev/packages/equatable            |
| get_it               | This is a simple Service Locator for Dart and Flutter                                                       | https://pub.dev/packages/get_it               |
| intl                 | Provides internationalization and localization facilities                                                   | https://pub.dev/packages/intl                 |
| provider             | State management                                                                                            | https://pub.dev/packages/provider             |
| build_runner         | Generating files using Dart code                                                                            | https://pub.dev/packages/build_runner         |

# Screen Shoot
![Screenshot_20231208_074540](https://github.com/primajatnika27/hris-mock/assets/51253537/91c1cef4-23b3-498d-93b0-f697f1cee535)
![Screenshot_20231208_074823](https://github.com/primajatnika27/hris-mock/assets/51253537/b4084005-584d-4878-8387-c985f326109a)

