// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'path_package_dependency_spec.dart';

// **************************************************************************
// FunctionalDataGenerator
// **************************************************************************

abstract class $PathPackageDependencySpec {
  const $PathPackageDependencySpec();

  String get package;
  String get path;

  PathPackageDependencySpec copyWith({
    String? package,
    String? path,
  }) =>
      PathPackageDependencySpec(
        package: package ?? this.package,
        path: path ?? this.path,
      );

  PathPackageDependencySpec copyUsing(
      void Function(PathPackageDependencySpec$Change change) mutator) {
    final change = PathPackageDependencySpec$Change._(
      this.package,
      this.path,
    );
    mutator(change);
    return PathPackageDependencySpec(
      package: change.package,
      path: change.path,
    );
  }

  @override
  String toString() =>
      "PathPackageDependencySpec(package: $package, path: $path)";

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      other is PathPackageDependencySpec &&
      other.runtimeType == runtimeType &&
      package == other.package &&
      path == other.path;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode {
    var result = 17;
    result = 37 * result + package.hashCode;
    result = 37 * result + path.hashCode;
    return result;
  }
}

class PathPackageDependencySpec$Change {
  PathPackageDependencySpec$Change._(
    this.package,
    this.path,
  );

  String package;
  String path;
}

// ignore: avoid_classes_with_only_static_members
class PathPackageDependencySpec$ {
  static final package = Lens<PathPackageDependencySpec, String>(
    (packageContainer) => packageContainer.package,
    (packageContainer, package) => packageContainer.copyWith(package: package),
  );

  static final path = Lens<PathPackageDependencySpec, String>(
    (pathContainer) => pathContainer.path,
    (pathContainer, path) => pathContainer.copyWith(path: path),
  );
}
