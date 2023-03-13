import 'package:ltdidong2/src/data/history.dart';
import 'package:sqflite/sqflite.dart';

class HistoryService {
  HistoryService._privateConstructor();

  static final HistoryService _instance = HistoryService._privateConstructor();
  late Database _database;

  factory HistoryService() {
    return _instance;
  }
  final List<History> data = [];
  Future<void> addHistory(History newItem) async {
    data.add(newItem);
    // _database.insert('item_data', newItem.toJson());
  }

  Future<void> deleteAll() async {
    data.clear();
  }

  Future<void> getAll() async {
    String directory = await getDatabasesPath();
    String path = directory + "sela.db";
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
    create table item_data ( 
      chocolate BOOLEAN,
      index INTEGER,
      cream BOOLEAN,
      quantity INTEGER,
      status text, 
      price REAL
      )
    ''');
    });
    dynamic test = await _database.query('item_data');
    print(test);
  }

  Future<List<History>> searchItem(int quantity) async {
    List<History> result =
        data.where((element) => element.quantity == quantity).toList();
    return result;
  }

  Future<void> updateStatus(int index) async {
    String value = "";
    if (data[index].status == "Đang chế biến") {
      value = "Đã phục vụ";
    } else {
      value = "Đã thanh toán";
    }

    data[index] = History(
      index: data[index].index,
      chocolate: data[index].chocolate,
      cream: data[index].cream,
      price: data[index].price,
      quantity: data[index].quantity,
      status: value,
    );
  }

  Future<void> deleteByIndex(int index) async {
    data.removeAt(index);
  }
}
