import 'package:flutter/material.dart';

import 'constants.dart';

class GeneralTopAppBar extends StatelessWidget {
  const GeneralTopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 10,
      backgroundColor: backgroundColor,
    );
  }
}
