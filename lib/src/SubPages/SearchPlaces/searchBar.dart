import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/SubPages/Filter/filter.dart';

import 'package:gleekey_user/src/SubPages/SearchPlaces/searchPlaces_controller.dart';
import 'package:gleekey_user/src/SubPages/SearchPlaces/searchPlaces_view.dart';
import 'package:gleekey_user/widgets/loder.dart';
import 'package:gleekey_user/widgets/text_fields_widgets/custom_textfield_common.dart';
import 'package:gleekey_user/widgets/viewCalanderInFilter.dart';
import '../../../utils/style/constants.dart';
import '../../../utils/style/palette.dart';
import '../../../widgets/commonText.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

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
                            const SizedBox(
                              height: 12,
                            ),
                            commonText(
                              text: "Destination",
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
                                        child: const SearchPlaces(),
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
                                                return Expanded(
                                                  child: commonText(
                                                    maxlines: 1,
                                                    text: _.selectedPlace,
                                                    color: kBlack,
                                                    textAlign: TextAlign.start,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                );
                                              }),
                                          Image.asset(
                                            "assets/images/global-search.png",
                                            color: kOrange,
                                            height: 24,
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            commonText(
                              text: "Property Name",
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
                                focusColor: Colors.transparent,
                              ),
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
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[350],
                                      ),
                                      height: 45,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 14),
                                          child: commonText(
                                            text: '#GLEEKEY-',
                                            color: kBlack,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: CustomTextfieldCommon(
                                        isBorder: false,
                                        controller: _.gleekeySearchController,
                                        hint: 'Property ID',
                                        validate: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
                                            addRemoveButtons(
                                              variable: "A",
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            commonText(
                                              text: " Childrens",
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
                                            "assets/images/people.png",
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
                                    SearchPlacesController _ = Get.find();
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
                                GetBuilder<SearchPlacesController>(
                                  initState: (_) {},
                                  builder: (_) {
                                    return Bounce(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      onPressed: () async {
                                        loaderShow(context);
                                        await _.getApi();
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    kDarkGrey.withOpacity(0.5),
                                                blurRadius: 2,
                                              )
                                            ],
                                            color: kOrange,
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        child: Center(
                                          child: commonText(
                                            text: "Search",
                                            color: kWhite,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
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
            child: Row(
              children: [
                Expanded(
                    child: SizedBox(
                  height: 55,
                  child: Card(
                    elevation: 4,
                    shape: Palette.smallCardShape,
                    child: GetBuilder<SearchPlacesController>(
                      initState: (_) {},
                      builder: (_) {
                        return Row(
                          children: [
                            const SizedBox(
                              width: 12,
                            ),
                            commonText(
                                text: _.selectedPlace,
                                color: kTextgrey,
                                fontSize: 14),
                            const Spacer(),
                            const Icon(
                              Icons.search_rounded,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                )),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: (() {
                    Get.to(() => const Filter());
                  }),
                  child: Card(
                      elevation: 4,
                      color: kOrange,
                      shape: Palette.smallCardShape,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 28,
                          width: 28,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/filter.png'))),
                        ),
                      )),
                )
              ],
            )),
      ),
    );
  }
}

class addRemoveButtons extends StatelessWidget {
  String variable;
  addRemoveButtons({Key? key, required this.variable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchPlacesController>(
      initState: (_) {},
      builder: (_) {
        return Row(
          children: [
            Expanded(
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
                  child: Center(
                    child: commonText(
                      text: variable == "A"
                          ? _.totalAdults.toString()
                          : variable == "C"
                              ? _.totalChildren.toString()
                              : _.totalInphant.toString(),
                      color: kBlack,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            Bounce(
              onPressed: (() {
                switch (variable) {
                  case "A":
                    _.totalAdults++;
                    break;
                  case "C":
                    _.totalChildren++;
                    break;
                  case "I":
                    _.totalInphant++;
                    break;
                }
                _.update();
              }),
              duration: const Duration(milliseconds: 100),
              child: Container(
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kOrange,
                ),
                child: const Icon(
                  Icons.add_rounded,
                  color: kWhite,
                  size: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 25,
            ),
            commonText(
              text: "1",
              color: kBlack,
              fontSize: 15,
              fontWeight: FontWeight.w900,
            ),
            const SizedBox(
              width: 25,
            ),
            Bounce(
              onPressed: (() {
                switch (variable) {
                  case "A":
                    _.totalAdults > 1 ? _.totalAdults-- : null;
                    break;
                  case "C":
                    _.totalChildren > 0 ? _.totalChildren-- : null;
                    break;
                  case "I":
                    _.totalInphant > 0 ? _.totalInphant-- : null;
                    break;
                }
                _.update();
              }),
              duration: const Duration(milliseconds: 100),
              child: Container(
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kOrange,
                ),
                child: const Icon(
                  Icons.remove_rounded,
                  color: kWhite,
                  size: 20,
                ),
              ),
            ),
          ],
        );
      },
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
