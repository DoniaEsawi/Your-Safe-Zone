import "package:clay_containers/clay_containers.dart";
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import "package:rsa_algorithm/src/configs/palette.dart";
import 'package:rsa_algorithm/src/methods/requests.dart';
import "package:rsa_algorithm/src/screens/widgets/avatar_name.dart";
import 'package:rsa_algorithm/src/state_management/provider.dart';

class MsgField extends StatefulWidget {
  final bool isSender;
  final Color mainColor;
  final String id;
  const MsgField({
    required this.id,
    required this.isSender,
    required this.mainColor,
    Key? key,
  }) : super(key: key);

  @override
  State<MsgField> createState() => _MsgFieldState();
}

class _MsgFieldState extends State<MsgField> {
  TextEditingController? _textEditingController;
  @override
  void initState() {
    _textEditingController= TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _textEditingController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 32),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AvatarName(isSender: widget.isSender,
          showName: true,
        ),
        const SizedBox(width: 32,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: ClayContainer(
              color: backGround,
              depth: 5,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment:
                CrossAxisAlignment.end,
                children:  <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: _textEditingController,
                        cursorHeight: 24,
                        maxLines: 5,
                        maxLength: 100,
                        cursorColor: widget.mainColor,
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontFamily: "roboto-mono",
                            fontSize: 18
                        ),
                        decoration: InputDecoration(
                            helperStyle: TextStyle(color: widget.mainColor),
                            enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide
                                  (color: Colors.transparent)
                            ),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide
                                  (color: Colors.transparent)
                            )
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      heroTag: widget.id,
                      onPressed: ()async{
                    List<dynamic> res = await
                    Future.wait(<Future<dynamic>>
                    [recMsg(0, 0),
                      sendMessage(_textEditingController!.text)]);
                    _textEditingController!.clear();
                    Provider.of<Msgs>(context, listen: false).sentFromSender(
                      res[1]["message_sent"].toString(),
                      res[1]["message_encrypted"].toString(),
                    );
                    Provider.of<Msgs>(context, listen: false).receivedToReceiver(
                        res[0]["message_decrypted"].toString(),
                        res[0]["message_encrypted"].toString(),
                    );

                    },
                      child:
                      const Icon(Icons.send,
                        color:backGround,size: 25,),
                      backgroundColor: widget.mainColor,
                      foregroundColor: backGround,

                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
