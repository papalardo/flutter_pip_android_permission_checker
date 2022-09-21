import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'pip_android_permission_checker_platform_interface.dart';

/// An implementation of [PipAndroidPermissionCheckerPlatform] that uses method channels.
class MethodChannelPipAndroidPermissionChecker extends PipAndroidPermissionCheckerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('pip_android_permission_checker');

  @override
  Future<bool> hasPermission(String packageName) async {
    final version = await methodChannel.invokeMethod<bool>('checkPipPermission', {
      'packageName': packageName
    });
    return version ?? false;
  }
}
