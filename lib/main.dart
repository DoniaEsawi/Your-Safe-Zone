
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:rsa_algorithm/src/my_app.dart";



Future<void> main()async{

   WidgetsFlutterBinding.ensureInitialized();
  // // // Must add this line.
  //  await WindowManager.instance.ensureInitialized();
  // //
  // // // Use it only after calling `hiddenWindowAtLaunch`
  //  await WindowManager.instance.waitUntilReadyToShow().then((_) async{
  //   // set to frameless window
  //  // await windowmanager.instance.setasframeless();
  //   await windowmanager.instance.setfullscreen(false);
  //   await windowmanager.instance.setposition(offset.zero);
  //   windowmanager.instance.show();
  //    doWhenWindowReady(() {
  //      // ignore: always_specify_types
  //      final  win = appWindow;
  //      //final Size initialSize = Size(1500, );
  //      //win.hide();
  //      //win.minSize = initialSize;
  //      //win.size = initialSize;
  //      win.alignment = Alignment.center;
  //      win.title = "Custom window with Flutter";
  //      win.show();
  //
  //    });
   // });

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white
  ));
  Paint.enableDithering = true;
  runApp(const App());

// Add this code below
}


