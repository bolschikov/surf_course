import 'package:surf_dart_courses_template/Model/RawProductItem.dart';
import 'input_data.dart';

class OutputData{
  final Map _map = {};
  void addProduct(RawProductItem p){
    if(!_map.containsKey(p.categoryName)){
      _map[p.categoryName] = {};
    }
    if(!_map[p.categoryName].containsKey(p.subcategoryName)){
      _map[p.categoryName][p.subcategoryName] = [];
    }
    _map[p.categoryName][p.subcategoryName].add(p.name);
  }

  get data => _map;
}

void main() {
  final filtredData = InputData.data.where((product) => product.qty > 0 && product.expirationDate.compareTo(DateTime.now()) == 1);
  OutputData out = OutputData();
  filtredData.forEach(out.addProduct);
  print(out.data);
}