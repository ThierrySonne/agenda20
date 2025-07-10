
import "package:agenda20/database/personagem_dao.dart";
import "package:path/path.dart";
import "package:sqflite/sqflite.dart";


Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'dbrpg.db');

  return openDatabase(
    path,
    onCreate: (db, version){
      db.execute(PersonagemDAO.sqlTabelaPersonagem);
    },
    version: 1);
}
