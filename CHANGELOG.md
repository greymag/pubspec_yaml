## [4.0.0+1]

* Actual minimum SDK version is 3.0.0 (not 2.14.0 as stated in 4.0.0), because of dependency on `sum_types` package.

## [4.0.0]

* Added support for `workspace` and `resolution` fields (see https://dart.dev/tools/pub/workspaces).
* Replaced `Optional<T>` with a custom implementation. The main API remains compatible, but some methods have been removed.
* Minimum SDK version is now 2.14.0.

This release marks the beginning of a migration to a new approach for handling optional fields.

Previously, optional fields were either given default values (e.g., an empty list or map) or treated as non-existent if `null`. 
Going forward, we now distinguish between three states for optional fields:
- non-existing;
- existing but empty (e.g., an empty list, map, or `null`);
- existing with values.

This change allows us to retain more precise information from the original `pubspec.yaml` file.

The newly supported `workspace` and `resolution` fields already follow this approach.
Other optional fields will be migrated in future releases.

## [3.3.0] - Update dependencies, fix exception.

* Update dependencies and supported SDK version.
* Don't fail if hosted dependency doesn't have a name (incorrectly formatted pubspec.yaml).
* Use `innim_lint` as set of lints.

## [3.2.0] - Support short format for hosted dependencies

* Support for new (Dart 2.15 and later) format of defining hosted dependencies.
See [documentation](https://dart.dev/tools/pub/dependencies#hosted-packages).

## [3.1.0] - Improved YAML formatting
* Correct YAML output with nested arrays and structures

## [3.0.0] - Null safety

## [2.0.1+1] - Upgrade to Dart 2.10

## [2.0.1] - 2020-04-23
* Support for functional_data 0.3.0

## [2.0.0] - 2020-03-23
* Support for command-line executables provided by the package
* PubspecYaml instances can be created from YAML using string extension method
* This version requires Dart 2.7
* Major refactoring to improve maintainability

## [1.0.0+1] - 2019-12-22
* README.md correction

## [1.0.0] - 2019-12-22
PubspecYaml is a data type representing data stored in pubspec.yaml files.

The following fields are supported:
* Package name
* Package version
* Package description
* Package author/authors
* Package homepage, repository, and issue tracker
* Package documentation
* Package server specification
* Dependency specifications: regular, dev, and overrides
* SDK constraints
* Command-line executables provided by the package

Other fields are accessible via PubspecYaml.customFields as a JSON structure (Map<String, dynamic>).
