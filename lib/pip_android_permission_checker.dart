
import 'pip_android_permission_checker_platform_interface.dart';

class PipAndroidPermissionChecker {
  Future<bool> hasPermission(String packageName) {
    return PipAndroidPermissionCheckerPlatform.instance.hasPermission(packageName);
  }
}
