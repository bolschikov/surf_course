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
  var color = Colors.yellow;
  double posX = 10;
  double posY = 10;
  final double side = 100;

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

  get curColor => color == Colors.yellow ? Colors.green : Colors.yellow;

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
            top: posY,  
            left: posX,
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,    
            child: RotationTransition(
              turns: _animation,
              child: MyAnimatedContainer(color: color, side: side)),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                setState(() => color = curColor);
              },
              onLongPress: () {
                setState(() => _controller.repeat());
              },
              onLongPressUp: () {
                setState(() => _controller.reset());
              },
              onHorizontalDragUpdate: (details){
                setState(() => posX = posX + details.delta.dx);
              },
              onVerticalDragUpdate: (details){
                setState(() => posY = posY + details.delta.dy);
              }
              
            )
          ) 
        ],
      ),
    );
  }
}

class MyAnimatedContainer extends StatelessWidget{
  final double side;
  final MaterialColor color;
  MyAnimatedContainer({required this.side, required this.color});
  
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      width: side,  
      height: side,
      color: color,
    );
  }

}
