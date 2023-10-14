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
  int rmvCounter = 0;
  int cntr = 0;
  _increment(){
    setState(() {
      addCounter++;
      cntr++;
    });
  }

  _decrement(){
    if(cntr > 0) {
      cntr--;
    }
    setState(() {
      rmvCounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
                  '$cntr', 
                  style: Theme.of(context).textTheme.headlineMedium
                ),
                SizedBox(width: 10),
                Text(
                  ' $rmvCounter',
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
