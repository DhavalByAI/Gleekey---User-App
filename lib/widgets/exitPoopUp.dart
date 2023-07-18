import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';

import '../utils/style/constants.dart';
import 'commonText.dart';

Future<bool> showExitPopup(BuildContext context) async {
  return await showDialog(
        context: context,
        builder: (context) => Dialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                    height: 4,
                    width: 40,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  commonText(
                    color: kBlack,
                    fontSize: 20,
                    text: "Exit?",
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Center(
                    child: commonText(
                      textAlign: TextAlign.center,
                      color: kBlack.withAlpha(125),
                      fontSize: 15,
                      text: "Are You Sure, You Wants To Exit?",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          child: Bounce(
                            duration: const Duration(milliseconds: 300),
                            onPressed: (() {
                              Navigator.of(context).pop(true);
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: kBtnGrey,
                                  borderRadius: BorderRadius.circular(6)),
                              height: 45,
                              child: Center(
                                child: commonText(
                                  textAlign: TextAlign.center,
                                  color: kBlack,
                                  fontSize: 14,
                                  text: "Exit",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Bounce(
                            duration: const Duration(milliseconds: 150),
                            onPressed: () {
                              Get.back();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: kOrange),
                                  color: kOrange,
                                  borderRadius: BorderRadius.circular(6)),
                              height: 45,
                              child: Center(
                                child: commonText(
                                  textAlign: TextAlign.center,
                                  color: kWhite,
                                  fontSize: 14,
                                  text: "Cancel",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ) ??
      false; //if showDialouge had returned null, then return false
}
