import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_appp/cubit/app_cubit_states.dart';
import 'package:flutter_cubit_appp/cubit/app_cubits.dart';
import 'package:flutter_cubit_appp/pages/detail_page.dart';
import 'package:flutter_cubit_appp/pages/nav_pages/home_page.dart';
import 'package:flutter_cubit_appp/pages/nav_pages/main_page.dart';
import 'package:flutter_cubit_appp/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  _AppCubitLogicsState createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) return WelcomePage();
          if (state is LoadingState)
            return Center(
              child: CircularProgressIndicator(),
            );
          if (state is LoadedState) return MainPage();
          if (state is DetailState) return DetailPage();
          return Container();
        },
      ),
    );
  }
}
