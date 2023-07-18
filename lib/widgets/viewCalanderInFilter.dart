import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/style/constants.dart';
import 'calander.dart';
import 'commonText.dart';
import 'searchEdit.dart';

class viewCalanderInFilter extends StatelessWidget {
  String date;
  viewCalanderInFilter({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
      ),
      child: PopupMenuButton(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          padding: const EdgeInsets.all(0),
          splashRadius: 1,
          tooltip: "",
          enableFeedback: false,
          position: PopupMenuPosition.over,
          offset: const Offset(-1, 0),
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 90,
          ),
          itemBuilder: ((context) {
            return [
              PopupItem(
                  child: Padding(
                padding:
                    const EdgeInsets.only(top: 4, bottom: 8, left: 4, right: 4),
                child: Container(
                  color: kWhite,
                  width: MediaQuery.of(context).size.width - 90,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(
                              "assets/images/cancel.png",
                              height: 21,
                              width: 21,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          commonText(
                            text: "When's Your Trip?",
                            color: kBlack,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const calander(),
                      // SizedBox(
                      //   height: 16,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Container(
                      //       height: 30,
                      //       width: 60,
                      //       decoration: BoxDecoration(
                      //           boxShadow: [
                      //             BoxShadow(
                      //               color: kDarkGrey.withOpacity(0.5),
                      //               blurRadius: 2,
                      //             )
                      //           ],
                      //           color: kWhite,
                      //           border: Border.all(
                      //             color: kBlack.withOpacity(0.6),
                      //           ),
                      //           borderRadius: BorderRadius.circular(6)),
                      //       child: Center(
                      //         child: commonText(
                      //           text: "Clear",
                      //           color: kBlack.withAlpha(125),
                      //           fontSize: 10,
                      //           fontWeight: FontWeight.w700,
                      //         ),
                      //       ),
                      //     ),
                      //     Container(
                      //       height: 30,
                      //       width: 60,
                      //       decoration: BoxDecoration(
                      //           boxShadow: [
                      //             BoxShadow(
                      //               color: kDarkGrey.withOpacity(0.5),
                      //               blurRadius: 2,
                      //             )
                      //           ],
                      //           color: kOrange,
                      //           borderRadius: BorderRadius.circular(6)),
                      //       child: Center(
                      //         child: commonText(
                      //           text: "Next",
                      //           color: kWhite,
                      //           fontSize: 10,
                      //           fontWeight: FontWeight.w700,
                      //         ),
                      //       ),
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                ),
              ))
            ];
          }),
          child: Container(
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kWhite,
                boxShadow: [
                  BoxShadow(
                      color: kDarkGrey.withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0.0, 5.0))
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonText(
                    text: date,
                    color: kBlack,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                  Image.asset(
                    "assets/images/booking_icon_color.png",
                    color: kOrange,
                    height: 24,
                  )
                ],
              ),
            ),
          )),
    );
  }
}
