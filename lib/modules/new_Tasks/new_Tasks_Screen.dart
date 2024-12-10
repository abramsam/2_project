import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/shared/components/components.dart';
import 'package:sample_app/shared/cubit/cubit.dart';
import 'package:sample_app/shared/cubit/states.dart';

class NewTasksScreen extends StatelessWidget {
  NewTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates state) {},
      builder: (BuildContext context, AppStates state) {
        var tasks = AppCubit.get(context).newTasks;

        return tasksBuilder(tasks: tasks);
      },
    );
  }
}
