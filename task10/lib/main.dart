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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  MaterialColor color = Colors.yellow;
  double posX = 10;
  double side = 100;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
    );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget makeMyWidget(MaterialColor color){
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      width: side,  
      height: side,
      color: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color appBarColor = Theme.of(context).colorScheme.inversePrimary;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(widget.title),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
            top: MediaQuery.of(context).size.height / 2 - side / 2,  
            left: posX,
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,    
            child: RotationTransition(turns: _animation, child: makeMyWidget(color)),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                setState(() => color = color == Colors.yellow ? Colors.green : Colors.yellow);
              },
              onLongPress: () {
                setState(() => _controller.forward(from: 0.0));
              },
              onHorizontalDragUpdate: (details){
                setState(() => posX = posX + details.delta.dx);
              },
            )
          ) 
        ],
      ),
    );
  }
}
