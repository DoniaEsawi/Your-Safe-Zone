// ignore_for_file: unnecessary_const, lines_longer_than_80_chars, always_specify_types

import "dart:developer";
import "package:bitsdojo_window/bitsdojo_window.dart";
import "package:clay_containers/clay_containers.dart";
import "package:flutter/material.dart";
import "package:ninja_prime/ninja_prime.dart";
import "package:responsive_grid/responsive_grid.dart";
import "package:rsa_algorithm/src/configs/keys.dart";
import "package:rsa_algorithm/src/configs/palette.dart";
import "package:rsa_algorithm/src/methods/requests.dart";
import "package:rsa_algorithm/src/screens/view/communicate.dart";
import "package:rsa_algorithm/src/screens/widgets/avatar_name.dart";
import "package:rsa_algorithm/src/screens/widgets/titleBar.dart";

class PQChooser extends StatefulWidget {
  const PQChooser({Key? key}) : super(key: key);

  @override
  _PQChooserState createState() => _PQChooserState();
}

class _PQChooserState extends State<PQChooser> {
  bool isValid1=false;
  bool isValid2=false;
  bool isValid3=false;
  bool isValid4=false;
  TextEditingController? _textEditingController1;
  TextEditingController? _textEditingController2;
  TextEditingController? _textEditingController3;
  TextEditingController? _textEditingController4;
  String validMsg1= "must be prime and not equal to Q";
  String validMsg2= "must be prime and not equal to P";
  String validMsg3= "must be prime and not equal to Q";
  String validMsg4= "must be prime and not equal to P";

  String buttonText="Submit";

  int maxMsgRaghad=0;
  int maxMsgDonia=0;

  bool error=false;
  bool submitted=false;
  @override
  void initState() {
    _textEditingController1= TextEditingController();
    _textEditingController2= TextEditingController();
    _textEditingController3= TextEditingController();
    _textEditingController4= TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController1!.dispose();
    _textEditingController2!.dispose();
    _textEditingController3!.dispose();
    _textEditingController4!.dispose();
    super.dispose();
  }

