// ignore_for_file: lines_longer_than_80_chars, always_specify_types

import "package:bitsdojo_window/bitsdojo_window.dart";
import "package:clay_containers/clay_containers.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:rsa_algorithm/src/configs/palette.dart";
import "package:rsa_algorithm/src/screens/view/main_screen.dart";
import "package:rsa_algorithm/src/screens/widgets/chat_section.dart";
import "package:rsa_algorithm/src/screens/widgets/reciever_chat.dart";
import "package:rsa_algorithm/src/screens/widgets/sender_chat.dart";
import "package:rsa_algorithm/src/screens/widgets/titleBar.dart";
import "package:rsa_algorithm/src/state_management/provider.dart";

class Communicate extends StatefulWidget {
  final int maxMsgLengthDonia;
  final int maxMsgLengthRaghad;
  const Communicate({
    required this.maxMsgLengthRaghad,
    required this.maxMsgLengthDonia,
    Key? key}) : super(key: key);

  @override
  _CommunicateState createState() => _CommunicateState();
}

class _CommunicateState extends State<Communicate> {
  Map<int,List<String>>? atRaghad;
  List<String>? encAtRaghad;
  Map<int,List<String>>? atDonia;
  List<String>? encAtDonia;

  @override
  Widget build(BuildContext context) {
    atDonia= Provider.of<Msgs>(context, listen: true).atDonia;
    encAtDonia=
        Provider.of<Msgs>(context, listen: true).atDoniaEnc;

    atRaghad= Provider.of<Msgs>(context, listen: true).atRaghad;
    encAtRaghad=
        Provider.of<Msgs>(context, listen: true).atRaghadEnc;


    return Scaffold(
    body: Column(
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
          child: Row(
            children: <Widget>[
              Expanded(
                child: ChatSection(
                  maxMessageLength: widget.maxMsgLengthDonia,
                  isSender: true,
                  messageWidgets: encAtRaghad!.map((String enc) =>
                  atRaghad!
                  [encAtRaghad!.indexOf(enc)]![0]=="sent"?
                  Raghad(sent:true,
                      msg: atRaghad!
                      [encAtRaghad!.indexOf(enc)]![1],
                      encrypted:enc):Donia(
                      sent: false,
                      msg: atRaghad!
                      [encAtRaghad!.indexOf(enc)]![1],
                      encrypted:enc
                  )
                  ).toList(),
                ),
              ),
              Expanded(
                child: ChatSection(
                  maxMessageLength: widget.maxMsgLengthRaghad,
                  isSender: false,
                  messageWidgets: encAtDonia!.map((String enc) =>
                  atDonia!
                  [encAtDonia!.indexOf(enc)]![0]=="rec"?
                  Raghad(
                      sent: false,
                      msg: atDonia!
                      [encAtDonia!.indexOf(enc)]![1],
                      encrypted:enc):Donia(
                      sent: true,
                      msg: atDonia!
                      [encAtDonia!.indexOf(enc)]![1],
                      encrypted:enc
                  )
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child:ClayContainer(
                  color: backGround,
                  curveType: CurveType.concave,
                  depth: 10,
                  borderRadius: 30,
                  child: TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(const StadiumBorder()),
                      foregroundColor:MaterialStateProperty.all(grad1) ,
                    ),
                    // ignore: prefer_const_constructors
                    child: Padding(
                      padding:const EdgeInsets.all(15.0),
                      child: const Text("Change P , Q",
                        style:TextStyle(
                            fontSize: 18
                        ),),
                    ),
                  ),
                )
            ),
            const SizedBox(width: 50,),
            Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child:ClayContainer(
                  color: backGround,
                  curveType: CurveType.concave,
                  depth: 10,
                  borderRadius: 30,
                  child: TextButton(
                    onPressed: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>
                      const MainScreen()), (Route route) => false);
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(const StadiumBorder()),
                      foregroundColor:MaterialStateProperty.all(grad1) ,
                    ),
                    // ignore: prefer_const_constructors
                    child: Padding(
                      padding:const EdgeInsets.all(15.0),
                      child: const Text("Back to Home",
                        style:TextStyle(
                            fontSize: 18
                        ),),
                    ),
                  ),
                )
            ),
          ],
        ),

      ],
    ),
  );
  }
}



