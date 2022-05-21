
// ignore_for_file: prefer_const_constructors, always_specify_types

import "package:animated_text_kit/animated_text_kit.dart";
import "package:bitsdojo_window/bitsdojo_window.dart";
import "package:carousel_slider/carousel_slider.dart";
import "package:clay_containers/clay_containers.dart";
import "package:flutter/material.dart";
import "package:flutter_neumorphic/flutter_neumorphic.dart";
import "package:responsive_grid/responsive_grid.dart";
import "package:rsa_algorithm/src/configs/keys.dart";
import "package:rsa_algorithm/src/configs/palette.dart";
import "package:rsa_algorithm/src/methods/requests.dart";
import "package:rsa_algorithm/src/screens/view/choose_p_q.dart";
import "package:rsa_algorithm/src/screens/view/plot.dart";
import "package:rsa_algorithm/src/screens/widgets/attack_menu.dart";
import "package:rsa_algorithm/src/screens/widgets/card.dart";
import "package:rsa_algorithm/src/screens/widgets/send_rec_menu.dart";
import "package:rsa_algorithm/src/screens/widgets/titleBar.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  CarouselController? _carouselController; //0- main menu,
  // 1- send_recieve
  // 2- attack menu
  int currentPage=1;
  bool ended=false;
  bool endedResize=false;
  bool endedFade=false;
  bool enteredUrl=false;
  TextEditingController? _textEditingController;
  /*WindowButtonColors wColors= WindowButtonColors(
    iconNormal: grad1,

  );*/
  List<int>nBitSizesEnc= [for (var i = 512; i <= 2048; i+=128) i];
  @override
  void initState() {
    _textEditingController= TextEditingController();

    ended=false;
    endedResize=false;
    endedFade=false;
    _carouselController=CarouselController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _textEditingController!.dispose();
  }
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[

      AnimatedOpacity(
        duration: Duration(milliseconds:500),
        opacity: endedFade?1.0:0.0,
        child: WindowTitleBarBox(
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
      ),
      Expanded(
        child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Align(
                alignment: const Alignment(0,0.25),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CarouselSlider(
                    carouselController: _carouselController,
                    options: CarouselOptions(
                      initialPage: 1,
                      viewportFraction: 1.0,
                      height: 400,
                      enlargeCenterPage: false,
                      autoPlay: false,
                      //scrollPhysics: const NeverScrollableScrollPhysics()
                    ),
                    items: <Widget>[

                      // send / recieve menu
                      SendRecieveMenu(endedFade: endedFade,
                      onComClicked: (){
                       Navigator.push(context, MaterialPageRoute
                         (builder: (BuildContext context)=>PQChooser()));
                      },
                      onStatisticsClicked:()async{
                        List<String> times=  await getFileData("assets/efficiency.txt");
                        //List<String> nValues=  await getFileData("assets/times.txt");

                        Navigator.push(context, MaterialPageRoute
                          (builder: (BuildContext context)=>
                            EncrytionStatistics(attackTimes: times,
                              isAttack: false,
                              nValues: [],
                              nBitSizes: nBitSizesEnc,
                            )));
                      }

                      ),
                      enteredUrl?SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const
                          EdgeInsets.symmetric(horizontal: 16.0),
                          child: ResponsiveGridRow(

                            children: <ResponsiveGridCol>[
                              ResponsiveGridCol(
                                xl: 3,
                                lg: 1,
                                xs: 1,
                                child: Container(
                                ),
                              ),
                              ResponsiveGridCol(
                                xl: 3,
                                lg: 5,
                                xs: 5,
                                child: endedFade?GestureDetector(
                                  onTap: (){_carouselController!
                                      .previousPage(duration:
                                  const Duration(milliseconds: 800),
                                  curve: Curves.easeInOutCubic);
                                  setState(() {
                                    currentPage=0;
                                  });
                                  },
                                  child: MenuCard(endedFade: endedFade,
                                    imageName: "send_recieve_4.png",
                                    cardTitle: "Send/Recieve",
                                  ),
                                ):Container(),

                              ),
                              ResponsiveGridCol(
                                xl: 3,
                                lg: 5,
                                xs: 5,
                                child: endedFade?GestureDetector(
                                  onTap: (){ _carouselController!
                                      .nextPage(duration:
                                  const Duration(milliseconds: 800),
                                      curve: Curves.easeInOutCubic);
                                  setState(() {
                                    currentPage=2;
                                  });
                                  },
                                  child: MenuCard(endedFade: endedFade,
                                    imageName: "hacker3.png",
                                    cardTitle: "Attack",
                                  ),
                                ):Container(),
                              ),
                              ResponsiveGridCol(
                                xl: 3,
                                lg: 1,
                                xs: 1,
                                child: Container(
                                ),
                              ),
                            ],
                          ),
                        ),
                      ):
                      Center(
                        child: endedFade?Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Enter Your Host URL",style:
                              TextStyle(
                                color: grad3,
                                fontSize: 24
                              ),),
                            SizedBox(height: 40,),
                            ClayContainer(
                              width: MediaQuery.of(context).size.width/2,
                              borderRadius: 15,
                              depth: 8,
                              color: backGround,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  onTap: (){
                                  },
                                  //enabled: !submitted,
                                  controller:
                                  _textEditingController!,
                                  keyboardType: TextInputType.number,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  minLines: 1,
                                  maxLines: 1,
                                  cursorHeight: 18,
                                  cursorColor: grad1,
                                  decoration: InputDecoration(
                                    hintText: "e.g. http://127.0.0.1:5000",
                                      hintStyle: TextStyle(
                                        fontFamily: "roboto",
                                        fontSize: 22,
                                        color: Colors.grey.shade800
                                      ),
                                      border: const OutlineInputBorder(
                                          borderSide:  BorderSide(
                                              color: Colors.transparent
                                          )
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent
                                          )
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color:
                                              Colors.transparent
                                          )
                                      )

                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 40,),
                            ClayContainer(
                              color: backGround,
                              curveType: CurveType.concave,
                              depth: 10,
                              borderRadius: 30,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30
                                    )
                                ),
                                child: TextButton(onPressed: (){
                                  if(_textEditingController!.text.isNotEmpty) {
                                    hostUrl = _textEditingController!.text;
                                    setState(() {
                                      enteredUrl=true;
                                    });
                                  }
                                  },
                                    child:const Padding(
                                      padding:  EdgeInsets.symmetric(
                                          horizontal: 26.0,
                                          vertical: 18),
                                      child: Text("Submit",
                                        style: TextStyle(color: grad1),
                                        textScaleFactor: 1.5,),
                                    )
                                ),
                              ),
                            )
                          ],
                        ):Container(),
                      ),
                      // attack menu
                      AttackMenu(endedFade: endedFade),
                    ]
                  ),
                ),
              ),
              Positioned(child: currentPage!=1?Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClayContainer(
                      color: backGround,
                      curveType: CurveType.concave,
                      depth: 10,
                      borderRadius: 30,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30
                          )
                        ),
                        child: TextButton(onPressed: (){
                          if(currentPage!=1)
                            {_carouselController!.animateToPage(1);
                              setState(() {
                                currentPage = 1;
                              });
                            }},
                            child:const Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 26.0,
                              vertical: 18),
                              child: Text("Back",textScaleFactor: 1.5,),
                            )
                        ),
                      ),
                    )
                  ],
                ),
              ):Container(),
              bottom: MediaQuery.of(context).size.height*0.1,
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                onEnd: (){
                  if(endedResize) {
                    setState(() {
                      endedFade = true;
                    });
                  }
                },
                top: endedResize?20:
                MediaQuery.of(context).size.height/2
                    -(MediaQuery.of(context).size.height/6+30),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      AnimatedContainer(
                        onEnd: (){

                          setState(() {
                            endedResize=true;
                          });
                        },
                        duration: const Duration(milliseconds: 500),
                        height: ended?MediaQuery.of(context).size.height/6+50:
                        MediaQuery.of(context).size.height/3+100,
                        child:
                        Column(
                          children: <Widget>[
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              height:
                              ended?MediaQuery.of(context).size.height/6:
                              MediaQuery.of(context).size.height/3,
                              child: Image.asset("assets/logos/logo2.png",),
                            ),
                              ended?const Text(
                                "Your Safe Zone",
                                style: TextStyle(
                                    fontFamily: "robot_alien",
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: grad1
                                ),
                              ):Container(),
                            Center(
                              child: ended==false?Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: AnimatedTextKit(
                                  onFinished: (){
                                    setState(() {
                                      ended=true;
                                    });
                                  },
                                  animatedTexts:<AnimatedText>[
                                    TypewriterAnimatedText(
                                      "The world isn't a safe place anymore",
                                      textStyle: const TextStyle(
                                          fontFamily: "robot_alien",
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: grad1
                                      ),
                                      speed: const Duration(milliseconds: 100),
                                    ),
                                    TypewriterAnimatedText(
                                      "welcome to .. ",
                                      textStyle: const TextStyle(
                                          fontFamily: "robot_alien",
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: grad1
                                      ),
                                      speed: const Duration(milliseconds: 100),
                                    ),
                                    FadeAnimatedText("Your Safe Zone",
                                      textStyle: const TextStyle(
                                          fontFamily: "robot_alien",
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                          color: grad1
                                      ),
                                      duration: const Duration
                                        (milliseconds: 1500),)

                                  ],
                                  totalRepeatCount: 1,
                                  pause: const Duration(milliseconds: 200),
                                  displayFullTextOnTap: true,
                                  stopPauseOnTap: true,

                                ),
                              ):Container()

                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16,),

                    ],

                  ),

                ),
              ),

            ],
          ),
      ),
    ],
  );
}


