import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/shared/components/components.dart';
import 'package:sample_app/shared/cubit/cubit.dart';
import 'package:sample_app/shared/cubit/states.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return AppCubit()..createDatabase();
      },
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context,AppStates state) {
          if(state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context,AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text(
                cubit.titles[cubit.currentIndex],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35.0,
                ),
              ),
            ),
            body: state is AppGetDatabaseLoadingState ? const Center(
              child: CircularProgressIndicator(),
            ): cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: "Tasks",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                  label: "Done",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: "Archived",
                ),
              ],
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                cubit.ChangeIndex(index);
              },
              // elevation: 15.0,
              // showSelectedLabels: false,
              currentIndex: cubit.currentIndex,
              selectedItemColor: Colors.blue,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                /*try{
                String name = await getName();
                print(name);
                //throw("Errrrrrrrrrrrrorrrrrrrrrrr !!!!");
                }catch(error){
                  print("error : ${error.toString()}");
                }*/
                /*getName().then((String value) {
                  print(value);
                  //throw("Errrrrrrrrrrrrorrrrrrrrrrr !!!!");
                }).catchError((error) {
                  *//*print(error.toString());
                // Return a value of type Never*//*
                  return Future<Never>.error(error);
                });*/

                if(!cubit.isBottomSheetShown) {
                  scaffoldKey.currentState?.showBottomSheet(
                    elevation: 20.0,
                    (context){
                      return Container(
                        color: Colors.white,
                        padding: const EdgeInsetsDirectional.all(10.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defaultTextFormField(
                                controller: titleController,
                                keyboardType: TextInputType.text,
                                validator: (String? value) {
                                  if(value!.isEmpty){
                                    return "title must not be empty";
                                  }
                                  return null;
                                },
                                labelText: "Task title",
                                hintText: 'Task title',
                                prefixIcon: const Icon(Icons.title),
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              defaultTextFormField(
                                  controller: dateController,
                                  keyboardType: TextInputType.datetime,
                                  validator: (String? value) {
                                    if(value!.isEmpty){
                                      return "date must not be empty";
                                    }
                                    return null;
                                  },
                                  labelText: "Task date",
                                  hintText: "Task date",
                                  prefixIcon: const Icon(Icons.calendar_today),
                                  onTap: () {
                                    print("date tapped");

                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.parse("2021-05-03"),
                                      lastDate: DateTime.now(),
                                    ).then((DateTime? value) {
                                      print(DateFormat("yyyy-MM-dd"/*yMMMd <=// good*/).format(value!));
                                      dateController.text = DateFormat("yyyy-MM-dd").format(value);
                                    }).catchError((error){});
                                  }
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              defaultTextFormField(
                                  controller: timeController,
                                  keyboardType: TextInputType.datetime,
                                  validator: (String? value) {
                                    if(value!.isEmpty){
                                      return "time must not be empty";
                                    }
                                    return null;
                                  },
                                  labelText: "Task time",
                                  hintText: "Task time",
                                  prefixIcon: const Icon(Icons.watch_later_outlined),
                                  onTap: () {
                                    print("timing tapped");

                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((TimeOfDay? value){
                                      print(value!.format(context));
                                      timeController.text = value.format(context);
                                    }).catchError((error){});
                                  }
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  ).closed.then((value) {
                    cubit.changeBottomSheetState(state: false);
                  }).catchError((error) {});
                  cubit.changeBottomSheetState(state: true);
                }else {
                  if(formKey.currentState!.validate()) {
                    cubit.insertToDatabase(
                      title: titleController.text,
                      date: dateController.text,
                      time: timeController.text,
                    );
                  }
                }
              },
              backgroundColor: Colors.blue,
              child: Icon(
                !cubit.isBottomSheetShown? Icons.edit : Icons.add,
                color: Colors.white,
                size: 35.0,
              ),
            ),
          );
        },
      ),
    );
  }

  // Future<String> getName() async => "Ahmed Ali";
}
