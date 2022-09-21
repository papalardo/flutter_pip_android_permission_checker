import 'package:flutter_test/flutter_test.dart';
import 'package:pip_android_permission_checker/pip_android_permission_checker.dart';
import 'package:pip_android_permission_checker/pip_android_permission_checker_platform_interface.dart';
import 'package:pip_android_permission_checker/pip_android_permission_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPipAndroidPermissionCheckerPlatform
    with MockPlatformInterfaceMixin
    implements PipAndroidPermissionCheckerPlatform {

  @override
  Future<bool> hasPermission() => Future.value(true);
}

void main() {
  final PipAndroidPermissionCheckerPlatform initialPlatform = PipAndroidPermissionCheckerPlatform.instance;

  test('$MethodChannelPipAndroidPermissionChecker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPipAndroidPermissionChecker>());
  });

  test('getPlatformVersion', () async {
    PipAndroidPermissionChecker pipAndroidPermissionCheckerPlugin = PipAndroidPermissionChecker();
    MockPipAndroidPermissionCheckerPlatform fakePlatform = MockPipAndroidPermissionCheckerPlatform();
    PipAndroidPermissionCheckerPlatform.instance = fakePlatform;

    expect(await pipAndroidPermissionCheckerPlugin.hasPermission(), true);
  });
}
