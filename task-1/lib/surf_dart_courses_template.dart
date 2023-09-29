enum Countries { brazil, russia, turkish, spain, japan }

class Territory {
  final int areaInHectare;
  final List<String> crops;
  final List<AgriculturalMachinery> machineries;

  Territory(
    this.areaInHectare,
    this.crops,
    this.machineries,
  );
}

class AgriculturalMachinery {
  final String id;
  final DateTime releaseDate;

  AgriculturalMachinery(
    this.id,
    this.releaseDate,
  );

  /// Переопределяем оператор "==", чтобы сравнивать объекты по значению.
  @override
  bool operator ==(Object? other) {
    if (other is! AgriculturalMachinery) return false;
    if (other.id == id && other.releaseDate == releaseDate) return true;

    return false;
  }

  @override
  int get hashCode => id.hashCode ^ releaseDate.hashCode;
}

final mapBefore2010 = <Countries, List<Territory>>{
  Countries.brazil: [
    Territory(
      34,
      ['Кукуруза'],
      [
        AgriculturalMachinery(
          'Трактор Степан',
          DateTime(2001),
        ),
        AgriculturalMachinery(
          'Культиватор Сережа',
          DateTime(2007),
        ),
      ],
    ),
  ],
  Countries.russia: [
    Territory(
      14,
      ['Картофель'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Гранулятор Антон',
          DateTime(2009),
        ),
      ],
    ),
    Territory(
      19,
      ['Лук'],
      [
        AgriculturalMachinery(
          'Трактор Гена',
          DateTime(1993),
        ),
        AgriculturalMachinery(
          'Дробилка Маша',
          DateTime(1990),
        ),
      ],
    ),
  ],
  Countries.turkish: [
    Territory(
      43,
      ['Хмель'],
      [
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
        AgriculturalMachinery(
          'Сепаратор Марк',
          DateTime(2005),
        ),
      ],
    ),
  ],
};

final mapAfter2010 = {
  Countries.turkish: [
    Territory(
      22,
      ['Чай'],
      [
        AgriculturalMachinery(
          'Каток Кирилл',
          DateTime(2018),
        ),
        AgriculturalMachinery(
          'Комбаин Василий',
          DateTime(1998),
        ),
      ],
    ),
  ],
  Countries.japan: [
    Territory(
      3,
      ['Рис'],
      [
        AgriculturalMachinery(
          'Гидравлический молот Лена',
          DateTime(2014),
        ),
      ],
    ),
  ],
  Countries.spain: [
    Territory(
      29,
      ['Арбузы'],
      [
        AgriculturalMachinery(
          'Мини-погрузчик Максим',
          DateTime(2011),
        ),
      ],
    ),
    Territory(
      11,
      ['Табак'],
      [
        AgriculturalMachinery(
          'Окучник Саша',
          DateTime(2010),
        ),
      ],
    ),
  ],
};

void main() {
  final fractionDigits = 1;
  Map<int, AgriculturalMachinery> mapAllAgriculturalMachines = {};
  /*Set<AgriculturalMachinery> setAllAgriculturalMachines = {};*/
  List<int> listAges = [];
  findUniqAgriculturalMachinery(mapBefore2010, mapAllAgriculturalMachines, /*setAllAgriculturalMachines*/);
  findUniqAgriculturalMachinery(mapAfter2010, mapAllAgriculturalMachines, /*setAllAgriculturalMachines*/);
  mapAllAgriculturalMachines.forEach((key, value) => listAges.add(DateTime.now().year - value.releaseDate.year));
  listAges.sort();
  final mean = getMean(listAges);
  final median = getMedian(listAges);
  print("1: ");
  printAges(mean, median, fractionDigits);
  var listOldest = listAges.where((element) => element >= median);
  final meanOldest = getMean(listOldest);
  final medianOldest = getMedian(listOldest);
  print("2: ");
  printAges(meanOldest, medianOldest, fractionDigits);
}

void findUniqAgriculturalMachinery(Map<Countries, List<Territory>> map, Map<int, AgriculturalMachinery> retMap, /*Set<AgriculturalMachinery> retSet*/){
  for(var country in map.entries){
    for(var territory in country.value){
      for(var machine in territory.machineries){
        retMap[machine.hashCode] = machine;
        /*retSet.add(machine);*/
      }
    }
  }
}

double getMean(Iterable<int> list){
  return  list.fold(0, (prevElem, elem) => prevElem + elem)/list.length;
}

double getMedian(Iterable<int> list){
  int n = list.length ~/ 2;
  return list.length % 2 == 0 ? (list.elementAt(n) + list.elementAt(n - 1)) / 2 : list.elementAt(n).toDouble();
}

void printAges(double mean, double median, int precision){
  print("mean = ${mean.toStringAsFixed(precision)} median = ${median.toStringAsFixed(precision)}");
}