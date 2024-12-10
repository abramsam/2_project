import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/layout/news_App/cubit/cubit.dart';
import 'package:sample_app/layout/news_App/cubit/states.dart';
import 'package:sample_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (BuildContext context, NewsStates state) {},
      builder: (BuildContext context, NewsStates state) {
        List<dynamic> list = NewsCubit.get(context).search;
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.all(20.0),
                  child: defaultTextFormField(
                      controller: searchController,
                      hintText: "Search",
                      hintStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      labelText: "Search",
                      labelStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      prefixIcon: const Icon(Icons.search),
                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if(value!.isEmpty) {
                          return "Search must not be empty";
                        }

                        return null;
                      },
                      onChanged: (String value) {
                        NewsCubit.get(context).getSearch(value);
                      }
                  ),
                ),
                Expanded(
                  child: articleBuilder(list, context, isSearch: true),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
