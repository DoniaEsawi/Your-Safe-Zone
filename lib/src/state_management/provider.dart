import "package:flutter/material.dart";

class Msgs extends ChangeNotifier {
  /// 0->sent, 1->received
  Map<int,List<String>> atDonia=<int,List<String>> {};
  List<String> atDoniaEnc=<String>[];

  ////////////////////////////////////////
  Map<int,List<String>> atRaghad=<int,List<String>> {};
  List<String> atRaghadEnc=<String>[];


  void sentFromDonia(String msg,String enc) {
    atDonia[atDoniaEnc.length]=<String>["sent",
    msg];

    atDoniaEnc.add(enc);
    notifyListeners();
  }

  void receivedToDonia(String msg,String enc) {
    atDonia[atDoniaEnc.length]=<String>["rec",
      msg];
    atDoniaEnc.add(enc);
    notifyListeners();
  }

  void sentFromRaghad(String msg,String enc) {
    atRaghad[atRaghadEnc.length]=<String>["sent",
      msg];
    atRaghadEnc.add(enc);
    notifyListeners();
  }

  void receivedToRaghad(String msg,String enc) {
    atRaghad[atRaghadEnc.length]=<String>["rec",
      msg];
    atRaghadEnc.add(enc);
    notifyListeners();
  }
}