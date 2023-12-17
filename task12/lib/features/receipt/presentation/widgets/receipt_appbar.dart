import 'package:flutter/material.dart';

import '../../../../core/constatnts/constants.dart';

class ReceiptAppBar extends StatelessWidget{
  final DateTime dateTime;
  final int numCheck;
  
  const ReceiptAppBar({required this.dateTime, required this.numCheck, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return AppBar(
      elevation: 0,
      title:
      Center(
        child: Column(
          children: [
            Text(
              "${AppStrings.receiptAppBarTitle} $numCheck",
              style: const TextStyle(fontSize: 25),
            ),
            Text(
              "${dateTime.day}.${dateTime.month}.${dateTime.year} ${AppStrings.receiptAppBarPreposition} ${dateTime.hour}:${dateTime.minute}",
              style: const TextStyle(
                fontSize: 15,
                color: AppColors.gray
              ),
            ),
          ],
        ),
      ),
      leading: const Icon(
        Icons.arrow_back,
        color: AppColors.green,
      ),
    );
  }
}