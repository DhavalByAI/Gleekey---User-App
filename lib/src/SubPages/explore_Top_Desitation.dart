// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';

import 'package:gleekey_user/src/Menu/DashBoard/dashBoard_model.dart';
import 'package:gleekey_user/src/SubPages/SearchPlaces/searchPlaces_controller.dart';
import 'package:gleekey_user/utils/style/palette.dart';

import 'package:gleekey_user/widgets/loder.dart';
import '../../utils/style/constants.dart';
import 'SearchPlaces/searchBar.dart';
import 'appBarWithTitleAndBack.dart';

class ExploreTopDestination extends StatelessWidget {
  List<StartingCities> startingCities;
  ExploreTopDestination({super.key, required this.startingCities});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBarWithTitleAndBack(title: "Explore Top Destination"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: Column(
          children: [
            const SearchBarWidget(),
            const SizedBox(
              height: 15,
            ),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: startingCities.length,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 24,
                  );
                },
                itemBuilder: ((context, index) {
                  return Bounce(
                    duration: const Duration(milliseconds: 300),
                    onPressed: () {
                      loaderShow(context);
                      SearchPlacesController _ = Get.find();
                      _.selectedPlace = startingCities[index].name!;
                      _.getApi();
                    },
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          //color: kBlack,
                          image: DecorationImage(
                              image:
                                  NetworkImage(startingCities[index].imageUrl!),
                              fit: BoxFit.cover)),
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black.withOpacity(0.9),
                                        ]),
                                  )),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  startingCities[index].name!,
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
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
