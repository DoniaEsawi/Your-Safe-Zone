// ignore_for_file: always_specify_types, lines_longer_than_80_chars

import "dart:math";

import "package:bitsdojo_window/bitsdojo_window.dart";
import "package:clay_containers/clay_containers.dart";
import "package:flutter/material.dart";
import "package:fl_chart/fl_chart.dart";
import "package:flutter_neumorphic/flutter_neumorphic.dart";
import "package:rsa_algorithm/src/configs/palette.dart";
import "package:rsa_algorithm/src/screens/widgets/titleBar.dart";
class EncrytionStatistics extends StatefulWidget {
  final bool isAttack;
  final List<String> attackTimes;
  final List<String> nValues;
  final List<int> nBitSizes;
  const EncrytionStatistics({
    required this.isAttack,
    required this.attackTimes,
    required this.nValues,
    required this.nBitSizes,
    Key? key}) : super(key: key);

  @override
  _EncrytionStatisticsState createState() => _EncrytionStatisticsState();
}

class _EncrytionStatisticsState extends State<EncrytionStatistics> {
  /// Assumes the given path is a text-file-asset.


  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) => Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              WindowTitleBarBox(
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Image.asset("assets/logos/logo2.png",width: 30,),
                            ),

                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [


                              Expanded(child: MoveWindow()),
                              WindowButtons()
                            ]),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.isAttack?"Mathematical Attack Efficiency":
                  "RSA Encryption Efficiency",
                textScaleFactor: 1.5,
                  style: const TextStyle(
                    color: grad3
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(38.0),
                        child: LineChart(
                            LineChartData(
                              gridData: FlGridData(
                                show: true,
                                drawVerticalLine: true,
                                getDrawingHorizontalLine: (double value) => FlLine(
                                    color: const Color(0xff37434d).withOpacity(0.5),
                                    strokeWidth: 1,
                                  ),
                                getDrawingVerticalLine: (double value) => FlLine(
                                    color: const Color(0xff37434d),
                                    strokeWidth: 0,
                                  ),
                              ),
                              maxY: widget.isAttack?5500:0.025,
                              titlesData: FlTitlesData(

                                show: true,
                                bottomTitles:AxisTitles(
                                  axisNameWidget: Text(widget.isAttack?"Key values (Decimal)":
                                    "Key length (Bits)",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                  ),
                                    sideTitles: SideTitles(
                                  showTitles: true,
                                  //interval: widget.isAttack?8:128,

                                getTitlesWidget: (double value, TitleMeta meta) => Padding(
                                    padding: const EdgeInsets.only(top: 18.0),
                                    child:widget.isAttack?RotatedBox(
                                      quarterTurns: 1,
                                      child: Text(widget.nValues[((value.toInt()-8)~/2)].toString(),
                                        textAlign: TextAlign.left,
                                        style: const TextStyle(color: grad2),),
                                    ):
                                  Transform.rotate(angle: -pi/4,
                                    child: Text(
                                    value.toInt().toString(),
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(color: grad2),),
                                  ),
                                  ),
                                      reservedSize: widget.isAttack? 310:
                                      80,
                                ),),
                                leftTitles: AxisTitles(
                                axisNameWidget: const Text("Execution Time (Seconds)",
                                      style:  TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                sideTitles: SideTitles(
                                  showTitles: true,

                                  getTitlesWidget: (double value, TitleMeta meta) => Padding(
                                    padding: const EdgeInsets.only(left: 18.0),
                                    child: Text(value.toStringAsFixed(widget.isAttack?0:3),
                                       style: const TextStyle(color: grad1),),
                                  ),
                                  reservedSize: 100,

                                )),
                                rightTitles: AxisTitles(sideTitles:
                                SideTitles(showTitles: false,),

                                )
                                  ,
                                topTitles: AxisTitles(sideTitles:
                                  SideTitles(showTitles: false))
                              ),
                              borderData:
                              FlBorderData(show: true,
                                  border: Border.all(color: const Color(0xff37434d),
                                      width: 1)),

                              lineBarsData: [
                                LineChartBarData(
                                  spots:
                                  widget.nBitSizes.map((e) =>  FlSpot((e).toDouble(),
                                      double.parse(widget.attackTimes[widget.nBitSizes.indexOf(e)])), ).toList(),
                                  isCurved: false,
                                  gradient: const LinearGradient(
                                    colors: [grad1, grad2]
                                  ),
                                  barWidth: 5,
                                  isStrokeCapRound: false,
                                  dotData: FlDotData(
                                    show: true,
                                  ),
                                  belowBarData: BarAreaData(
                                    show: false,
                                    gradient:  const LinearGradient(
                                        colors: [grad1, grad2]
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                    ),
                    Expanded(child: Padding(
                      padding: const EdgeInsets.only(left: 30.0,
                      bottom: 30.0,
                      top: 30.0,
                      right: 60),
                      child: Container(
                        decoration:   BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              grad1,
                              grad2
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomLeft,
                          ),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: grad1.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 6)
                            ),
                            BoxShadow(
                                color: grad2.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, -6)
                            )
                          ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0,),
                          child: ClayContainer(

                            color: backGround,
                            curveType: CurveType.concave,
                            depth: 10,
                            borderRadius: 0,
                            spread: 0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0,
                              vertical: 18.0),
                              child: SingleChildScrollView(
                                child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: const <Widget>[
                                          Text("Key Size (in Bits)",
                                          style: TextStyle(
                                            fontFamily: "roboto-mono",
                                            fontWeight: FontWeight.bold,
                                            color: grad1,
                                            fontSize: 24
                                          ),
                                          ),
                                          Text("Execution time (in seconds)",
                                            style: TextStyle(
                                                fontFamily: "roboto-mono",
                                                fontWeight: FontWeight.bold,
                                                color: grad2,
                                                fontSize: 24
                                            ),
                                          )
                                        ],),
                                        Divider(color: Colors.grey.withOpacity(0.2),
                                        thickness: 2,
                                          height: 30,
                                        ),
                                        Column(
                                          children: widget.nBitSizes.map((e) =>
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children:  <Widget>[
                                                      Text(e.toString(),
                                                        style: const TextStyle(
                                                          fontFamily: "roboto-mono",
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 16
                                                        ),
                                                      ),
                                                      Text(widget.attackTimes[
                                                        widget.nBitSizes.indexOf(e)
                                                      ],
                                                        style: const TextStyle(
                                                            fontFamily: "roboto-mono",
                                                            fontWeight: FontWeight.bold,
                                                            color: Colors.white,
                                                            fontSize: 16
                                                        ),
                                                      ),
                                                    ],),
                                                  Divider(color: Colors.grey.withOpacity(0.2),
                                                    thickness: 2,
                                                    height: 30,
                                                  ),
                                                ],
                                              ),
                                          ).toList(),
                                        )
                                        
                                      ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: ClayContainer(
                  color: backGround,
                  curveType: CurveType.concave,
                  depth: 10,
                  borderRadius: 30,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(30
                        )
                    ),
                    child: TextButton(onPressed: (){
                      Navigator.pop(context);
                      },
                        child:const Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 26.0,
                              vertical: 18),
                          child: Text("Back",textScaleFactor: 1.5,),
                        )
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),

    );}
