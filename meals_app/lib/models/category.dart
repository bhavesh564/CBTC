import 'package:flutter/material.dart';

class Category {
  Category({required this.id, required this.title, this.color = Colors.orange});

  final id;
  final title;
  final Color color;
}
