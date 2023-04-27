import 'package:flutter/material.dart';

snackBar(context, text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.only(right: 90, left: 90, bottom: 30),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    content: Text(text),
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.black.withOpacity(0.8),
    elevation: 0,
  ));
}
