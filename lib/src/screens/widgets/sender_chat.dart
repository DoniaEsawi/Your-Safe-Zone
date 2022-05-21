import "dart:math";

import "package:flutter/material.dart";
import "package:rsa_algorithm/src/configs/palette.dart";
import "package:rsa_algorithm/src/screens/widgets/avatar_name.dart";


class Raghad extends StatefulWidget {
  final bool sent;
  final String msg;
  final String encrypted;
  const Raghad({
    required this.encrypted,
    required this.sent,
    required this.msg,
    Key? key,
  }) : super(key: key);

  @override
  State<Raghad> createState() => _RaghadState();
}

class _RaghadState extends State<Raghad> {
  bool showEncrypted=false;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Transform(
      alignment: Alignment.center,
      transform: Matrix4.rotationY(widget.sent?0:pi),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(widget.sent?0:pi),
            child: const AvatarName(isSender: true,
            showName: true,
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10,
                      right: 50,
                      top: 10,
                      bottom: 10
                  ),
                  child: Column(
                    // ignore: always_specify_types
                    children: [
                      Container(
                        width: double.infinity,
                        decoration:  BoxDecoration(
                          color:grad1,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          ),
                          gradient:const LinearGradient(
                              colors: <Color>[
                                Color(0xff45A247),
                                Color(0xff007903)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(color:
                            grad1.withOpacity(0.2),
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

                        child: Padding(
                          padding:const EdgeInsets.all(20.0),
                          child: AnimatedContainer(
                            duration:const Duration(
                            milliseconds: 700,
                          ),
                            child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(widget.sent?0:pi),
                              child: Text(showEncrypted?
                                  widget.encrypted:widget.msg.replaceAll("\\",r"\" ),
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

                    ],
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 50,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25)
                        ),
                        color: grad2
                      ),
                      child: IconButton(
                        icon: Icon(showEncrypted?
                        Icons.lock_open:
                          Icons.lock,
                          color:grad1,size: 15,),
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
        ],
      ),
    ),
  );

}
