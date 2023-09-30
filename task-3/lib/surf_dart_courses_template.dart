import 'dart:math';

class Position2D{
  double x;
  double y;
  Position2D({ required this.x, required this.y });
}

abstract class ControlManagement{
  void moveForward();
  void moveBack();
}
abstract class GameObject{
  final String name;
  final Position2D pos2D;
  String _color = "#ffffff";
  double? _movementShift;
  double? _speed;
  GameObject({required this.name, required this.pos2D});

  set color(String color){
    if(color[0] == "#") 
      _color = color;
  }

  @override
  String toString() {
    return '$name\n position = (${pos2D.x}, ${pos2D.y})\n color = $_color';
  }

  void show();
}

class Player extends GameObject implements ControlManagement{

  Player(String name) : super(name: name, pos2D: Position2D(x: 0, y: 0)){
    _speed = 10;
    _movementShift = 0.3;
  }
  
  @override
  void moveBack(){
    this.pos2D.x -= _movementShift! * _speed!;
  }

  @override
  void moveForward(){
    this.pos2D.x += _movementShift! * _speed!;
  }

  @override
  void show(){
    /*
    TODO:
    */
  }

}

class Enemy extends GameObject{
  static const double maxXPos = 150;
  static int _count = 0;

  get allAmountOfEnemies => _count;
  Enemy(String name, Position2D pos) : super(name: name, pos2D: pos){
    _count++;
  }
  Enemy.fastRandomSpawn() : super(name: "Enemy${_count + 1}", pos2D:
    Position2D(x: (Random().nextDouble() * Enemy.maxXPos), y: 0)){
      _count++;
    }

    @override
  void show(){
    /*
    TODO:
    */
  }
}

void main(){
  Player player = Player('Player');
  player.moveForward();
  print(player);
}
