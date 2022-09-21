import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pip_android_permission_checker/pip_android_permission_checker_method_channel.dart';

void main() {
  MethodChannelPipAndroidPermissionChecker platform = MethodChannelPipAndroidPermissionChecker();
  const MethodChannel channel = MethodChannel('pip_android_permission_checker');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('hasPermission', () async {
    expect(await platform.hasPermission(), '42');
  });
}
