import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/layout/news_App/cubit/cubit.dart';
import 'package:sample_app/layout/news_App/news_Layout.dart';
import 'package:sample_app/shared/bloc_Observer.dart';
import 'package:sample_app/shared/cubit/cubit.dart';
import 'package:sample_app/shared/cubit/states.dart';
import 'package:sample_app/shared/network/local/cache_Helper.dart';
import 'package:sample_app/shared/network/remote/dio_Helper.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool? isDarkMood = CacheHelper.getBool(key: "isDark");

  runApp(MyApp(isDarkMood: isDarkMood,));
}

class MyApp extends StatelessWidget
{
  MyApp({super.key, required this.isDarkMood});
  final bool? isDarkMood;

  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return NewsCubit()..getBusiness();
          },
        ),
        BlocProvider(
          create: (BuildContext context) {
            return AppCubit()..changeAppMode(fromShared: isDarkMood);
          },
        )
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          bool isDarkMood = AppCubit.get(context).isDarkMood;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark, // Brightness.light
                ),
                backgroundColor: Colors.white,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                titleSpacing: 20.0,
                iconTheme: IconThemeData(
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: Colors.white,
              ),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              textTheme: TextTheme(
                bodyMedium: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor("333739"),
              appBarTheme: AppBarTheme(
                systemOverlayStyle:  SystemUiOverlayStyle(
                  statusBarColor: HexColor("333739"),
                  statusBarIconBrightness: Brightness.light, // Brightness.light
                ),
                backgroundColor: HexColor("333739"),
                elevation: 0.0,
                titleTextStyle: const TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                titleSpacing: 20.0,
                iconTheme: const IconThemeData(
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20.0,
                backgroundColor: HexColor("333739"),
              ),
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ),
              textTheme: TextTheme(
                bodyMedium: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: isDarkMood ? ThemeMode.dark : ThemeMode.light,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}