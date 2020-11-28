import 'package:dogru_yanlis/soru_bankasi.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

void main() => runApp(SoruSayfam());

class SoruSayfam extends StatefulWidget {
  @override
  _SoruSayfamState createState() => _SoruSayfamState();
}

class _SoruSayfamState extends State<SoruSayfam> {
  var yanitIconu = yanlisIkonu;
  int puan = 0;

  void butonFonksiyonu(bool secilenButon) {
    if (kitap_1.soruBittiMi() == true) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("Yarış bitti"),
            content: new Text("Tebrikler puanınız : " +
                ((puan / (kitap_1.soruSayisi() * 10) * 100))
                    .toStringAsFixed(0)),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Kapat"),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    kitap_1.testSifirla();
                    puan = 0;
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          );
        },
      );
    } else {
      setState(() {
        if (kitap_1.getSoruYaniti() == secilenButon) {
          yanitIconu = dogruIkonu;
          puan += 10;
        } else {
          yanitIconu = yanlisIkonu;
        }
        kitap_1.sonrakiSoru();
      });
    }
  }

  SoruKitabi kitap_1 = SoruKitabi();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bilgi Yarışması',
      home: Scaffold(
        backgroundColor: Colors.blue.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                        kitap_1.getSoruMetni(),
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: RaisedButton(
                              color: Colors.green,
                              child: Text(
                                "DOĞRU",
                                style: TextStyle(fontSize: 18),
                              ),
                              onPressed: () {
                                butonFonksiyonu(true);
                              },
                            ),
                          ),
                        ),
                        Container(child: yanitIconu),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: RaisedButton(
                              color: Colors.red,
                              child: Text("YANLIŞ",
                                  style: TextStyle(fontSize: 18)),
                              onPressed: () {
                                butonFonksiyonu(false);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
