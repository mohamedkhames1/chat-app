import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(title)));
}