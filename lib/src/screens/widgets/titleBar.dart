// ignore_for_file: file_names, always_specify_types

import "package:bitsdojo_window/bitsdojo_window.dart";
import "package:flutter/material.dart";
import "package:rsa_algorithm/src/configs/palette.dart";

final WindowButtonColors buttonColors = WindowButtonColors(
    iconNormal: grad1,
    mouseOver: grad1,
    mouseDown: grad2,
    iconMouseOver: backGround,
    iconMouseDown: backGround);

final WindowButtonColors closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: grad1,
    iconMouseOver: backGround);

class WindowButtons extends StatelessWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
}