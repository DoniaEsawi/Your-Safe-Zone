import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:rsa_algorithm/src/configs/palette.dart";
import "package:rsa_algorithm/src/screens/view/main_screen.dart";
import "package:rsa_algorithm/src/state_management/provider.dart";
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) =>   MultiProvider(
      // ignore: always_specify_types
      providers: [
        // ignore: always_specify_types
        ChangeNotifierProvider.value(
          value: Msgs(),
        ),
      ],
    child: MaterialApp(

      theme: ThemeData(
        // Define the default brightness and colors.
        backgroundColor: backGround,
        scrollbarTheme: ScrollbarThemeData(
          //trackColor: MaterialStateProperty.all(grad1),
          thumbColor: MaterialStateProperty.all(Colors.white30),
        ),
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

