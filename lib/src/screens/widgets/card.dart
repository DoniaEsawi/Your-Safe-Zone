import "package:clay_containers/clay_containers.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:rsa_algorithm/src/configs/palette.dart";

// ignore: must_be_immutable
class MenuCard extends StatefulWidget {
  final String imageName;
  final String cardTitle;
  bool endedFade;
  MenuCard({
    required this.imageName,
    required this.endedFade,
    required this.cardTitle,
    Key? key}) : super(key: key);

  @override
  _MenuCardState createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  bool isHovered=false;
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: MouseRegion(
        cursor: isHovered?SystemMouseCursors.click:
        SystemMouseCursors.basic
        ,
        onHover: (PointerHoverEvent event){
          setState(() {
            isHovered=true;
          });
        },
        onExit: (PointerExitEvent event){
          setState(() {
            isHovered=false;
          });
        },
        child: ClayAnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: 300,
          height: 350,
          color: backGround,
          surfaceColor: backGround,
          spread: 1,
          emboss: false,
          curveType:isHovered?
          CurveType.concave:CurveType.convex,
          borderRadius: 25,
          depth: widget.endedFade?(isHovered?12:8):0,
          child: widget.endedFade?Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget>
              [Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/${widget.imageName}"),
              )),
                  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0,
                      horizontal: 8.0),
                  child: Text(widget.cardTitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: grad1,
                    fontFamily: "robot_alien",
                    fontSize: 22
                  ),
                  ),
                )
                ]
        ):Container(),),
      ),
  );
}
