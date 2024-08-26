import 'package:delivery_app/sqflite/login_token/login.model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LoginServiceSqflite {
  static late final Database database;

  // Método de inicialización de la base de datos
  static Future<Database> init() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'logindeliveryapp.db');
    final db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE login(id INTEGER PRIMARY KEY AUTOINCREMENT, token INTEGER, email VARCHAR(100), password VARCHAR(150))',
        );
      },
    );
    database = db;
    return db;
  }

  // Método para obtener todos los registros
  static Future<List<LoginModel>> findAll() async {
    final data = await database.query('login');
    List<LoginModel> result = data
        .map(
          (element) => LoginModel.fromMap(element),
        )
        .toList();
    print(data);
    print('obteniendo data');
    return result;
  }

  // Método para insertar un nuevo registro
  static Future<bool> insert(LoginModel body) async {
    // Verifica el mapa antes de insertarlo
    print('Inserting LoginModel with values: ${body.toMap()}');

    final result = await database.insert('login', body.toMap());

    if (result != 0) {
      print('insertado');
      print(await findAll()); // Espera a que findAll termine
      return true;
    } else {
      print('no insertado');
      return false;
    }
  }


  static Future<void> delete(LoginModel body) async{
    final result = await database.delete('login', where: 'token = ?', whereArgs: [body.token]);
    print(result);
    print(findAll());
  }
}
