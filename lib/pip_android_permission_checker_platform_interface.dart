import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pip_android_permission_checker_method_channel.dart';

abstract class PipAndroidPermissionCheckerPlatform extends PlatformInterface {
  /// Constructs a PipAndroidPermissionCheckerPlatform.
  PipAndroidPermissionCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static PipAndroidPermissionCheckerPlatform _instance = MethodChannelPipAndroidPermissionChecker();

  /// The default instance of [PipAndroidPermissionCheckerPlatform] to use.
  ///
  /// Defaults to [MethodChannelPipAndroidPermissionChecker].
  static PipAndroidPermissionCheckerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PipAndroidPermissionCheckerPlatform] when
  /// they register themselves.
  static set instance(PipAndroidPermissionCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> hasPermission(String packageName) {
    throw UnimplementedError('hasPermission() has not been implemented.');
  }
}
