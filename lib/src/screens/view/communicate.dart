import "package:clay_containers/clay_containers.dart";
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "package:rsa_algorithm/src/configs/palette.dart";
import 'package:rsa_algorithm/src/methods/requests.dart';
import "package:rsa_algorithm/src/screens/widgets/chat_section.dart";
import 'package:rsa_algorithm/src/screens/widgets/reciever_chat.dart';
import 'package:rsa_algorithm/src/screens/widgets/sender_chat.dart';
import 'package:rsa_algorithm/src/state_management/provider.dart';

class Communicate extends StatefulWidget {
  const Communicate({Key? key}) : super(key: key);

  @override
  _CommunicateState createState() => _CommunicateState();
}

class _CommunicateState extends State<Communicate> {
  List<String>? sentMsgs;
  List<String>? sentMsgsEnc;
  List<String>? recMsgs;
  List<String>? recMsgsEnc;
  @override
  Widget build(BuildContext context) {
    sentMsgs= Provider.of<Msgs>(context, listen: true).atSender;
    sentMsgsEnc= Provider.of<Msgs>(context, listen: true).atSenderEnc;
    recMsgs= Provider.of<Msgs>(context, listen: true).atReceiver;
    recMsgsEnc= Provider.of<Msgs>(context, listen: true).atReceiverEnc;

    return Scaffold(
    body: Row(
      children: <Widget>[
        Expanded(
          child: ChatSection(
            isSender: true,
            messageWidgets: sentMsgs!.map((msg) =>
            Sender(msg: msg,encrypted: sentMsgsEnc![
              sentMsgs!.indexOf(msg)
            ],)
            ).toList(),
          ),
        ),
        Expanded(
          child: ChatSection(
            isSender: false,
            messageWidgets:recMsgs!.map((msg) =>
                Sender(msg: msg,
                  encrypted: recMsgsEnc![
                  recMsgs!.indexOf(msg)
                  ],
                )
            ).toList(),
          ),
        ),
      ],
    ),
  );
  }
}



