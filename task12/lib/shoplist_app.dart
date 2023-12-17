import 'package:flutter/material.dart';
import 'package:task12/features/receipt/presentation/pages/receipt_page.dart';
class ShopListApp extends StatelessWidget {
  const ShopListApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Gilroy',
        primarySwatch: Colors.blue,
      ),
      home: ReceiptPageWidget(),
    );
  }
}