  bool validateInput(String text, int id)
  {
    if(BigInt.tryParse(text)!=null)
      {
          if(BigIntPrime(BigInt.parse(text)).isPrime())
            {
              if(id==1){
                setState(() {
                  validMsg1= "valid ✅";
                });
              }
              else if(id==2){
                setState(() {
                  validMsg2= "valid ✅";
                });
              }
              else if(id==3){
                setState(() {
                  validMsg3= "valid ✅";
                });
              }
              else if(id==4){
                setState(() {
                  validMsg4= "valid ✅";
                });
              }
              log("valid ✅");
              return true;
            }
          else
            {
              if(id==1){
                setState(() {
                  validMsg1= "the entered integer is not prime!";
                });
              }
              else if(id==2){
                setState(() {
                  validMsg2= "the entered integer is not prime!";
                });
              }
              else if(id==3){
                setState(() {
                  validMsg3= "the entered integer is not prime!";
                });
              }
              else if(id==4){
                setState(() {
                  validMsg4= "the entered integer is not prime!";
                });
              }
              log("the entered integer is not prime!");
              return false;
            }
      }
    else {
      if(id==1){
        setState(() {
          validMsg1= "The entered text is not integer!";
        });
      }
      else if(id==2){
        setState(() {
          validMsg2= "The entered text is not integer!";
        });
      }
      else if(id==3){
        setState(() {
          validMsg3= "The entered text is not integer!";
        });
      }
      else if(id==4){
        setState(() {
          validMsg4= "The entered text is not integer!";
        });
      }
      log( "The entered text is not integer!");
      return false;
    }
  }
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Column(
        children: <Widget>[
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
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child:
          ResponsiveGridRow(
          children: <ResponsiveGridCol>[
            ResponsiveGridCol(
                        xl: 1,
                        lg: 1,
                        xs: 1,
                        child: Container(
                        ),
                      ),
            ResponsiveGridCol(
              xl: 5,
              lg: 5,
              xs: 5,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ClayContainer(
                      borderRadius: 25,
                      depth: 15,
                      curveType: CurveType.convex,
                      color: backGround,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: <Widget>[
                            const AvatarName(showName: true, isSender: true),
                            const SizedBox(height: 20,),

                            Column(
                              children: <Widget>[
                                const SizedBox(height: 20,),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Enter a valid P",
                                    style: TextStyle(
                                        color: grad1,
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: ClayContainer(
                                    borderRadius: 15,
                                    depth: 8,
                                    color: backGround,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        onTap: (){
                                          setState(() {
                                            isValid1=false;
                                            validMsg1=
                                            "must be prime and not equal to Q";
                                          });
                                        },
                                        enabled: !submitted,
                                        controller:
                                        _textEditingController1!,
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                        minLines: 5,
                                        maxLines: 5,
                                        cursorHeight: 20,
                                        cursorColor: grad1,
                                        decoration: InputDecoration(
                                            border: const OutlineInputBorder(
                                                borderSide: const BorderSide(
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
                                                    color: isValid1?grad1:
                                                    Colors.transparent
                                                )
                                            )

                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding:const EdgeInsets.only(left: 18.0),
                                        child: Text(
                                          validMsg1,
                                          style: TextStyle(
                                              color:isValid1?grad1:
                                              const Color(0xffd40606),
                                              fontSize: 16,
                                              fontFamily: "roboto"
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(

                                          onPressed: ()async{
                                        setState(() {
                                          isValid1=validateInput
                                            (_textEditingController1!.text,1);
                                        });

                                      }, style:  ButtonStyle(
                                        shape: MaterialStateProperty.all(const StadiumBorder()),
                                        foregroundColor:MaterialStateProperty.all(backGround) ,
                                      ),
                                          child: const Text("validate"))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                const SizedBox(height: 20,),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Enter a valid Q",
                                    style: TextStyle(
                                        color: grad1,
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: ClayContainer(
                                    borderRadius: 15,
                                    depth: 8,
                                    color: backGround,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        onTap: (){
                                          setState(() {
                                            isValid2=false;
                                            validMsg2=
                                            "must be prime and not equal to P";
                                          });
                                        },
                                        enabled: !submitted,
                                        controller:
                                        _textEditingController2!,
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                        minLines: 5,
                                        maxLines: 5,
                                        cursorHeight: 20,
                                        cursorColor: grad1,
                                        decoration: InputDecoration(
                                            border: const OutlineInputBorder(
                                                borderSide: const BorderSide(
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
                                                    color: isValid2?grad1:
                                                    Colors.transparent
                                                )
                                            )

                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding:const EdgeInsets.only(left: 18.0),
                                        child: Text(
                                          validMsg2,
                                          style: TextStyle(
                                              color:isValid2?grad1:
                                              const Color(0xffd40606),
                                              fontSize: 16,
                                              fontFamily: "roboto"
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(onPressed: ()async{
                                        setState(() {
                                          isValid2=validateInput
                                            (_textEditingController2!.text,2);
                                        });

                                      }, style:  ButtonStyle(
                                        shape: MaterialStateProperty.all(const StadiumBorder()),
                                        foregroundColor:MaterialStateProperty.all(backGround) ,
                                      ),
                                          child: const Text("validate"))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(12),
                  child :
                  Text("Max message length: $maxMsgRaghad Letter",
                  style: const TextStyle(color: grad1,
                    fontFamily: "roboto",
                    fontStyle: FontStyle.italic,
                    fontSize: 18
                  ),
                  )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child:ClayContainer(
                            color: backGround,
                            curveType: CurveType.concave,
                            depth: 8,
                            borderRadius: 30,
                            child: TextButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(const StadiumBorder()),
                                foregroundColor:MaterialStateProperty.all(grad1) ,
                              ),
                              // ignore: prefer_const_constructors
                              child: Padding(
                                padding:const EdgeInsets.all(15.0),
                                child: const Text("Back",
                                  style:TextStyle(
                                      fontSize: 18
                                  ),),
                              ),
                            ),
                          )
                      ),

                      const SizedBox(width: 50,),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child:ClayContainer(
                            color: backGround,
                            curveType: CurveType.concave,
                            depth: 8,
                            borderRadius: 30,
                            child: TextButton(
                              onPressed: ()async{
                                setState(() {

                                  error=false;
                                  isValid1=validateInput(_textEditingController1!.text, 1);
                                  isValid2=validateInput(_textEditingController2!.text, 2);
                                  isValid3=validateInput(_textEditingController3!.text, 3);
                                  isValid4=validateInput(_textEditingController4!.text, 4);
                                });
                                if (isValid1&&isValid2&&isValid3&&isValid4)
                                {
                                  if((_textEditingController1!.text==
                                      _textEditingController2!.text)||(
                                      _textEditingController3!.text==
                                          _textEditingController4!.text))
                                  {
                                    setState(() {
                                      error=true;
                                    });
                                  }
                                  else
                                  {
                                    P_raghad=BigInt.parse(_textEditingController1!.text);
                                    Q_raghad=BigInt.parse(_textEditingController2!.text);
                                    P_donia=BigInt.parse(_textEditingController3!.text);
                                    Q_donia=BigInt.parse(_textEditingController4!.text);
                                    setState(() {
                                      maxMsgRaghad=getMaxMsgLength(P_raghad, Q_raghad);
                                      maxMsgDonia= getMaxMsgLength(P_donia, Q_donia);
                                    });

                                    if(submitted)
                                    {
                                      Map<String, dynamic> res1= await doniaGetKeys();
                                      Map<String, dynamic> res2= await raghadGetKeys();
                                      log(res1["P_donia"].toString());
                                      log(res1["Q_donia"].toString());
                                      log(res2["P_raghad"].toString());
                                      log(res2["Q_raghad"].toString());
                                      e_donia= res1["donia_PUe"].toString();
                                      n_donia=res1["donia_n"].toString();
                                      d_donia= res1["donia_PRd"].toString();
                                      e_raghad= res2["raghad_PUe"].toString();
                                      n_raghad= res2["raghad_n"].toString();
                                      d_raghad= res2["raghad_PRd"].toString();
                                      Navigator.push(context, MaterialPageRoute<Widget>
                                      (builder: (BuildContext context)=>
                                        Communicate(maxMsgLengthDonia: maxMsgDonia,
                                          maxMsgLengthRaghad: maxMsgRaghad,
                                        )));}
                                    submitted=true;
                                    buttonText="Start Chat";
                                  }
                                }
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(const StadiumBorder()),
                                foregroundColor:MaterialStateProperty.all(grad1) ,
                              ),
                              // ignore: prefer_const_constructors
                              child: Padding(
                                padding:const EdgeInsets.all(15.0),
                                child: Text(buttonText,
                                  style:const TextStyle(
                                      fontSize: 18
                                  ),),
                              ),
                            ),
                          )
                      ),
                    ],
                  ),
                ],

              ),

            ),
            ResponsiveGridCol(
              xl: 5,
              lg: 5,
              xs: 5,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ClayContainer(
                      borderRadius: 25,
                      depth: 15,
                      curveType: CurveType.convex,
                      color: backGround,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: <Widget>[
                            const AvatarName(showName: true, isSender: false),
                            const SizedBox(height: 20,),

                            Column(
                              children: <Widget>[
                                const SizedBox(height: 20,),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Enter a valid P",
                                    style: TextStyle(
                                        color: grad2,
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: ClayContainer(
                                    borderRadius: 15,
                                    depth: 8,
                                    color: backGround,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        onTap: (){
                                          setState(() {
                                            isValid3=false;
                                            validMsg3=
                                            "must be prime and not equal to Q";
                                          });
                                        },
                                        enabled: !submitted,

                                        controller:
                                        _textEditingController3!,
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                        minLines: 5,
                                        maxLines: 5,
                                        cursorHeight: 20,
                                        cursorColor: grad2,
                                        decoration: InputDecoration(
                                            border: const OutlineInputBorder(
                                                borderSide: const BorderSide(
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
                                                    color: isValid3?grad2:
                                                    Colors.transparent
                                                )
                                            )

                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding:const EdgeInsets.only(left: 18.0),
                                        child: Text(
                                          validMsg3,
                                          style: TextStyle(
                                              color:isValid3?grad2:
                                              const Color(0xffd40606),
                                              fontSize: 16,
                                              fontFamily: "roboto"
                                          ),
                                        ),
                                      ),
                                      ElevatedButton(onPressed: ()async{
                                        setState(() {
                                          isValid3=validateInput
                                            (_textEditingController3!.text,3);
                                        });

                                      },
                                          style:  ButtonStyle(
                                            shape: MaterialStateProperty.all(const StadiumBorder()),
                                            foregroundColor:MaterialStateProperty.all(backGround) ,
                                            backgroundColor: MaterialStateProperty.all(grad2),
                                          ),
                                          child: const Text("validate"))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                const SizedBox(height: 20,),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Enter a valid Q",
                                    style: TextStyle(
                                        color: grad2,
                                        fontSize: 16
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: ClayContainer(
                                    borderRadius: 15,
                                    depth: 8,
                                    color: backGround,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        onTap: (){
                                          setState(() {
                                            isValid4=false;
                                            validMsg4=
                                            "must be prime and not equal to P";
                                          });
                                        },
                                        enabled: !submitted,

                                        controller:
                                        _textEditingController4!,
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                        minLines: 5,
                                        maxLines: 5,
                                        cursorHeight: 20,
                                        cursorColor: grad2,
                                        decoration: InputDecoration(
                                            border: const OutlineInputBorder(
                                                borderSide: const BorderSide(
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
                                                    color: isValid4?grad2:
                                                    Colors.transparent
                                                )
                                            )

                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Padding(
                                        padding:const EdgeInsets.only(left: 18.0),
                                        child: Text(
                                          validMsg4,
                                          style: TextStyle(
                                              color:isValid4?grad2:
                                              const Color(0xffd40606),
                                              fontSize: 16,
                                              fontFamily: "roboto"
                                          ),
                                        ),
                                      ),
                                      // ignore: duplicate_ignore
                                      ElevatedButton(onPressed: ()async{
                                        setState(() {
                                          isValid4=validateInput
                                            (_textEditingController4!.text,4);
                                        });

                                      },
                                          style:  ButtonStyle(
                                            shape: MaterialStateProperty.all(const StadiumBorder()),
                                            foregroundColor:MaterialStateProperty.all(backGround) ,
                                            backgroundColor: MaterialStateProperty.all(grad2),
                                          ),
                                          child: const Text("validate"))
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(12),
                      child :
                      Text("Max message length: $maxMsgDonia Letter",
                        style: const TextStyle(color: grad2,
                            fontFamily: "roboto",
                            fontStyle: FontStyle.italic,
                            fontSize: 18
                        ),
                      )
                  ),

                ],
              ),

            ),

            ResponsiveGridCol(
              xl: 1,
              lg: 1,
              xs: 1,
              child: Container(
              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          error?const Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              "P AND Q MUST BE NOT EQUAL!",
              style: TextStyle(
                  color:
                  const Color(0xffd40606),
                  fontSize: 18,
                  fontFamily: "roboto"
              ),
            ),
          ):Container(),

        ],
      ),

    );
}
