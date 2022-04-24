import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "package:rsa_algorithm/src/configs/palette.dart";
import "package:rsa_algorithm/src/screens/view/main_screen.dart";
import 'package:rsa_algorithm/src/state_management/provider.dart';
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>   MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Msgs(),
        ),
      ],
    child: MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        backgroundColor: backGround,
        scaffoldBackgroundColor: backGround,
        // Define the default font family.
        primaryColor: grad1,
        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
          fontFamily: "robot_alien",
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(grad1)
          )

        )
      ),
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    ),
  );
}

