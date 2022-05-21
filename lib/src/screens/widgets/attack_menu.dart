// ignore_for_file: always_specify_types


import "package:flutter/material.dart";
import "package:responsive_grid/responsive_grid.dart";
import "package:rsa_algorithm/src/methods/requests.dart";
import "package:rsa_algorithm/src/screens/view/bruteForceAttack.dart";
import "package:rsa_algorithm/src/screens/view/plot.dart";
import "package:rsa_algorithm/src/screens/widgets/card.dart";
class AttackMenu extends StatefulWidget {
  const AttackMenu({
    required this.endedFade,
    Key? key,
  }) : super(key: key);

  final bool endedFade;

  @override
  State<AttackMenu> createState() => _AttackMenuState();
}

class _AttackMenuState extends State<AttackMenu> {
  List<int>nBitSizesAttack=[for (int i = 8; i <= 72; i+=2) i];

  @override
  Widget build(BuildContext context) => SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric
          (horizontal: 16.0),
        child: ResponsiveGridRow(
          rowSegments: 18,
          children: <ResponsiveGridCol>[
            ResponsiveGridCol(
              xl: 3,
              lg: 0,
              xs: 0,
              child: Container(
              ),
            ),
            ResponsiveGridCol(
              xl: 4,
              lg: 6,
              xs: 6,
              child: GestureDetector(
                onTap: ()async{
                  await Navigator.push(context,
                      MaterialPageRoute
                    (builder: (BuildContext context)=>
                      const Attack(
                        isBF: true,
                      )));
                },
                child: MenuCard(endedFade: widget.endedFade,
                  imageName: "brute_force.png",
                  cardTitle: "Brute Force",
                ),
              ),
            ),
            ResponsiveGridCol(
              xl: 4,
              lg: 6,
              xs: 6,
              child: GestureDetector(
                onTap: ()async{
                  await Navigator.push(context,
                      MaterialPageRoute
                        (builder: (BuildContext context)=>
                      const Attack(
                        isBF: false,
                      )));
                },
                child: MenuCard(endedFade: widget.endedFade,
                  imageName: "chosen_cipher.png",
                  cardTitle: "Chosen Cipher Text",
                ),
              ),
            ),
            ResponsiveGridCol(
              xl: 4,
              lg: 6,
              xs: 6,
              child: GestureDetector(
                onTap: ()async{
                  List<String> times=  await getFileData("assets/times.txt");
                  List<String> nValues=  await getFileData("assets/n.txt");

                  Navigator.push(context, MaterialPageRoute
                    (builder: (BuildContext context)=>
                      EncrytionStatistics(attackTimes: times,
                        isAttack: true,
                        nValues: nValues,
                        nBitSizes: nBitSizesAttack,
                      )));
                },
                child: MenuCard(endedFade: widget.endedFade,
                  imageName: "statistics.png",
                  cardTitle: "Statistics",

                ),
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
    );
}
