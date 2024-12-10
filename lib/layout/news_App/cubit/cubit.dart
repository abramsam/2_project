import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/layout/news_App/cubit/states.dart';
import 'package:sample_app/modules/business/business_Screen.dart';
import 'package:sample_app/modules/science/science_Screen.dart';
import 'package:sample_app/modules/sports/sports_Screen.dart';
import 'package:sample_app/shared/network/remote/dio_Helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "Business",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "Sports",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "Science",
    ),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    switch(index) {
      case 1 :
        getSports();
        break;

      case 2 :
        getScience();
        break;
    }
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());

    DioHelper.getData(
      url: "v2/top-headlines",
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      // print(value.data["articles"][0]["title"].toString());
      business = value.data["articles"];
      print(business);

      emit(NewsGetBusinessSuccessState());
    },).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());

    if(sports.isNotEmpty) {
      emit(NewsGetSportsSuccessState());

    } else{
      DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        // print(value.data["articles"][0]["title"].toString());
        sports = value.data["articles"];
        print(sports[0]["title"]);

        emit(NewsGetSportsSuccessState());
      },).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });
    }
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());

    if(science.isNotEmpty) {
      emit(NewsGetScienceSuccessState());

    } else {
      DioHelper.getData(
        url: "v2/top-headlines",
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
        },
      ).then((value) {
        // print(value.data["articles"][0]["title"].toString());
        science = value.data["articles"];
        print(science[0]["title"]);

        emit(NewsGetScienceSuccessState());
      },).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });
    }
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      url: "v2/everything",
      query: {
        'q': value,
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
      },
    ).then((value) {
      // print(value.data["articles"][0]["title"].toString());
      search = value.data["articles"];
      print(search[0]["title"]);

      emit(NewsGetSearchSuccessState());
    },).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}