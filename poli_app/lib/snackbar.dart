import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Kumpulan template widget snackbar
///
/// Terdapat 4 fungsi yang tersedia [info, warning, success, error]
class Snackbar {
  /// Snackbar untuk menampilkan informasi
  /// parameter berisi 'pesan'
  static void info(String message) {
    GetBar _infoSnackbar(String? message) => GetBar(
          backgroundColor: Colors.black,
          message: message,
          duration: const Duration(seconds: 2),
          leftBarIndicatorColor: Colors.blue[300],
          icon: const Icon(
            Icons.info,
            color: Colors.blue,
          ),
        );

    Get.showSnackbar(_infoSnackbar(message));
  }

  /// Snackbar untuk menampilkan peringatan,
  /// parameter berisi 'pesan'
  static void warning(String? message) {
    GetBar _warningSnackbar(String? message) => GetBar(
          backgroundColor: Colors.black,
          message: message,
          duration: const Duration(seconds: 2),
          leftBarIndicatorColor: Colors.orange,
          icon: const Icon(
            Icons.warning,
            color: Colors.orange,
          ),
        );

    Get.showSnackbar(_warningSnackbar(message));
  }

  /// Snackbar untuk menampilkan pesan error,
  /// parameter berisi 'pesan'
  static void error(String? message) {
    GetBar _errorSnackbar(String? message) => GetBar(
          backgroundColor: Colors.black,
          message: message,
          duration: const Duration(seconds: 2),
          leftBarIndicatorColor: Colors.red,
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ),
        );

    Get.showSnackbar(_errorSnackbar(message));
  }

  /// Snackbar untuk menampilkan pesan apabila terdapat aksi yang dianggap telah selesai
  /// atau sukses, parameter berisi 'pesan'
  static void success(String message) {
    GetBar _successSnackbar(String? message) => GetBar(
          backgroundColor: Colors.black,
          message: message,
          duration: const Duration(seconds: 2),
          leftBarIndicatorColor: Colors.green,
          icon: const Icon(
            Icons.check,
            color: Colors.green,
          ),
        );

    Get.showSnackbar(_successSnackbar(message));
  }
}
