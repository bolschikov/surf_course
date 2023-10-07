const articles = '''
  1,хлеб,Бородинский,500,5
  2,хлеб,Белый,200,15
  3,молоко,Полосатый кот,50,53
  4,молоко,Коровка,50,53
  5,вода,Апельсин,25,100
  6,вода,Бородинский,500,5
  ''';

const CATEGORY = 'вода';
const PRICE = 200;
const AMOUNT = 50;

class Product{
  int id = 0;
  String category = '';
  String name = '';
  int price = 0;
  int amount = 0;

  Product(this.id, this.category, this.name, this.price, this.amount);
  Product.fromList(List<String> items) : 
    this(int.parse(items[0]), items[1], items[2], int.parse(items[3]), int.parse(items[4]));
  
  @override
  String toString() {
    return "$id $category $name $price рублей $amount шт";
  }
}

abstract interface class Filter<T>{
  bool apply(Product product);
}

class FilterCategory implements Filter<String>{
  String item;

  FilterCategory(this.item);

  @override
  bool apply(Product product) => product.category == item;
}

class FilterPriceLessOrEqueal implements Filter<int>{
  int item;

  FilterPriceLessOrEqueal(this.item);

  @override
  bool apply(Product product) => product.price <= item;
}

class FilterAmountLessThan implements Filter<int>{
  int item;

  FilterAmountLessThan(this.item);

  @override
  bool apply(Product product) => product.amount < item;
}

List<Product?> applyFilter(List<Product> products, Filter filter){
  return products.where((p) => filter.apply(p)).toList();
}

void main(){
  final products = articles.split('\n')
                            .where((line) => line.length > 10)
                            .map((line) => Product.fromList(line.split(',')))
                            .toList();

  final filters = <Filter>[
    FilterCategory(CATEGORY), 
    FilterPriceLessOrEqueal(PRICE),
    FilterAmountLessThan(AMOUNT)
  ];

  for(var f in filters){
    applyFilter(products, f).forEach(print);
    print('\n');
  }                              
}