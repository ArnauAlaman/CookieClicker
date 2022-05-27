import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../shared/character.dart';
import 'cookie.dart';

class BaseCharacterCard extends StatefulWidget {
  final onPressed;
  final Character character;
  BaseCharacterCard({
    Key? key,
    required this.character,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<BaseCharacterCard> createState() => _BaseCharacterCardState();
}

class _BaseCharacterCardState extends State<BaseCharacterCard> {
  final NumberFormat _numberFormat = NumberFormat.compact();

  int numCharacters = 0;
  double multiplier = 1;
  int currentProduction = 1;
  double getCurrentProduction(
      int ibaseProduction, int inumCharacters, double imultiplier) {
    return ibaseProduction * imultiplier * inumCharacters;
  }

  @override
  Widget build(BuildContext context) {
    final cookieInfo = Provider.of<CookieInfo>(context);

    return GestureDetector(
      onTap: () {
        cookieInfo.IncrementCookieProduction(1);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.black,
        margin: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 10),
              child: Image(
                height: 125,
                image: AssetImage(widget.character.img),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 15, top: 5),
                  child: Text(
                    numCharacters.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: "zerovelo"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, top: 0),
                  child: Text(
                    widget.character.textContent,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontFamily: 'atarian'),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5, top: 0),
                      child: RaisedButton(
                        color: Colors.red,
                        onPressed: () {
                          if (numCharacters % 5 == 0) {
                            multiplier = multiplier * 1.3;
                          }
                          setState(() {
                            int previousProduction = currentProduction;
                            currentProduction = getCurrentProduction(
                                    widget.character.baseProduction,
                                    numCharacters++,
                                    multiplier)
                                .toInt();
                            int totalIncrement = currentProduction - previousProduction;
                            cookieInfo.currentProduction += totalIncrement;
                          });
                        },
                        child: Text(
                          "Buy 1",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, right: 15),
                      child: Text(
                        _numberFormat.format(currentProduction).toString() +
                            "/s",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: 'atarian'),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
