import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meditate/application/bloc/bottomNavBar/bottomnavbar_cubit.dart';

import 'app_icon.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({Key key}) : super(key: key);

  static const iconSize = 35.0;
  static const iconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: IconButton(
          color: iconColor,
          icon: Icon(Icons.ac_unit_sharp),
          onPressed: () {
            Fluttertoast.showToast(
                msg: "Enjoy Your Day!", gravity: ToastGravity.CENTER);
          },
          iconSize: iconSize,
        ),
        title: AppIcon(),
        trailing: IconButton(
          color: iconColor,
          icon: Icon(Icons.today),
          onPressed: () {
            Fluttertoast.showToast(
                msg: "Checkout How Much You Listened!",
                gravity: ToastGravity.CENTER);

            BlocProvider.of<BottomnavbarCubit>(context).changeScreen(2);
          },
          iconSize: iconSize,
        ),
      ),
    );
  }
}
