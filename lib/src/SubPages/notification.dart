import 'package:flutter/material.dart';
import '../../utils/style/constants.dart';
import '../../widgets/commonText.dart';
import 'appBarWithTitleAndBack.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBarWithTitleAndBack(title: "Notifications", backButton: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: 2,
          itemBuilder: ((context, index) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: Row(
                    children: [
                      Container(
                        height: 43,
                        width: 43,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: kOrange,
                              width: 1.3,
                            )),
                        child: Center(
                          child: Image.asset(
                            "assets/images/notification_gleek.png",
                            height: 11,
                            width: 32,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Flexible(
                          child: commonText(
                        textAlign: TextAlign.start,
                        text:
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        color: kBlack.withAlpha(125),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      )),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(4),
                  child: Divider(),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
