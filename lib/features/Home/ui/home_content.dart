import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:puzzlegame/features/Home/infraestructure/character_Factory.dart';
import 'package:puzzlegame/features/Home/ui/widgets/card_swipper.dart';
import 'package:puzzlegame/features/Home/ui/widgets/cookie.dart';

import '../../../shared/character.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int cookieAmmount = 0;
  late bool isLoading;
  String cookieProduction = "";
  List<Character> characters = [];
  final NumberFormat _numberFormat = NumberFormat.compact();
  late AudioPlayer _advancedPlayer;
  late AudioCache _audioCache;
  dynamic readJson() async {
    final String response = await rootBundle.loadString('assets/settings.json');
    final data = json.decode(response);
    return data;
  }


  @override
  void initState() {
    setState(() {
      isLoading = true;
    });
    readJson().then((value) {
      final json = value;
      CharacterFactory characterFactory = new CharacterFactory();
      characters = characterFactory.fromJson(json: json);
      _advancedPlayer = AudioPlayer();
    _audioCache = AudioCache(fixedPlayer: _advancedPlayer);

    String _audioPath = 'audio/song1.mp3';

    _audioCache.loop(_audioPath);
      setState(() {
        isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cookieInfo = Provider.of<CookieInfo>(context);
    final Timer timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      
        cookieInfo.sumCurrentCookies(cookieInfo.currentProduction);

        //sleep(const Duration(milliseconds:100));
        t.cancel();
        if(cookieInfo.currentCookieReserve > 100000000) t.cancel();
    });

    if (isLoading)
      return SafeArea(
          child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
      ));
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Cookie Amount:" +
              _numberFormat.format(cookieInfo.currentCookieReserve) +
              "\nCookie Production: " +
              _numberFormat.format(cookieInfo.currentProduction) +
              "/s"),
        ),
        body: cookieInfo.currentCookieReserve < 100000000 ? ListView.builder(
          itemCount: characters.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: BaseCharacterCard(
                character: characters.elementAt(index),
                onPressed: () {},
              ),
            );
          },
        ): Column(
          children: [
            Center(
                child:
                  Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("You Win!",style: TextStyle(fontSize: 40, color: Colors.green, fontWeight: FontWeight.bold,),),
                )),
                Image.asset("assets/img/cup.gif",),
                ElevatedButton(
                  onPressed: () {
                  setState(() {
                    cookieInfo.cookieReserve = 0;
                    cookieInfo.currentProduction = 1;
                  });
                }, child: const Text("Play Again!",))],
        ),
      ),
    );
  }
}
