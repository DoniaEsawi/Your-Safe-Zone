import "package:flutter/material.dart";
import "package:responsive_grid/responsive_grid.dart";
import "package:rsa_algorithm/src/screens/widgets/card.dart";

class AttackMenu extends StatelessWidget {
  const AttackMenu({
    required this.endedFade,
    Key? key,
  }) : super(key: key);

  final bool endedFade;

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
              child: MenuCard(endedFade: endedFade,
                imageName: "brute_force.png",
                cardTitle: "Brute Force",
              ),
            ),
            ResponsiveGridCol(
              xl: 4,
              lg: 6,
              xs: 6,
              child: MenuCard(endedFade: endedFade,
                imageName: "chosen_cipher.png",
                cardTitle: "Chosen Cipher Text",
              ),
            ),
            ResponsiveGridCol(
              xl: 4,
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
    );
}
