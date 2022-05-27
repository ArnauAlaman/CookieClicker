import 'package:flutter/material.dart';
import 'package:puzzlegame/features/Home/ui/home_content.dart';

class HomePage extends StatelessWidget {
  static const String routeID = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: HomeContent(),
      ),
    );
  }
}
