import 'package:awesome_push/imports.dart';

void showSnack({
  required String title,
  required String message,
}) {
  Get.closeAllSnackbars();
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.TOP,
    barBlur: 20,
    margin: const EdgeInsets.all(16),
    duration: 3.hours,
  );
}
