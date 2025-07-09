
import n sei oq;
import n sei oq la;

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'dbrpg.db');

  return openDatabase(
    path,
    onCreate: (db, version){
      db.execute(PersonagemDAO.sqlTabelaPersonagem);
    },
    version: 1);
}
