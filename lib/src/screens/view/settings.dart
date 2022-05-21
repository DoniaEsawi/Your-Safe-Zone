// ignore_for_file: always_specify_types, avoid_print, duplicate_ignore

import "package:bitsdojo_window/bitsdojo_window.dart";
import "package:desktop_window/desktop_window.dart";
import "package:flutter/material.dart";
import "package:rsa_algorithm/src/configs/keys.dart";
import "package:rsa_algorithm/src/screens/widgets/titleBar.dart";

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WindowTitleBarBox(
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Image.asset("assets/logos/logo2.png",width: 30,),
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [


                          Expanded(child: MoveWindow()),
                          WindowButtons()
                        ]),
                  ),
                ],
              )),
          Expanded(
            child: Center(
              child: ElevatedButton(
                onPressed: ()async{
                  print(getMaxMsgLength(P_raghad, Q_raghad));
                  Size size = await DesktopWindow.getWindowSize();
                  // ignore: avoid_print
                  print(size);
                },
                child: const Text("get max length"),
              ),
            ),
          ),
        ],
      ),

    );
}
