import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meditate/application/bloc/bottomNavBar/bottomnavbar_cubit.dart';
import 'package:meditate/constant/routes/routes.dart';

import 'package:meditate/presentation/screens/screens.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomnavbarCubit, BottomnavbarState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("HELLO"),
          ),
          body: IndexedStack(
            index: state.index,
            children: [
              HomeScreen(),
              CategoriesScreen(),
              StatsScreen(),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, playerScreenRoute);
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.index,
            onTap: (index) =>
                BlocProvider.of<BottomnavbarCubit>(context).changeScreen(index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: "Category",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.show_chart),
                label: "Stats",
              ),
            ],
          ),
        );
      },
    );
  }
}
