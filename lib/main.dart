
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:rsa_algorithm/src/my_app.dart";


import "package:window_manager/window_manager.dart";

Future<void> main()async{

  WidgetsFlutterBinding.ensureInitialized();
  //Must add this line.
  await windowManager.ensureInitialized();

  // Use it only after calling `hiddenWindowAtLaunch`
  await windowManager.waitUntilReadyToShow().then((_) async{
    // Set to frameless window
    await windowManager.setMinimumSize(const Size(840, 600));
    //windowManager.setAsFrameless();
    windowManager.show();
  });
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white
  ));
  Paint.enableDithering = true;
  runApp(const App());

// Add this code below
}


