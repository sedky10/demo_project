import 'package:demo_project/database/helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String ColumnId = 'id';
final String ColumnName = 'name';
final String Columnimage = 'image';
final String Columnsize = 'size';
final String Columnprice = 'price';
final String Columncolor = 'color';
final String ColumntableTodo = 'table_todo';

class DbHelper {
  late Database db;
  static final DbHelper instance = DbHelper._internal();

  factory DbHelper() {
    return instance;
  }

  DbHelper._internal();

  Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'todo.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
create table $ColumntableTodo (
  $ColumnId integer primary key autoincrement,
  $ColumnName text not null,
  $Columnimage text not null, 
  $Columnprice real not null,
  $Columncolor text not null,
  $Columnsize text not null)
''');
    });
  }

  Future<Helper> insertTodo(Helper todo) async {
    todo.id = await db.insert(ColumntableTodo, todo.tomap());
    return todo;
  }

  Future<int> deleteTodo(int id) async {
    return await db
        .delete(ColumntableTodo, where: '$ColumnId=?', whereArgs: [id]);
  }

  Future<List<Helper>> getAllTodo() async {
    List<Map<String, dynamic>> TodoMaps = await db.query(ColumntableTodo);
    if (TodoMaps.length == 0) {
      return [];
    } else {
      List<Helper> todos = [];
      TodoMaps.forEach((element) {
        todos.add(Helper.FromMap(element));
      });
      return todos;
    }
  }

  Future<int> updateTodo(Helper todo) async {
    return await db.update(ColumntableTodo, todo.tomap(),
        where: '$ColumnId = ?', whereArgs: [todo.id]);
  }

  Future close() async => db.close();
}
