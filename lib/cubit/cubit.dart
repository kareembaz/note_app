import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notebook/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class NoteCubit extends Cubit<NodeStates> {
  NoteCubit() : super(initialState());

  NoteCubit get(context) => BlocProvider.of(context);

  List<dynamic>? notes;
  late Database? database;
  void CreateDatabase() {
    openDatabase(
      'note1.db',
      version: 1,
      onCreate: (database, version) {
        print('the database is create');
        database
            .execute(
                'CREATE TABLE note (id INTEGER PRIMARY KEY,title TEXT,body TEXT,date TEXT,time TEXT)')
            .then((value) {
          print('The Tables is create');
        }).catchError((error) {
          print('Error When Create Tables ${error.toString()}');
        });
      },
      onOpen: (database) {
        print('database is opened');
        getDatabase(database);
      },
    ).then((value) {
      database = value;
      emit(createDatabaseState());
    });
  }

  void insertIntoDatabase({
    String? title,
    String? body,
    String? date,
    String? time,
  }) async {
    print('this is insert');
    await database?.transaction((txn) => txn
            .rawInsert(
          'INSERT INTO note(title ,body ,date ,time) VALUES("$title","$body","$date","$time")',
        )
            .then((value) {
          emit(insertIntoDatabaseState());
          print('${value} insert Completely ');

          getDatabase(database);
        }).catchError((error) {
          print('${error} in here not completely the insesrt');
        }));
  }

  void getDatabase(database) {
    notes = [];
    emit(getDatabaseLoadingState());
    return database!.rawQuery('SELECT * FROM note').then((value) {
      value.forEach((element) {
        notes!.add(element);
      });
      emit(getDatabaseState());
    });
  }
}
