import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  static Future<bool> requestMicPermission() async {
    try {
      final status = await Permission.microphone.status;

      if (status.isGranted) return true;

      if (status.isDenied) {
        final result = await Permission.microphone.request();
        return result.isGranted;
      }

      if (status.isPermanentlyDenied) {
        await openAppSettings();
        return false;
      }

      return false;
    } catch (e) {
      print("Error checking microphone permission: $e");
      return false;
    }
  }
}