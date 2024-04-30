// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';

class Failure {
  final int code;
  final String message;
  final String status;

  Failure({
    required this.code,
    required this.message,
    required this.status,
  });
}

Future<String> handleDioError(DioError error) async {
  final response = error.response;
  if (response?.statusCode == 403) {
    final customFailure = Failure(
      code: response!.statusCode!,
      message: response.data["message"],
      status: response.data["status"],
    );

    // Now you can handle the custom failure as needed.
    // For demonstration purposes, let's return the error message:
    return 'Custom Failure: ${customFailure.message}';
  }
  // Handle other error types or return a default message if needed.
  return 'An unexpected error occurred.';
}
