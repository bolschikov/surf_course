import 'dart:js';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int addCounter = 0;
  int removeCounter = 0;
  int counter = 0;
  void _increment(){
    setState(() {
      addCounter++;
      counter++;
    });
  }

  void _decrement(){
    if(counter > 0) {
      counter--;
    }
    setState(() {
      removeCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color appBarColor = Theme.of(context).colorScheme.inversePrimary;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:'
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text( 
                  '$addCounter ',
                  style: Theme.of(context).textTheme.headlineSmall
                ),
                SizedBox(width: 10),
                Text(
                  '$counter', 
                  style: Theme.of(context).textTheme.headlineMedium
                ),
                SizedBox(width: 10),
                Text(
                  ' $removeCounter',
                  style: Theme.of(context).textTheme.headlineSmall
                ), 
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: _increment, 
                  child: const Text("Add")
                ),
                TextButton(
                  onPressed: _decrement,
                  child: const Text("Remove")
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
