import 'package:pubspec_yaml_2/pubspec_yaml_2.dart';
import 'package:test/test.dart';

void main() {
  group('given pubspec.yaml with resolution: workspace', () {
    final pubspec =
        PubspecYaml.loadFromYamlString(pubspecWithResolutionWorkspace);

    group('loadFromYamlString()', () {
      test('provides object with existing resolution', () {
        expect(pubspec.resolution.hasValue, isTrue);
      });
      test('provides object correct resolution value', () {
        expect(pubspec.resolution.valueOr(() => ''), 'workspace');
      });
      test('provides object without custom fields', () {
        expect(pubspec.customFields, isEmpty);
      });
    });

    group('toYamlString()', () {
      test('produces output identical to the original string', () {
        expect(pubspec.toYamlString(), pubspecWithResolutionWorkspace);
      });
    });
  });

  group('given pubspec.yaml with empty resolution ', () {
    final pubspec = PubspecYaml.loadFromYamlString(pubspecWithResolutionReset);

    group('loadFromYamlString()', () {
      test('provides object with existing resolution', () {
        expect(pubspec.resolution.hasValue, isTrue);
      });
      test('provides object correct resolution value', () {
        expect(pubspec.resolution.valueOr(() => 'fail'), null);
      });
      test('provides object without custom fields', () {
        expect(pubspec.customFields, isEmpty);
      });
    });

    group('toYamlString()', () {
      test('produces output identical to the original string', () {
        expect(pubspec.toYamlString(), pubspecWithResolutionReset);
      });
    });
  });
}

const pubspecWithResolutionWorkspace = '''
name: pubspec_yaml

environment:
  sdk: ^3.6.0

resolution: workspace
''';

const pubspecWithResolutionReset = '''
name: pubspec_yaml

environment:
  sdk: ^3.6.0

resolution:
''';
