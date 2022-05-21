// ignore: prefer_double_quotes
import 'dart:math';

import "package:flutter/material.dart";
import "package:rsa_algorithm/src/configs/palette.dart";
import "package:rsa_algorithm/src/screens/widgets/avatar_name.dart";

class Donia extends StatefulWidget {
  final bool sent;
  final String msg;
  final String encrypted;
  const Donia({
    required this.encrypted,
    required this.sent,
    required this.msg,
    Key? key,
  }) : super(key: key);

  @override
  State<Donia> createState() => _DoniaState();
}

class _DoniaState extends State<Donia> {
  bool showEncrypted=false;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(!widget.sent?0:pi),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          Expanded(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 10,
                      left: 50,
                      top: 10,
                      bottom: 10
                  ),
                  child: Container(
                    decoration:  BoxDecoration(
                      color:grad1,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                      ),
                      gradient:const LinearGradient(
                          colors: <Color>[
                            Color(0xff076fdd),
                            Color(0xff004794)
                          ],
                          end: Alignment.topRight,
                          begin: Alignment.bottomLeft
                      ),
                      boxShadow: <BoxShadow>[
                        BoxShadow(color: grad2.withOpacity(0.2),
                          offset: const Offset(3,3),
                          blurRadius: 10,
                        ),
                        BoxShadow(color:
                        const Color(0xff717171).withOpacity(0.15),
                          offset: const Offset(-5,-5),
                          blurRadius: 11,
                        ),
                      ],
                    ),

                    child:  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: AnimatedContainer(
                        width:  double.infinity,
                        duration:const Duration(
                          milliseconds: 700,
                        ),
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(!widget.sent?0:pi),
                          child: Text(showEncrypted?
                          widget.encrypted:widget.msg,
                            style:const TextStyle(color: backGround,
                              fontFamily: "roboto-mono",
                              fontSize: 18
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 50,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(25)
                          ),
                          color:grad1
                      ),
                      child: IconButton(
                        icon: Icon(showEncrypted?
                        Icons.lock_open:
                        Icons.lock,
                          color:grad2,size: 15,),
                        onPressed: (){
                          setState(() {
                            showEncrypted=!showEncrypted;
                          });
                        },

                      ),
                    ))
              ],
            ),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(!widget.sent?0:pi),
            child: const AvatarName(isSender: false,
            showName: true,
            ),
          ),
        ],
      ),
    ),
  );
}
