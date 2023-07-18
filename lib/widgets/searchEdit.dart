import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/SubPages/SearchPlaces/searchBar.dart';
import '../src/SubPages/SearchPlaces/searchPlaces_controller.dart';
import '../utils/style/constants.dart';
import '../utils/style/palette.dart';
import 'commonText.dart';
import 'viewCalanderInFilter.dart';

class searchEdit extends StatelessWidget {
  const searchEdit({super.key});

  @override
  Widget build(BuildContext context) {
    SearchPlacesController _ = Get.find();
    return Container(
      color: kWhite,
      width: double.maxFinite,
      child: Theme(
        data: Theme.of(context).copyWith(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: PopupMenuButton(
            splashRadius: 0,
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 30,
            ),
            offset: const Offset(0, 10),
            position: PopupMenuPosition.under,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            itemBuilder: ((context) {
              return [
                PopupItem(
                  child: Container(
                    width: double.maxFinite,
                    color: kWhite,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: (() {
                                Navigator.pop(context);
                              }),
                              child: Image.asset(
                                "assets/images/cancel.png",
                                height: 21,
                                width: 21,
                              ),
                            ),
                            // const SizedBox(
                            //   height: 12,
                            // ),
                            // commonText(
                            //   text: "Destination",
                            //   color: kBlack.withAlpha(125),
                            //   fontSize: 12,
                            //   fontWeight: FontWeight.w600,
                            // ),
                            // const SizedBox(
                            //   height: 12,
                            // ),
                            // Theme(
                            //   data: Theme.of(context).copyWith(
                            //     highlightColor: Colors.transparent,
                            //     splashColor: Colors.transparent,
                            //     focusColor: Colors.transparent,
                            //   ),
                            //   child: PopupMenuButton(
                            //       shape: const RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.only(
                            //               bottomLeft: Radius.circular(30),
                            //               bottomRight: Radius.circular(30))),
                            //       padding: const EdgeInsets.all(0),
                            //       splashRadius: 1,
                            //       tooltip: "",
                            //       enableFeedback: false,
                            //       position: PopupMenuPosition.over,
                            //       offset: const Offset(-1, 0),
                            //       constraints: BoxConstraints(
                            //         maxWidth:
                            //             MediaQuery.of(context).size.width - 90,
                            //       ),
                            //       itemBuilder: ((context) {
                            //         return [
                            //           PopupItem(
                            //               child: Container(
                            //             color: kWhite,
                            //             width:
                            //                 MediaQuery.of(context).size.width -
                            //                     90,
                            //             child: const SearchPlaces(),
                            //           ))
                            //         ];
                            //       }),
                            //       child: Container(
                            //         height: 45,
                            //         decoration: BoxDecoration(
                            //             borderRadius: BorderRadius.circular(10),
                            //             color: kWhite,
                            //             boxShadow: [
                            //               BoxShadow(
                            //                   color: kDarkGrey.withOpacity(0.5),
                            //                   blurRadius: 10,
                            //                   offset: const Offset(0.0, 5.0))
                            //             ]),
                            //         child: Padding(
                            //           padding: const EdgeInsets.symmetric(
                            //               horizontal: 20),
                            //           child: Row(
                            //             mainAxisAlignment:
                            //                 MainAxisAlignment.spaceBetween,
                            //             children: [
                            //               GetBuilder<SearchPlacesController>(
                            //                   initState: (_) {},
                            //                   builder: (_) {
                            //                     return Expanded(
                            //                       child: commonText(
                            //                         maxlines: 1,
                            //                         text: _.selectedPlace,
                            //                         color: kBlack,
                            //                         textAlign: TextAlign.start,
                            //                         fontSize: 12,
                            //                         fontWeight: FontWeight.w700,
                            //                       ),
                            //                     );
                            //                   }),
                            //               Image.asset(
                            //                 "assets/images/calander.png",
                            //                 color: kOrange,
                            //                 height: 24,
                            //               )
                            //             ],
                            //           ),
                            //         ),
                            //       )),
                            // ),

                            const SizedBox(
                              height: 12,
                            ),
                            commonText(
                              text: "Check In",
                              color: kBlack.withAlpha(125),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            GetBuilder<SearchPlacesController>(
                                initState: (_) {},
                                builder: (_) {
                                  return viewCalanderInFilter(
                                    date: _.startDate ?? "Start Date",
                                  );
                                }),
                            const SizedBox(
                              height: 12,
                            ),
                            commonText(
                              text: "Check Out",
                              color: kBlack.withAlpha(125),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            GetBuilder<SearchPlacesController>(
                                initState: (_) {},
                                builder: (_) {
                                  return viewCalanderInFilter(
                                    date: _.endDate ?? "End Date",
                                  );
                                }),
                            const SizedBox(
                              height: 12,
                            ),
                            commonText(
                              text: "Room & Guest House",
                              color: kBlack.withAlpha(125),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Theme(
                              data: Theme.of(context).copyWith(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
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
                                    maxWidth:
                                        MediaQuery.of(context).size.width - 90,
                                  ),
                                  itemBuilder: ((context) {
                                    return [
                                      PopupItem(
                                          child: Container(
                                        color: kWhite,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                90,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: (() {
                                                    Navigator.pop(context);
                                                  }),
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
                                                  text: "Who's Coming?",
                                                  color: kBlack,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            commonText(
                                              text: " Adults",
                                              color: kBlack.withAlpha(125),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            addRemoveButtons(variable: "A"),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            commonText(
                                              text: " Children",
                                              color: kBlack.withAlpha(125),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            addRemoveButtons(
                                              variable: "C",
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            commonText(
                                              text: " Infants",
                                              color: kBlack.withAlpha(125),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            addRemoveButtons(
                                              variable: "I",
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                          ],
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GetBuilder<SearchPlacesController>(
                                              initState: (_) {},
                                              builder: (_) {
                                                return commonText(
                                                  text:
                                                      "${_.totalAdults} Adults, ${_.totalChildren} Children, ${_.totalInphant} Infants",
                                                  color: kBlack,
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w700,
                                                );
                                              }),
                                          Image.asset(
                                            "assets/images/calander.png",
                                            color: kOrange,
                                            height: 24,
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 26,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Bounce(
                                  duration: const Duration(milliseconds: 300),
                                  onPressed: () {
                                    SearchPlacesController _ =
                                        Get.put(SearchPlacesController());
                                    _.pridiction = [];
                                    _.selectedPlace = "Search Places";
                                    _.startDate = null;
                                    _.endDate = null;
                                    _.totalAdults = 1;
                                    _.totalChildren = 0;
                                    _.totalInphant = 0;
                                    _.update();
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: kDarkGrey.withOpacity(0.5),
                                            blurRadius: 2,
                                          )
                                        ],
                                        color: kWhite,
                                        border: Border.all(
                                          color: kBlack.withOpacity(0.6),
                                        ),
                                        borderRadius: BorderRadius.circular(6)),
                                    child: Center(
                                      child: commonText(
                                        text: "Clear",
                                        color: kBlack.withAlpha(125),
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: kDarkGrey.withOpacity(0.5),
                                          blurRadius: 2,
                                        )
                                      ],
                                      color: kOrange,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Center(
                                    child: commonText(
                                      text: "Update",
                                      color: kWhite,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ];
            }),
            enableFeedback: false,
            child: Card(
                elevation: 4,
                color: kOrange,
                shape: Palette.smallCardShape,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    height: 28,
                    width: 28,
                    child: commonText(
                      text: "Edit",
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ))),
      ),
    );
  }
}

class PopupItem extends PopupMenuItem {
  const PopupItem({
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  @override
  _PopupItemState createState() => _PopupItemState();
}

class _PopupItemState extends PopupMenuItemState {
  @override
  void handleTap() {}
}
