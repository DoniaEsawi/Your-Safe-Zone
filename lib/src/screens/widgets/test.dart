// ignore_for_file: lines_longer_than_80_chars, always_specify_types, always_put_required_named_parameters_first

import "package:flutter/material.dart";
import "package:stringr/stringr.dart";



class TestString extends StatefulWidget {
  const TestString({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _TestStringState createState() => _TestStringState();
}

class _TestStringState extends State<TestString> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          cardWidget(
              "camelCase", "XMLHttpRequest", "XMLHttpRequest".camelCase()),
          cardWidget("camelCase", "/home/Kb/code/stringr",
              "/home/Kb/code/stringr".camelCase()),
          cardWidget("capitalize", "яблоко", "яблоко".capitalize()),
          cardWidget("codePointAt", "\uD835\uDC00\uD835\uDC01",
              "\uD835\uDC00\uD835\uDC01".codePointAt(2).toString()),
          cardWidget(
              "graphemeAt",
              "\uD834\uDF06\u0303\u035C\u035D\u035Ebar\uD834\uDF06\u0303\u035C\u035D".replaceAll(r"\u", r"\ii"),
              "foo\uD834\uDF06\u0303\u035C\u035D\u035Ebar\uD834\uDF06\u0303\u035C\u035D"
                  .graphemeAt(3)),
          cardWidget("prune", "Привет как дела", "Привет как дела".prune(10)),
          cardWidget("prune", "La variété la plus fréquente est la blanche",
              "La variété la plus fréquente est la blanche".prune(12)),
          cardWidget("truncate", "Is this where you wanna go",
              "Is this where you wanna go".truncate(10)),
        ],
      ),
    );

  Widget cardWidget(String libFunc, String input, String output) => Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Function - $libFunc"),
        Text("Input - $input"),
        Text("Output - $output")
      ],
    ),
  );
}