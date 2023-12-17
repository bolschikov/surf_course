
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task12/core/constatnts/constants.dart';
import 'package:task12/features/receipt/presentation/widgets/receipt_appbar.dart';

class ReceiptPageWidget extends ConsumerStatefulWidget{
  @override
  ConsumerState<ReceiptPageWidget> createState()  => _ReceiptWidgetState();
}

class _ReceiptWidgetState extends ConsumerState<ReceiptPageWidget>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: ReceiptAppBar(dateTime: DateTime.now(), numCheck: AppStrings.reciptNumber)
      ),
    );
  }
}