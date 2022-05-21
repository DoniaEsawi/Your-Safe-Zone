import "dart:io";

import "package:bitsdojo_window/bitsdojo_window.dart";
import "package:clay_containers/clay_containers.dart";
import "package:file_picker/file_picker.dart";
import "package:flutter/material.dart";
import "package:rsa_algorithm/src/configs/palette.dart";
import "package:rsa_algorithm/src/methods/requests.dart";
import "package:rsa_algorithm/src/screens/widgets/titleBar.dart";

class Attack extends StatefulWidget {
  final bool isBF;
  const Attack({
    required this.isBF,
    Key? key}) : super(key: key);

  @override
  _AttackState createState() => _AttackState();
}

class _AttackState extends State<Attack> {
  ScrollController? scrollController1;
  ScrollController? scrollController2;
  @override
  void initState() {
    super.initState();
    scrollController1=ScrollController();
    scrollController2=ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController1!.dispose();
    scrollController2!.dispose();
  }
  String nFileName="Select n keys File";
  String eFileName="Select e keys File";
  String cFileName="Select int ciphers File";
  bool isAttacking=false;
  List<String> nValues=<String>[];
  List<String> eValues=<String>[];
  List<String> cValues=<String>[];
  List<String> attacked=<String>[];
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
          Column(
            children: [
              Image.asset("assets/logos/logo2.png",width: 100,),
              const SizedBox(height: 10,),
              const Text("Your Safe Zone",
              style: TextStyle(
                color: grad1
              ),)
            ],
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(38.0),
                  child: SingleChildScrollView(
                    controller: scrollController1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:<Widget>[
                        Container(
                        decoration: BoxDecoration(borderRadius:
                        const BorderRadius.all(Radius.circular(35)),
                        border: Border.all(
                          color: grad1,
                          width: 1.0
                        ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0,
                          vertical: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: Text(nFileName,
                                style: const TextStyle(
                                  color: grad1,
                                  fontFamily: "Roboto",
                                  fontSize: 24.0,
                                ),),
                              ),

                              ClayContainer(
                                color: backGround,
                                curveType: CurveType.concave,
                                depth: 10,
                                borderRadius: 30,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30
                                      )
                                  ),
                                  child: TextButton(onPressed: ()async{
                                    FilePickerResult? result = await
                                    FilePicker.platform.pickFiles(
                                      allowedExtensions: <String>["txt"],
                                      type: FileType.custom,
                                    );

                                    if (result != null) {
                                      File file = File(result.files.single.path!);
                                      List<String> lines=await file.readAsLines();
                                      setState((){
                                        nValues= lines;
                                        nFileName= file.path.split("\\").last;
                                      });
                                      //print(text);
                                    } else {

                                    }
                                  },
                                      child:const Padding(
                                        padding:  EdgeInsets.symmetric(
                                            horizontal: 26.0,
                                            vertical: 18),
                                        child: Text("Pick",textScaleFactor: 1.5,
                                        style: TextStyle(
                                          color: grad1
                                        ),),
                                      )
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                        const SizedBox(height: 20,),
                        Container(
                          decoration: BoxDecoration(borderRadius:
                          const BorderRadius.all(Radius.circular(35)),
                            border: Border.all(
                                color: grad3,
                                width: 1.0
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0,
                                vertical: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Text(eFileName,
                                    style: const TextStyle(
                                      color: grad3,
                                      fontFamily: "Roboto",
                                      fontSize: 24.0,
                                    ),),
                                ),

                                ClayContainer(
                                  color: backGround,
                                  curveType: CurveType.concave,
                                  depth: 10,
                                  borderRadius: 30,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30
                                        )
                                    ),
                                    child: TextButton(onPressed: ()async{
                                      FilePickerResult? result = await
                                      FilePicker.platform.pickFiles(
                                        allowedExtensions: <String>["txt"],
                                        type: FileType.custom,
                                      );

                                      if (result != null) {
                                        File file = File(result.files.single.path!);
                                        List<String> lines=await file.readAsLines();
                                        setState((){
                                          eValues= lines;
                                          eFileName= file.path.split("\\").last;
                                        });
                                        //print(text);
                                      } else {

                                      }
                                    },
                                        child:const Padding(
                                          padding:  EdgeInsets.symmetric(
                                              horizontal: 26.0,
                                              vertical: 18),
                                          child: Text("Pick",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color: grad3
                                            ),),
                                        )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Container(
                          decoration: BoxDecoration(borderRadius:
                          const BorderRadius.all(Radius.circular(35)),
                            border: Border.all(
                                color: grad1,
                                width: 1.0
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0,
                                vertical: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Text(cFileName,
                                    style: const TextStyle(
                                      color: grad1,
                                      fontFamily: "Roboto",
                                      fontSize: 24.0,
                                    ),),
                                ),

                                ClayContainer(
                                  color: backGround,
                                  curveType: CurveType.concave,
                                  depth: 10,
                                  borderRadius: 30,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30
                                        )
                                    ),
                                    child: TextButton(onPressed: ()async{
                                      FilePickerResult? result = await
                                      FilePicker.platform.pickFiles(
                                        allowedExtensions: <String>["txt"],
                                        type: FileType.custom,
                                      );

                                      if (result != null) {
                                        File file = File(result.files.single.path!);
                                        List<String> lines=await file.readAsLines();
                                        setState((){
                                          cValues= lines;
                                          cFileName= file.path.split("\\").last;
                                        });
                                        //print(text);
                                      } else {

                                      }
                                    },
                                        child:const Padding(
                                          padding:  EdgeInsets.symmetric(
                                              horizontal: 26.0,
                                              vertical: 18),
                                          child: Text("Pick",textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color: grad1
                                            ),),
                                        )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0,
                              vertical: 18),
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
                              child: TextButton(onPressed: ()async{
                                if(isAttacking==false&&nValues.isNotEmpty&&
                                eValues.isNotEmpty&&cValues.isNotEmpty) {

                                  setState(() {
                                    isAttacking = true;
                                  });
                                  int m = 0;
                                  setState(() {
                                    attacked.clear();
                                  });
                                  while (m < cValues.length) {
                                    if(widget.isBF) {
                                      Map<String,
                                          dynamic> res1 = await bfAttack(
                                          nValues[m], eValues[m], cValues[m]);
                                      setState(() {
                                        attacked.add(res1["attacked_message"].
                                        toString());
                                      });
                                    }
                                    else{

                                      List<dynamic> res = await
                                      Future.wait(<Future<dynamic>>
                                      [initCCA(m),
                                        startCCA(cValues[m],
                                        eValues[m],
                                        nValues[m])]);
                                      setState(() {
                                        attacked.add(res[1]["message_attacked"].
                                        toString());
                                      });
                                    }
                                    m+=1;
                                  }
                                  setState(() {
                                    isAttacking = false;
                                  });
                                }
                                else
                                  {const snackBar = SnackBar(
                                    content: Text("Failed to attack, either wrong files, or the system is busy"),
                                    backgroundColor: Colors.red,

                                  );

                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }
                              },
                                  child: Padding(
                                    padding:const  EdgeInsets.symmetric(
                                        horizontal: 26.0,
                                        vertical: 18),
                                    child: Text(isAttacking?"Hacking...":
                                    "Start Attack 👨‍💻",
                                      textScaleFactor: 1.5,
                                      style:const TextStyle(
                                          color: grad3
                                      ),),
                                  )
                              ),
                            ),
                          ),
                        ),

                      ]
                    ),
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
                          controller: scrollController2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                                  const Text("Attacked Messages 🐱‍💻",
                                    style: TextStyle(
                                        fontFamily: "roboto-mono",
                                        fontWeight: FontWeight.bold,
                                        color: grad1,
                                        fontSize: 24
                                    ),
                                  ),

                              Divider(color: Colors.grey.withOpacity(0.2),
                                thickness: 2,
                                height: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: attacked.map((e) =>
                                    Column(

                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [

                                            Text(e.toString(),
                                              style: const TextStyle(
                                                  fontFamily: "roboto-mono",
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: 16
                                              ),
                                            ),
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
            padding: const EdgeInsets.only(bottom: 50.0,
            top: 20),
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

    );
}
