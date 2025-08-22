import 'package:pubspec_yaml_2/pubspec_yaml_2.dart';
import 'package:test/test.dart';

void main() {
  group('given pubspec.yaml with workspaces', () {
    final pubspec = PubspecYaml.loadFromYamlString(pubspecWithWorkspace);

    group('loadFromYamlString()', () {
      test('provides object with not empty workspaces', () {
        expect(pubspec.workspace?.isNotEmpty, isTrue);
      });
      test('provides object correct workspace values', () {
        expect(pubspec.workspace, contains('packages/helper'));
        expect(pubspec.workspace, contains('packages/client_package'));
        expect(pubspec.workspace, contains('packages/server_package'));
      });
      test('provides object without custom fields', () {
        expect(pubspec.customFields, isEmpty);
      });
    });

    group('toYamlString()', () {
      test('produces output identical to the original string', () {
        expect(pubspec.toYamlString(), pubspecWithWorkspace);
      });
    });
  });

  group('given pubspec.yaml with empty workspaces', () {
    final pubspec = PubspecYaml.loadFromYamlString(pubspecWithEmptyWorkspace);

    group('loadFromYamlString()', () {
      test('provides object with empty workspaces', () {
        expect(pubspec.workspace?.isEmpty, isTrue);
      });
      test('provides object without custom fields', () {
        expect(pubspec.customFields, isEmpty);
      });
    });

    group('toYamlString()', () {
      test('produces output identical to the original string', () {
        expect(pubspec.toYamlString(), pubspecWithEmptyWorkspace);
      });
    });
  });

  group('given pubspec.yaml without workspaces', () {
    final pubspec = PubspecYaml.loadFromYamlString(pubspecWithNoWorkspace);

    group('loadFromYamlString()', () {
      test('provides object with empty workspaces', () {
        expect(pubspec.workspace, isNull);
      });
      test('provides object without custom fields', () {
        expect(pubspec.customFields, isEmpty);
      });
    });

    group('toYamlString()', () {
      test('produces output identical to the original string', () {
        expect(pubspec.toYamlString(), pubspecWithNoWorkspace);
      });
    });
  });
}

const pubspecWithWorkspace = '''
name: pubspec_yaml

environment:
  sdk: ^3.6.0

workspace:
  - packages/helper
  - packages/client_package
  - packages/server_package
''';

const pubspecWithEmptyWorkspace = '''
name: pubspec_yaml

environment:
  sdk: ^3.6.0

workspace:
''';

const pubspecWithNoWorkspace = '''
name: pubspec_yaml

environment:
  sdk: ^3.6.0
''';
