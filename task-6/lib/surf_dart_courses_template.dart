import 'dart:math';

abstract class Human {
  final String name;
  int age;
  Human({required this.name, required this.age});
}

enum PlayerPosition{ guard, forward }

class Player extends Human{
  final PlayerPosition position;
  int shots = 0;
  int blocks = 0;
  double _shotCoef = 0;
  double _blockCoef = 0;
  get KPI => shots * _shotCoef + blocks * _blockCoef;
  Player({required super.name, required super.age, required this.position}) { _initCoef(); }
  Player.guard({required super.name, required super.age}) : position = PlayerPosition.guard { _initCoef(); }
  Player.forward({required super.name, required super.age}) : position = PlayerPosition.forward { _initCoef(); }

  void _initCoef(){
    switch(position){
      case PlayerPosition.guard:
        _shotCoef = 0.3;
        _blockCoef = 0.9;
        break;
      case PlayerPosition.forward:
        _shotCoef = 0.9;
        _blockCoef = 0.3;
        break;
    }
  }

  @override
  String toString() {
    return "  Name: $name\nAge: $age\nPosition: ${position.name}\nkpi = $KPI\n";
  }
}

class Coach extends Human{
  int cups = 0;
  final String lvl;

  Coach({required super.name, required super.age, required this.lvl});
}

void main(){
  List<Player> team = [
    Player.guard(name: "John McLane ", age: 39),
    Player.guard(name: "John Wick", age: 37),
    Player.forward(name: "James Bond", age: 42),
    Player.forward(name: "Ethan Hunt", age: 39)
    ];
  Coach coach = Coach(name: "Jack Sparrow", age: 37, lvl: "Carribian master");

    simulateMatch(team);
    for(var i in team) print(i);
}

void simulateMatch(List <Player> team){
  for(var i in team){
    i.blocks = Random().nextInt(100);
    i.shots = Random().nextInt(100);
  }
} 
