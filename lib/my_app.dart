import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:puzzlegame/features/Home/ui/home_page.dart';

import 'features/Home/ui/widgets/cookie.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CookieInfo(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.routeID,
        routes: {
          HomePage.routeID: (context) => HomePage(),
        },
      ),
    );
  }
}
