import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meditate/application/bloc/currently_playing/audio_model_cubit.dart';
import 'package:meditate/application/service_locator.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key key}) : super(key: key);

  static final textScaleFactor = 1.15;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Go Back",
              style: TextStyle(color: Colors.blue),
              textScaleFactor: textScaleFactor,
            ),
          ),
          TextButton(
            onPressed: () {
              try {
                if (getIt<AudioModelCubit>().state.playlist != null) {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed("/playlist");
                  return;
                }

                Fluttertoast.showToast(msg: "Select a Playlist!");
                Navigator.pop(context);
                Navigator.pop(context);
              } catch (e) {
                print(e);
              }
            },
            child: Text(
              "See Playlist",
              style: TextStyle(color: Colors.red),
              textScaleFactor: textScaleFactor,
            ),
          ),
        ],
      ),
    );
  }
}
