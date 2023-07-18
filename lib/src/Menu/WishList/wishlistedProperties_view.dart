import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/Menu/WishList/AddWishList_Widget/addWishlist_controller.dart';
import 'package:gleekey_user/src/SubPages/appBarWithTitleAndBack.dart';

import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/widgets/Shimmer/property_shimmer.dart';

import 'package:gleekey_user/widgets/property_widget.dart';

import 'wishlistedProperties_controller.dart';

class WishlistedProperties extends StatelessWidget {
  const WishlistedProperties({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WishlistedPropertiesController getController =
        Get.put(WishlistedPropertiesController());

    return GetBuilder<WishlistedPropertiesController>(
      autoRemove: true,
      initState: (_) {},
      builder: (_) {
        return _.isDataLoaded
            ? Scaffold(
                backgroundColor: kWhite,
                appBar: AppBarWithTitleAndBack(
                    title: "Wishlist", backButton: false),
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: _.wishlistedProperties_model!.data!.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: _.wishlistedProperties_model!.data!.length,
                          itemBuilder: ((context, index) {
                            WishlistController getController = Get.find();
                            getController.wishlistedID.contains(_
                                    .wishlistedProperties_model!
                                    .data![index]
                                    .properties!
                                    .id)
                                ? null
                                : getController.wishlistedID.add(_
                                    .wishlistedProperties_model!
                                    .data![index]
                                    .properties!
                                    .id);
                            // getController.update();
                            return Property(
                              properties: _.wishlistedProperties_model!
                                  .data![index].properties!,
                            );
                          }),
                        )
                      : Image.asset("assets/images/noData.png"),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(24),
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 24,
                      );
                    },
                    itemCount: 3,
                    itemBuilder: ((context, index) {
                      return const PropertyShimmer();
                    })),
              );
      },
    );
  }
}
