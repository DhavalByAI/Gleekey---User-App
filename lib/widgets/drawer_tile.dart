import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import '../utils/style/constants.dart';
import 'commonText.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    Key? key,
    required this.tileIcon,
    required this.tileName,
    required this.tileFunction,
  }) : super(key: key);

  final String tileIcon;
  final String tileName;
  final Function() tileFunction;

  @override
  Widget build(BuildContext context) {
    String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
    return Bounce(
      onPressed: tileFunction,
      duration: const Duration(milliseconds: 200),
      child: SizedBox(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              "assets/images/appbar_icons/$tileIcon.png",
              height: 25,
              width: 25,
              color: kWhite,
            ),
            const SizedBox(
              width: 22,
            ),
            commonText(
              text: capitalize(tileName),
              color: kWhite,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}
