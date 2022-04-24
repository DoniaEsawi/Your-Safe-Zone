
import "package:animated_text_kit/animated_text_kit.dart";
import "package:carousel_slider/carousel_slider.dart";
import "package:flutter/material.dart";
import "package:flutter_neumorphic/flutter_neumorphic.dart";
import "package:responsive_grid/responsive_grid.dart";
import "package:rsa_algorithm/src/configs/palette.dart";
import "package:rsa_algorithm/src/screens/widgets/attack_menu.dart";
import "package:rsa_algorithm/src/screens/widgets/card.dart";
import "package:rsa_algorithm/src/screens/widgets/send_rec_menu.dart";

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
  /*WindowButtonColors wColors= WindowButtonColors(
    iconNormal: grad1,

  );*/
  @override
  void initState() {
    _carouselController=CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[

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
                      SendRecieveMenu(endedFade: endedFade),
                      SizedBox(
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
                                child: GestureDetector(
                                  onTap: (){_carouselController!
                                      .previousPage(duration:
                                  const Duration(milliseconds: 800),
                                  curve: Curves.fastLinearToSlowEaseIn);
                                  setState(() {
                                    currentPage=0;
                                  });
                                  },
                                  child: MenuCard(endedFade: endedFade,
                                    imageName: "send_recieve_4.png",
                                    cardTitle: "Send/Recieve",
                                  ),
                                ),

                              ),
                              ResponsiveGridCol(
                                xl: 3,
                                lg: 5,
                                xs: 5,
                                child: GestureDetector(
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
                                ),
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
                    ElevatedButton(onPressed: (){
                      _carouselController!.animateToPage(1);
                      setState(() {
                        currentPage=1;
                      });
                    },
                        child:const Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: Text("Back",textScaleFactor: 1.5,),
                        )
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
                                "RSA",
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
                                      "OUR DEMOCRACY HAS BEEN HACKED!",
                                      textStyle: const TextStyle(
                                          fontFamily: "robot_alien",
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: grad1
                                      ),
                                      speed: const Duration(milliseconds: 100),
                                    ),
                                    FadeAnimatedText("RSA",
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


