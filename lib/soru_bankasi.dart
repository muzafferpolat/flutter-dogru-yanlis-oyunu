import 'dart:wasm';

import 'package:dogru_yanlis/soru.dart';
import 'package:flutter/material.dart';

class SoruKitabi {
  int _soruIndex = 0;
  List<Soru> _soruBankasi = [
    Soru(soruMetni: "Doğal sayılar sıfır ile başlar", soruYaniti: true),
    Soru(
        soruMetni: "Canlıların en küçük yapı birimine hücre denir",
        soruYaniti: true),
    Soru(
        soruMetni: "Otomobillerde gaza ne kadar basarsan daha az yakıt yakar.",
        soruYaniti: false),
    Soru(soruMetni: "İnsanlar beş kolludur.", soruYaniti: false),
    Soru(soruMetni: "Soğuk hava sıcak havadan daha ağırdır.", soruYaniti: true),
  ];

  String getSoruMetni() {
    return _soruBankasi[_soruIndex].soruMetni;
  }

  bool getSoruYaniti() {
    return _soruBankasi[_soruIndex].soruYaniti;
  }

  void sonrakiSoru() {
    if (_soruIndex + 1 < _soruBankasi.length) {
      _soruIndex++;
    }
  }

  bool soruBittiMi() {
    if (_soruIndex + 1 >= _soruBankasi.length) {
      return true;
    } else {
      return false;
    }
  }

  void testSifirla() {
    _soruIndex = 0;
  }

  int soruSayisi() {
    return _soruBankasi.length - 1;
  }
}
