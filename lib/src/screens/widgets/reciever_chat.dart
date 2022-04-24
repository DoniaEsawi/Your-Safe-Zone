import "package:flutter/material.dart";
import "package:rsa_algorithm/src/configs/palette.dart";
import "package:rsa_algorithm/src/screens/widgets/avatar_name.dart";

class Reciever extends StatelessWidget {
  final String msg;
  const Reciever({
    required this.msg,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Expanded(
          child: Padding(
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
                      Color(0xff033264),
                      Color(0xff004794)
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft
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
                padding: const EdgeInsets.all(10.0),
                child: Text(msg,
                  style:const TextStyle(color: backGround,
                    fontFamily: "roboto-mono",
                  ),
                ),
              ),
            ),
          ),
        ),
        const AvatarName(isSender: false,
        showName: true,
        ),
      ],
    ),
  );
}
