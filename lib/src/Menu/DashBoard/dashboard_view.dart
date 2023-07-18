import 'package:auto_size_text/auto_size_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/SubPages/Filter/filter_controller.dart';
import 'package:gleekey_user/src/HomePage/homePage_view.dart';
import 'package:gleekey_user/src/SubPages/SearchPlaces/searchBar.dart';
import 'package:gleekey_user/src/SubPages/SearchPlaces/searchPlaces_controller.dart';
import 'package:gleekey_user/src/SubPages/best_propert_view_all.dart';
import 'package:gleekey_user/src/SubPages/explore_Top_Desitation.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/src/SubPages/PropertyTypeByID/property_type.dart';
import 'package:gleekey_user/widgets/Shimmer/shimmer_box.dart';
import 'package:gleekey_user/widgets/loder.dart';
import 'package:gleekey_user/widgets/property_widget.dart';
import '../../../utils/style/palette.dart';

import 'dashboard_controller.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with TickerProviderStateMixin {
  AnimationController? controller;
  int count = 0;
  bool isSearchVisible = false;

  @override
  initState() {
    super.initState();
    controller = BottomSheet.createAnimationController(this);
    controller?.duration = const Duration(seconds: 1);
    controller?.reverseDuration = const Duration(seconds: 1);
    controller?.drive(CurveTween(curve: Curves.easeIn));
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DashBoardController getController = Get.put(DashBoardController());
    Get.put(FilterController());
    Get.put(SearchPlacesController());
    return SafeArea(
      child: GetBuilder<DashBoardController>(
        initState: (_) {},
        builder: (_) {
          // print("loded${_.isDataLoaded}");
          return _.isDataLoaded
              ? Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: kWhite,
                    automaticallyImplyLeading: false,
                    toolbarHeight: 110,
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Bounce(
                          duration: const Duration(milliseconds: 150),
                          onPressed: (() {
                            drawerKey.currentState?.openDrawer();
                          }),
                          child: Container(
                            height: MediaQuery.of(context).size.height / 16,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/app_logo.png'))),
                          ),
                        ),
                        const SearchBarWidget(),
                      ],
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(pagePadding),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 95,
                                child: PropertyById(),
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    'Explore Top Destination',
                                    style: Palette.headerText,
                                  )),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => ExploreTopDestination(
                                          startingCities: _.startingCities));
                                    },
                                    child: Text(
                                      'View All  ',
                                      style: Palette.viewALLText,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                        topDestination(),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Center(child: destinationIndecator()),
                          ],
                        ),

                        // const SizedBox(
                        //   height: 12,
                        // ),
                        // Text(
                        //   'Recommended',
                        //   style: Palette.headerText,
                        // ),
                        // recommandedList(),
                        Padding(
                          padding: const EdgeInsets.all(pagePadding),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    'The Best property For You',
                                    style: Palette.headerText,
                                  )),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => const BestPropertyViewAll());
                                    },
                                    child: Text(
                                      'View All  ',
                                      style: Palette.viewALLText,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              GetBuilder<DashBoardController>(
                                builder: (c) {
                                  return ListView.builder(
                                    itemCount: c.properties.length,
                                    primary: false,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Property(
                                        properties: c.properties[index],
                                      );
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Scaffold(
                  body: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Expanded(child: ShimmerBox(60, dwidth)),
                          const SizedBox(
                            width: 12,
                          ),
                          ShimmerBox(60, 60),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FlexiShimmerBox(150, (dwidth / 2 - 24).toInt()),
                          const SizedBox(
                            width: 24,
                          ),
                          FlexiShimmerBox(150, (dwidth / 2 - 24).toInt())
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FlexiShimmerBox(150, (dwidth / 2 - 24).toInt()),
                          const SizedBox(
                            width: 24,
                          ),
                          FlexiShimmerBox(150, (dwidth / 2 - 24).toInt())
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Expanded(child: ShimmerBox(180, dwidth))
                    ],
                  ),
                ));
        },
      ),
    );
  }

  Widget topDestination() {
    final ScrollController Scrollcontroller = ScrollController();
    DashBoardController controller = Get.find();
    var topPlaces = List.generate((controller.startingCities.length / 4).ceil(),
        (index) => controller.startingCities.skip(index * 4).take(4).toList());
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
      child: GetBuilder<DashBoardController>(
          builder: (controller) => SizedBox(
                height: dwidth - pagePadding * 2,
                child: PageView.builder(
                  padEnds: true,
                  onPageChanged: (value) {
                    controller.currDotValue = value.toDouble();
                    controller.update();
                  },
                  scrollDirection: Axis.horizontal,
                  dragStartBehavior: DragStartBehavior.down,
                  itemCount: topPlaces.length,
                  itemBuilder: ((context, i) {
                    return GridView.builder(
                      physics: const ScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 24,
                              mainAxisSpacing: 24),
                      shrinkWrap: true,
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      controller: Scrollcontroller,
                      itemBuilder: (BuildContext context, int index) {
                        return index < topPlaces[i].length
                            ? Bounce(
                                duration: const Duration(milliseconds: 150),
                                onPressed: () {
                                  loaderShow(context);
                                  SearchPlacesController _ = Get.find();
                                  _.selectedPlace = topPlaces[i][index].name!;
                                  _.getApi();
                                  // Get.to(() => PropertyList(
                                  //       properties: const [],
                                  //     ));
                                },
                                child: Container(
                                  width: 180,
                                  height: 180,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      //color: kBlack,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              topPlaces[i][index].imageUrl!),
                                          fit: BoxFit.cover)),
                                  child: Stack(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: 80,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Colors.transparent,
                                                      Colors.black
                                                          .withOpacity(0.9),
                                                    ]),
                                              )),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 0, 10, 10),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              topPlaces[i][index].name!,
                                              maxLines: 2,
                                              style: Palette.topText,
                                            ),
                                            // Text(
                                            //   _controller.startingCities[index].name!,
                                            //   style: Palette.topText,
                                            // ),

                                            // Row(
                                            //   children: [
                                            //     Image.asset(
                                            //       "assets/images/navigation.png",
                                            //       scale: 6,
                                            //       color: kWhite,
                                            //       width: 12,
                                            //       height: 12,
                                            //     ),
                                            //     const SizedBox(
                                            //       width: 5,
                                            //     ),
                                            //     Text('Goa , india',
                                            //         style: Palette.topTextWhite),
                                            //   ],
                                            // )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox();
                      },
                    );
                  }),
                ),
              )),
    );
  }

  Widget destinationIndecator() {
    return GetBuilder<DashBoardController>(
      builder: (c) {
        return DotsIndicator(
          dotsCount: ((c.startingCities.length / 4).ceil()),
          position: c.currDotValue,
          decorator: const DotsDecorator(
            color: kLightGrey2,
            activeColor: kOrange,
          ),
        );
      },
    );
  }

  // Widget recommandedList() {
  //   return SizedBox(
  //     height: 115,
  //     child: ListView.builder(
  //       itemCount: 10,
  //       //padding: const EdgeInsets.only( bottom: 20),
  //       primary: false,
  //       shrinkWrap: true,
  //       scrollDirection: Axis.horizontal,
  //       itemBuilder: (BuildContext context, int index) {
  //         return GestureDetector(
  //             onTap: () {
  //               setState(() {});
  //             },
  //             child: Card(
  //               elevation: 6,
  //               margin: const EdgeInsets.fromLTRB(3, 10, 12, 10),
  //               shape: Palette.seachBoxCardShape,
  //               child: Padding(
  //                 padding: const EdgeInsets.all(10),
  //                 child: Row(
  //                   children: [
  //                     Container(
  //                       height: 100,
  //                       width: 70,
  //                       decoration: BoxDecoration(
  //                           borderRadius: BorderRadius.circular(10),
  //                           image: const DecorationImage(
  //                               image:
  //                                   AssetImage('assets/images/test_photo.png'),
  //                               fit: BoxFit.cover)),
  //                     ),
  //                     const SizedBox(
  //                       width: 10,
  //                     ),
  //                     Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Text(
  //                           'Java Heritage Hotel',
  //                           style: Palette.recText,
  //                         ),
  //                         const SizedBox(
  //                           height: 7,
  //                         ),
  //                         Text(
  //                           'start from',
  //                           style: Palette.recText1,
  //                         ),
  //                         const SizedBox(
  //                           height: 7,
  //                         ),
  //                         Row(
  //                           children: [
  //                             Image.asset(
  //                               "assets/images/rupee.png",
  //                               scale: 6,
  //                               color: kBround,
  //                               width: 12.16,
  //                               height: 12.16,
  //                             ),
  //                             Text(
  //                               '5500/night',
  //                               style: Palette.recText1,
  //                             ),
  //                           ],
  //                         )
  //                       ],
  //                     )
  //                   ],
  //                 ),
  //               ),
  //             ));
  //       },
  //     ),
  //   );
  // }

  Widget best_property() {
    return GetBuilder<DashBoardController>(
      builder: (c) {
        return ListView.builder(
          itemCount: c.properties.length,
          primary: false,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Property(
              properties: c.properties[index],
            );
          },
        );
      },
    );
  }
}
