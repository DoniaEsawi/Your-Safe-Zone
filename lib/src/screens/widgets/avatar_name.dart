import "package:flutter/material.dart";
import "package:rsa_algorithm/src/configs/palette.dart";

class AvatarName extends StatelessWidget {
  final bool isSender;
  final bool showName;
  const AvatarName({
    required this.showName,
    required this.isSender,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color mainColor=isSender?grad1:grad2;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              color: backGround,
              boxShadow: <BoxShadow>[
                const BoxShadow(color: Colors.black45,
                  offset: Offset(5,5),
                  blurRadius: 11,
                ),
                BoxShadow(color:
                const Color(0xff717171).withOpacity(0.1),
                  offset: const Offset(-5,-5),
                  blurRadius: 11,
                ),

              ],
              borderRadius: const BorderRadius.all(
                Radius.circular(40.0),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                    isSender?"assets/images/sender.png":
                    "assets/images/reciever.png"
                ),
              ),
            ),
          ),
        ),
        showName?Text(isSender?"Raghad":
        "Donia",
          style: TextStyle(
              color: mainColor
          ),):Container()
      ],
    );
  }
}