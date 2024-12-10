import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/modules/archived_Tasks/archived_Tasks_Screen.dart';
import 'package:sample_app/modules/done_Tasks/done_Tasks_Screen.dart';
import 'package:sample_app/modules/new_Tasks/new_Tasks_Screen.dart';
import 'package:sample_app/shared/cubit/states.dart';
import 'package:sample_app/shared/network/local/cache_Helper.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of<AppCubit>(context);

  int currentIndex = 0;

  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];

  List<String> titles = const [
    "New Tasks",
    "Done Tasks",
    "Archived Tasks"
  ];
  
  bool isBottomSheetShown = false;
  late Database database;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  void createDatabase() {
    openDatabase(
      "todo.db",
      version: 1,
      onCreate: (database, version) {
        database.execute(
          "CREATE TABLE tasks ("
              "id INTEGER PRIMARY KEY,"
              "title TEXT NOT NULL,"
              "date TEXT NOT NULL,"
              "time TEXT NOT NULL,"
              "status TEXT NOT NULL)",
        ).then((value) => print("Table created")
        ).catchError((error) => Future<Never>.error(error));

        print("Database created");
      },
      onOpen: (database) async {
        print("Database opened");

        getDataFromDatabase(database);
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    },);
  }

  void insertToDatabase({
    required String title,
    required String date,
    required String time,
  }) async {
    await database.transaction((txn) async {
      await txn.rawInsert(
          "INSERT INTO tasks (title, date, time, status)"
          "VALUES ('$title', '$date', '$time', 'new')"
      ).then((value) {
        print("inserted successfully : $value");
        emit(AppInsertDatabaseState());

        getDataFromDatabase(database);
      }).catchError((error) => Future<Never>.error(error));
    });
  }

  void updateDatabase({
    required String status,
    required int id,
  }) {
    database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        [status, id,]
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    },);
  }

  void deleteDatabase({required int id}) {
    database.rawDelete(
        'DELETE FROM tasks WHERE id = ?',
        [id,]
    ).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    },);
  }

  void getDataFromDatabase(Database database) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];

    emit(AppGetDatabaseLoadingState());
    database.rawQuery("SELECT * FROM tasks").then((value) {
      value.forEach((element) {
        if(element["status"] == "new"){
          newTasks.add(element);
        } else if(element["status"] == "done") {
          doneTasks.add(element);
        } else if(element["status"] == "archived") {
          archivedTasks.add(element);
        }
      });

      emit(AppGetDatabaseState());
    });
  }

  void ChangeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarStates());
  }

  void changeBottomSheetState({required bool state}) {
    isBottomSheetShown = state;
    emit(AppChangeBottomSheetStates());
  }

  bool isDarkMood = false;
  void changeAppMode({bool? fromShared}) {
    if(fromShared != null)
    {
      isDarkMood = fromShared;
      emit(AppChangeModeStates());
    } else {
      isDarkMood = !isDarkMood;

      CacheHelper.putBool(key: "isDark", value: isDarkMood
      ).then((value) {
        emit(AppChangeModeStates());
      },
          onError: (error) {}
      );
    }
  }
}