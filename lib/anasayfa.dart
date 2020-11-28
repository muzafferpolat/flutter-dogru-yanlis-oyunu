import 'package:dogru_yanlis/soruSayfam.dart';
import 'package:flutter/material.dart';

void main() => runApp(AnaSayfa());

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bilgi Yarışı',
      home: Scaffold(
        backgroundColor: Colors.amber,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                  child: Text("Bilgi Yarışı",
                      style: Theme.of(context).textTheme.headline4)),
              RaisedButton(
                color: Colors.pink,
                child: Text(
                  "Oyuna Başla",
                  style: Theme.of(context).textTheme.headline3,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SoruSayfam()),
                  );
                },
              ),
              Center(
                  child: Text("POLAT GAMES",
                      style: Theme.of(context).textTheme.subtitle1)),
            ],
          ),
        ),
      ),
    );
  }
}
