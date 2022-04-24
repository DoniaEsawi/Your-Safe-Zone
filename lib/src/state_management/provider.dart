import 'package:flutter/material.dart';

class Msgs extends ChangeNotifier {
  /// 0->sent, 1->received
  List<String> atSender=<String>[];
  List<String> atSenderEnc=<String>[];
  List<String> atReceiver=<String>[];
  List<String> atReceiverEnc=<String>[];
  void sentFromSender(String msg,String enc) {
    atSender.add(msg);
    atSenderEnc.add(enc);
    notifyListeners();
  }

  void receivedToReceiver(String msg,String enc) {
    atReceiver.add(msg);
    atReceiverEnc.add(enc);
    notifyListeners();
  }
}