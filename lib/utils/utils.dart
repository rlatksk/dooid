import 'package:flutter/material.dart';

String? uValidator({
  required String value,
  bool isRequired = false,
  bool isEmail = false,
  int? minLength,
  String? match,
}) {
  if (isRequired) {
    if (value.isEmpty) {
      return 'Required';
    }
  }

  if (isRequired && isEmail) {
    if (!value.contains('@') || !value.contains('.')) {
      return 'Invalid Email';
    }
  }

  if (minLength != null) {
    if (value.length < minLength) {
      return 'Minimum $minLength characters';
    }
  }

  if (match != null) {
    if (value != match) {
      return 'Not Match';
    }
  }

  return null;
}

void showSnackbar({
  required BuildContext context,
  required String message,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: Color(0xFFFF5151),
    ),
  );
}
