import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task12/shoplist_app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: ShopListApp(),
    )
  );
}