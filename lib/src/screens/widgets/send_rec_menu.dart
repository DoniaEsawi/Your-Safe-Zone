import "package:flutter/material.dart";
import "package:responsive_grid/responsive_grid.dart";
import "package:rsa_algorithm/src/screens/view/communicate.dart";
import "package:rsa_algorithm/src/screens/widgets/card.dart";

class SendRecieveMenu extends StatelessWidget {
  const SendRecieveMenu({
    required this.endedFade,

    Key? key,
  }) : super(key: key);

  final bool endedFade;

  @override
  Widget build(BuildContext context) => SizedBox(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(

        child: Center(
          child: Padding(
            padding: const
            EdgeInsets.symmetric(horizontal: 16.0),
            child: ResponsiveGridRow(
              children: <ResponsiveGridCol>[
                ResponsiveGridCol(
                  xl: 3,
                  lg: 0,
                  xs: 0,
                  child: Container(
                  ),
                ),
                ResponsiveGridCol(
                  xl: 3,
                  lg: 6,
                  xs: 6,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute<void>
                        (builder: (BuildContext context) => const Communicate()
                      ));
                    },
                    child: MenuCard(endedFade: endedFade,
                      imageName: "communicate.png",
                      cardTitle: "Communicate",
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  xl: 3,
                  lg: 6,
                  xs: 6,
                  child: MenuCard(endedFade: endedFade,
                    imageName: "statistics.png",
                    cardTitle: "Statistics",
                  ),
                ),
                ResponsiveGridCol(
                  xl: 3,
                  lg: 0,
                  xs: 0,
                  child: Container(
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
}
