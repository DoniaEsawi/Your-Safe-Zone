
// ignore_for_file: lines_longer_than_80_chars, flutter_style_todos, always_specify_types, non_constant_identifier_names

import "package:clay_containers/clay_containers.dart";
import "package:flutter/material.dart";
import "package:rsa_algorithm/src/configs/keys.dart";
import "package:rsa_algorithm/src/configs/palette.dart";
import "package:rsa_algorithm/src/screens/widgets/avatar_name.dart";
import "package:rsa_algorithm/src/screens/widgets/msg_field.dart";


// ignore: must_be_immutable
class ChatSection extends StatefulWidget {
  /// true if sender, false if receiver
  final bool isSender;
  /// list of messages
  List<Widget> messageWidgets;
  /// max text field input length
  final int maxMessageLength;
  ChatSection({
    required this.messageWidgets,
    required this.isSender,
    required this.maxMessageLength,
    Key? key,
  }) : super(key: key);

  @override
  State<ChatSection> createState() => _ChatSectionState();
}

class _ChatSectionState extends State<ChatSection> {
  ScrollController? _scrollController;

  String? e_pu;
  String? n;
  String? d_pr;
  String? name;
  @override
  void initState() {
    _scrollController= ScrollController();
    name= widget.isSender?"Raghad":"Donia";
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    e_pu= widget.isSender?e_raghad:
    e_donia
    ;
    n= widget.isSender?n_raghad:
    n_donia
    ;
    d_pr= widget.isSender?d_raghad:
    e_donia
    ;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if(_scrollController!.hasClients){
        _scrollController!.animateTo(_scrollController!
            .position.maxScrollExtent,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease);
      }
    });

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
                      "Raghad":
                      "Donia",
                      style: TextStyle(
                          fontSize: 24,
                          color: mainColor
                      ),),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: FloatingActionButton(onPressed: ()=> showDialog(
                      context: context,
                      builder: (BuildContext ctx) => AlertDialog(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        backgroundColor: widget.isSender?grad1:grad3,
                        title: Center(child: ClayContainer(
                            color: backGround,
                            emboss: true,
                            depth: 15,
                            spread: 0,
                            borderRadius: 80,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(widget.isSender?"assets/images/sender.png"
                                  :"assets/images/reciever.png",width: 60,),
                            ))),
                        content: SingleChildScrollView(
                          controller: ScrollController(),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${name!}'s PU key (e)",
                                      style: const TextStyle(color: backGround),),
                                    const SizedBox(height: 20,),
                                    ClayContainer(
                                    color: widget.isSender?grad1:grad3,
                                    borderRadius: 10,
                                    width: MediaQuery.of(context).size.width/4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(e_pu!,
                                      style: const TextStyle(color: Colors.white),),
                                    ),
                                    emboss: true,
                                  ),


                                  ],
                                ),
                                const SizedBox(height: 30,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${name!}'s n",
                                      style: const TextStyle(color: backGround),),
                                    const SizedBox(height: 20,),
                                    ClayContainer(
                                      color: widget.isSender?grad1:grad3,
                                      borderRadius: 10,
                                      width: MediaQuery.of(context).size.width/4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(n!,
                                          style: const TextStyle(color: Colors.white),),
                                      ),
                                      emboss: true,
                                    ),


                                  ],
                                ),
                                const SizedBox(height: 30,),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("${name!}'s PR key (d)",
                                      style: const TextStyle(color: backGround),),
                                    const SizedBox(height: 20,),
                                    ClayContainer(
                                      color: widget.isSender?grad1:grad3,
                                      borderRadius: 10,
                                      width: MediaQuery.of(context).size.width/4,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(d_pr!,
                                          style: const TextStyle(color: Colors.white),),
                                      ),
                                      emboss: true,
                                    ),


                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(backGround)
                            ),
                            child: Text("Done",
                              style: TextStyle(color: widget.isSender?grad1:grad3),),
                          ),
                        ],
                      ),
                    ),
                  heroTag: Key("${widget.isSender}"),
                  elevation: 15,
                  backgroundColor: widget.isSender?grad1:
                    grad2,
                    child: const Icon(Icons.vpn_key,
                    color: backGround,),
                  ),
                )

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
                  controller: _scrollController,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children:widget.messageWidgets
                    ),
                  ),
                ),
              ),
              MsgField(
                maxLength:widget.maxMessageLength,
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


