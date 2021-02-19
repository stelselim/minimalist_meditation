import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meditate/application/bloc/bottomNavBar/bottomnavbar_cubit.dart';
import 'package:meditate/constant/routes/routes.dart';
import 'package:meditate/constant/styles/color.dart';

import 'package:meditate/presentation/screens/screens.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomnavbarCubit, BottomnavbarState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(
            child: IndexedStack(
              index: state.index,
              children: [
                HomeScreen(),
                CategoriesScreen(),
                StatsScreen(),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, playerScreenRoute);
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: false,
            iconSize: 30,
            selectedItemColor: Colors.white,
            elevation: 0,
            backgroundColor: backgroundColor,
            currentIndex: state.index,
            onTap: (index) =>
                BlocProvider.of<BottomnavbarCubit>(context).changeScreen(index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.home,
                  color: Colors.white,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.category_rounded,
                  color: Colors.white,
                ),
                label: "Category",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.chart_bar_alt_fill,
                  color: Colors.white,
                ),
                label: "Stats",
              ),
            ],
          ),
        );
      },
    );
  }
}
