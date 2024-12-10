import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/layout/news_App/cubit/cubit.dart';
import 'package:sample_app/layout/news_App/cubit/states.dart';
import 'package:sample_app/shared/components/components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, NewsStates  state) {},
        builder: (BuildContext context, NewsStates  state) {
          return articleBuilder(NewsCubit.get(context).sports, context);
        }
    );
  }
}
