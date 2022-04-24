import "package:flutter/material.dart";
import "package:rsa_algorithm/src/configs/palette.dart";
import 'package:rsa_algorithm/src/screens/widgets/avatar_name.dart';
import 'package:rsa_algorithm/src/screens/widgets/chat_section.dart';

class Sender extends StatefulWidget {
  final String msg;
  final String encrypted;
  const Sender({
    required this.encrypted,
    required this.msg,
    Key? key,
  }) : super(key: key);

  @override
  State<Sender> createState() => _SenderState();
}

class _SenderState extends State<Sender> {
  bool showEncrypted=false;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const AvatarName(isSender: true,
        showName: true,
        ),
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10,
                    right: 50,
                    top: 10,
                    bottom: 10
                ),
                child: Container(
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
                      child: Text(showEncrypted?
                      widget.encrypted:widget.msg,
                        style:const TextStyle(color: backGround,
                          fontFamily: "roboto-mono",

                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 50,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25)
                      ),
                      color: Colors.red
                    ),
                    child: IconButton(
                      icon: Icon(showEncrypted?
                      Icons.lock_open:
                        Icons.lock,
                        color:backGround,size: 15,),
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
  );
}
