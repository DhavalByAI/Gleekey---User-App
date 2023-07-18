// ignore_for_file: depend_on_referenced_packages, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/SubPages/SearchPlaces/searchPlaces_controller.dart';
import 'package:gleekey_user/src/SubPages/appBarWithTitleAndBack.dart';
import 'package:gleekey_user/utils/baseconstant.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/utils/style/palette.dart';
import 'package:gleekey_user/widgets/cNetworkImage.dart';
import 'package:gleekey_user/widgets/c_dropdown.dart';
import 'package:gleekey_user/widgets/commonText.dart';
import 'package:gleekey_user/widgets/loder.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';
import 'filter_controller.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    FilterController _ = Get.put(FilterController());
    return SafeArea(
        child: GetBuilder<FilterController>(
            initState: (_) {},
            builder: (_) {
              return Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: kWhite,
                appBar: AppBarWithTitleAndBack(title: "Filter"),
                body: _.isDataLoaded
                    ? SingleChildScrollView(
                        child: GetBuilder<FilterController>(
                          initState: (_) {},
                          builder: (_) {
                            return Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  commonText(
                                    text: "Price Range",
                                    color: kBlack,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const SizedBox(
                                    height: 45,
                                  ),
                                  Flexible(
                                    child: SizedBox(
                                      child: GetBuilder<FilterController>(
                                        initState: (_) {},
                                        builder: (_) {
                                          return SfRangeSlider(
                                            shouldAlwaysShowTooltip: true,
                                            tooltipShape:
                                                const SfPaddleTooltipShape(),
                                            min: double.parse(_.result['data']
                                                    ['default_min_price']
                                                .toString()),
                                            max: double.parse(_.result['data']
                                                    ['default_max_price']
                                                .toString()),
                                            values:
                                                const SfRangeValues(0, 4000),
                                            numberFormat: NumberFormat(''),
                                            showTicks: false,
                                            showLabels: false,
                                            enableTooltip: true,
                                            onChanged: (SfRangeValues values) {
                                              _.values = values;
                                              _.currMinPrice = double.parse(
                                                  values.start.toString());
                                              _.currMaxPrice = double.parse(
                                                  values.end.toString());
                                              _.update();
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    height: 1,
                                    color: kDarkGrey,
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  commonText(
                                    text: "Sort By",
                                    color: kBlack,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const SizedBox(
                                    height: 22,
                                  ),
                                  GetBuilder<FilterController>(
                                    initState: (_) {},
                                    builder: (_) {
                                      return cDropDown(items: [
                                        'Select Sort By',
                                        'Popular',
                                        'Bestseller',
                                        'Gleekey\'s Choice',
                                        'Newest',
                                        'Oldest'
                                      ]);
                                    },
                                  ),
                                  const SizedBox(
                                    height: 22,
                                  ),
                                  const Divider(
                                    height: 1,
                                    color: kDarkGrey,
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  commonText(
                                    text: "Rooms And Beds",
                                    color: kBlack,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const SizedBox(
                                    height: 22,
                                  ),
                                  // GetBuilder<FilterController>(
                                  //   initState: (_) {},
                                  //   builder: (_) {
                                  //     return Wrap(
                                  //       runSpacing: 16,
                                  //       spacing: 16,
                                  //       children: [
                                  //         Flexible(
                                  //           flex: 3,
                                  //           child: Column(
                                  //             mainAxisSize: MainAxisSize.min,
                                  //             children: [
                                  //               Row(
                                  //                 mainAxisSize:
                                  //                     MainAxisSize.min,
                                  //                 children: [
                                  //                   Image.asset(
                                  //                       'assets/images/bed.png'),
                                  //                   const SizedBox(
                                  //                     width: 12,
                                  //                   ),
                                  //                   commonText(
                                  //                       text: 'Bedrooms',
                                  //                       color: Colors.black,
                                  //                       fontSize: 14)
                                  //                 ],
                                  //               ),
                                  //               const SizedBox(
                                  //                 height: 12,
                                  //               ),
                                  //               cDropDown(width: 150, items: [
                                  //                 'Bedrooms',
                                  //                 '1',
                                  //                 '2',
                                  //                 '3',
                                  //                 '4',
                                  //                 '5',
                                  //                 '6',
                                  //                 '7',
                                  //                 '8',
                                  //                 '9',
                                  //                 '10'
                                  //               ])
                                  //             ],
                                  //           ),
                                  //         ),
                                  //         Flexible(
                                  //           flex: 3,
                                  //           child: Column(
                                  //             mainAxisSize: MainAxisSize.min,
                                  //             children: [
                                  //               Row(
                                  //                 mainAxisSize:
                                  //                     MainAxisSize.min,
                                  //                 children: [
                                  //                   Image.asset(
                                  //                       'assets/images/bed.png'),
                                  //                   const SizedBox(
                                  //                     width: 12,
                                  //                   ),
                                  //                   commonText(
                                  //                       text: 'Bathrooms',
                                  //                       color: Colors.black,
                                  //                       fontSize: 14)
                                  //                 ],
                                  //               ),
                                  //               const SizedBox(
                                  //                 height: 12,
                                  //               ),
                                  //               cDropDown(width: 150, items: [
                                  //                 'Bathrooms',
                                  //                 '0.5',
                                  //                 '1',
                                  //                 '1.5',
                                  //                 '2',
                                  //                 '2.5',
                                  //                 '3',
                                  //                 '3.5',
                                  //                 '4',
                                  //                 '4.5',
                                  //                 '5',
                                  //                 '5.5',
                                  //                 '6',
                                  //                 '6.5',
                                  //                 '7',
                                  //                 '7.5',
                                  //                 '8+'
                                  //               ])
                                  //             ],
                                  //           ),
                                  //         ),
                                  //         Flexible(
                                  //           flex: 3,
                                  //           child: Column(
                                  //             mainAxisSize: MainAxisSize.min,
                                  //             children: [
                                  //               Row(
                                  //                 mainAxisSize:
                                  //                     MainAxisSize.min,
                                  //                 children: [
                                  //                   Image.asset(
                                  //                       'assets/images/bed.png'),
                                  //                   const SizedBox(
                                  //                     width: 12,
                                  //                   ),
                                  //                   commonText(
                                  //                       text: 'Beds',
                                  //                       color: Colors.black,
                                  //                       fontSize: 14)
                                  //                 ],
                                  //               ),
                                  //               const SizedBox(
                                  //                 height: 12,
                                  //               ),
                                  //               cDropDown(width: 150, items: [
                                  //                 'Beds',
                                  //                 '1',
                                  //                 '2',
                                  //                 '3',
                                  //                 '4',
                                  //                 '5',
                                  //                 '6',
                                  //                 '7',
                                  //                 '8',
                                  //                 '9',
                                  //                 '10',
                                  //                 '11',
                                  //                 '12',
                                  //                 '13',
                                  //                 '14',
                                  //                 '15',
                                  //                 '16+'
                                  //               ])
                                  //             ],
                                  //           ),
                                  //         ),
                                  //       ],
                                  //     );
                                  //   },
                                  // ),

                                  const SizedBox(
                                    height: 22,
                                  ),
                                  const Divider(
                                    height: 1,
                                    color: kDarkGrey,
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  commonText(
                                    text: "Property Type",
                                    color: kBlack,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const SizedBox(
                                    height: 22,
                                  ),
                                  SizedBox(
                                      height: 95,
                                      child: GetBuilder<FilterController>(
                                          builder: (_) {
                                        return ListView.builder(
                                          itemCount: _.PropertyTypeName.length,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 12),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Bounce(
                                                    duration: const Duration(
                                                        milliseconds: 150),
                                                    onPressed: () {
                                                      _.filteredPropertyType
                                                              .contains(
                                                                  _.PropertyTypeID[
                                                                      index])
                                                          ? _.filteredPropertyType
                                                              .remove(
                                                                  _.PropertyTypeID[
                                                                      index])
                                                          : _.filteredPropertyType
                                                              .add(
                                                                  _.PropertyTypeID[
                                                                      index]);
                                                      _.update();
                                                    },
                                                    child: Container(
                                                      height: 75,
                                                      width: 75,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            Colors.transparent,
                                                        border: Border.all(
                                                            color: _.filteredPropertyType
                                                                    .contains(
                                                                        _.PropertyTypeID[
                                                                            index])
                                                                ? kOrange
                                                                : kBlack
                                                                    .withOpacity(
                                                                        0.2),
                                                            width: 2.0),
                                                      ),
                                                      child: Stack(
                                                        children: [
                                                          _.filteredPropertyType
                                                                  .contains(
                                                                      _.PropertyTypeID[
                                                                          index])
                                                              ? Positioned(
                                                                  top: 5,
                                                                  right: 3,
                                                                  child: Image
                                                                      .asset(
                                                                    "assets/images/checked.png",
                                                                    height: 14,
                                                                  ),
                                                                )
                                                              : const SizedBox(),
                                                          Center(
                                                            child:
                                                                cNetworkImage(
                                                              "${BaseConstant.BASE_PROPERTY_TYPE_IMG_URL}${_.PropertyTypeIcon[index]}",
                                                              width: 30,
                                                              height: 30,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 6,
                                                  ),
                                                  Flexible(
                                                    child: commonText(
                                                      text: _.PropertyTypeName[
                                                          index],
                                                      color: kBlack,
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      })),

                                  const SizedBox(
                                    height: 14,
                                  ),

                                  const Divider(
                                    height: 1,
                                    color: kDarkGrey,
                                  ),
                                  // const SizedBox(
                                  //   height: 14,
                                  // ),
                                  // commonText(
                                  //   text: "Rooms and Beds",
                                  //   color: kBlack,
                                  //   fontSize: 12,
                                  //   fontWeight: FontWeight.w600,
                                  // ),
                                  // const SizedBox(
                                  //   height: 22,
                                  // ),
                                  // Row(
                                  //   mainAxisSize: MainAxisSize.min,
                                  //   children: [
                                  //     Column(
                                  //       children: [

                                  //       ],
                                  //     )
                                  //   ],
                                  // ),
                                  // const SizedBox(
                                  //   height: 14,
                                  // ),
                                  // const Divider(
                                  //   height: 1,
                                  //   color: kDarkGrey,
                                  // ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  commonText(
                                    text: "Amenities",
                                    color: kBlack,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const SizedBox(
                                    height: 22,
                                  ),
                                  GetBuilder<FilterController>(
                                    initState: (_) {},
                                    builder: (_) {
                                      return SizedBox(
                                        child: Wrap(
                                          children: List.generate(
                                              _.totalAmenities,
                                              (index) =>
                                                  emenities(context, index)),
                                        ),
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  GetBuilder<FilterController>(
                                    initState: (_) {},
                                    builder: (_) {
                                      return Bounce(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        onPressed: () {
                                          _.totalAmenities == 6
                                              ? _.totalAmenities = _
                                                  .result['data']['amenities']
                                                  .length
                                              : _.totalAmenities = 6;
                                          _.update();
                                        },
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: commonText(
                                            text: _.totalAmenities == 6
                                                ? "View More      "
                                                : "View Less      ",
                                            color: kOrange,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  // const SizedBox(
                                  //   height: 14,
                                  // ),
                                  // const Divider(
                                  //   height: 1,
                                  //   color: kDarkGrey,
                                  // ),
                                  // const SizedBox(
                                  //   height: 14,
                                  // ),
                                  // commonText(
                                  //   text: "Ratings",
                                  //   color: kBlack,
                                  //   fontSize: 12,
                                  //   fontWeight: FontWeight.w600,
                                  // ),
                                  // const SizedBox(
                                  //   height: 22,
                                  // ),
                                  // FittedBox(
                                  //   fit: BoxFit.scaleDown,
                                  //   child: Row(
                                  //     mainAxisSize: MainAxisSize.min,
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.spaceBetween,
                                  //     children: List.generate(
                                  //         5,
                                  //         (index) => Flexible(
                                  //             child: ratings(context, index))),
                                  //   ),
                                  // ),
                                  // const SizedBox(
                                  //   height: 14,
                                  // ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : const SizedBox(),
                bottomNavigationBar: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 24, left: 24, right: 24, top: 12),
                  child: SizedBox(
                    height: 60,
                    child: Bounce(
                      onPressed: () {
                        Get.back();
                        loaderShow(context);
                        SearchPlacesController getC = Get.find();
                        getC.getApi();
                        getC.update();
                        _.update();
                      },
                      duration: const Duration(milliseconds: 200),
                      child: Card(
                          elevation: 3,
                          shape: Palette.cardShape,
                          color: kOrange,
                          child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Center(
                                child: Text(
                                  'Apply Filter',
                                  style: Palette.bestText4,
                                ),
                              ))),
                    ),
                  ),
                ),
              );
            }));
  }

  var isSelected = List.filled(5, false);

  Widget ratings(BuildContext context, index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: GestureDetector(
            onTap: (() {
              // setState(() {
              //   isSelected[index]
              //       ? isSelected[index] = false
              //       : isSelected[index] = true;
              // });
            }),
            child: Container(
              decoration: BoxDecoration(
                color: isSelected[index] ? kOrange : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                border:
                    Border.all(color: isSelected[index] ? kOrange : kLightGrey),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    commonText(
                      text: (index + 1).toString(),
                      color: isSelected[index] ? kWhite : kLightGrey,
                      fontSize: 12,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Icon(
                      Icons.star_outline_rounded,
                      color: isSelected[index] ? kWhite : kLightGrey,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }

  Widget emenities(BuildContext context, index) {
    return GetBuilder<FilterController>(
      initState: (_) {},
      builder: (_) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Theme(
              data:
                  Theme.of(context).copyWith(unselectedWidgetColor: kDarkGrey),
              child: Checkbox(
                  value: _.islikebool[index],
                  onChanged: ((value) {
                    print(value);
                    setState(() {
                      _.islikebool[index]
                          ? _.islikebool[index] = false
                          : _.islikebool[index] = true;
                    });
                  })),
            ),
            // Image.asset(
            //   "assets/images/wifi.png",
            //   height: 15,
            // ),
            // const SizedBox(
            //   width: 6,
            // ),
            commonText(
              text: _.result['data']['amenities'][index]['title'],
              color: kBlack,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ],
        );
      },
    );
  }
}
