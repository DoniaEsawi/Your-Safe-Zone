
import "package:clay_containers/clay_containers.dart";
import "package:flutter/material.dart";
import "package:rsa_algorithm/src/configs/palette.dart";
import "package:rsa_algorithm/src/screens/widgets/avatar_name.dart";
import "package:rsa_algorithm/src/screens/widgets/msg_field.dart";


// ignore: must_be_immutable
class ChatSection extends StatefulWidget {
  /// true if sender, false if receiver
  final bool isSender;
  /// list of messages
  List<Widget> messageWidgets;
  /// on pressing enter
  ChatSection({
    required this.messageWidgets,
    required this.isSender,
    Key? key,
  }) : super(key: key);

  @override
  State<ChatSection> createState() => _ChatSectionState();
}

class _ChatSectionState extends State<ChatSection> {

  @override
  Widget build(BuildContext context) {
    Color mainColor= widget.isSender?grad1:grad2;
    return Column(
    children: <Widget>[

Expanded(
  child: Padding(padding:
  const EdgeInsets.all(32),
      child: ClayContainer(
        height: MediaQuery.of(context).size.height,
        color: backGround,
        borderRadius: 0,
        depth: 5,
        spread: 13,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                AvatarName(isSender: widget.isSender,
                showName: false,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.isSender?
                      "Raghad (Sender)":
                      "Donia (Reciever)",
                      style: TextStyle(
                          fontSize: 24,
                          color: mainColor
                      ),),
                  ),
                ),
              ],
            ),
            Divider(thickness: 2,
              height: 5,
              color: mainColor,),
            Expanded(
          child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 32.0,
                    left: 32.0,
                    right: 32.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children:widget.messageWidgets
                    ),
                  ),
                ),
              ),
              MsgField(
                mainColor: mainColor,
                isSender: widget.isSender,
                id:widget.isSender?"1":"2",
              )
            ],
          ),
          ),
        ),
          ],
        ),
      )
  ),
),

    ],
  );
  }
}


