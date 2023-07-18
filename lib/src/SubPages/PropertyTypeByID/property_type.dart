import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/Menu/DashBoard/dashboard_controller.dart';
import 'package:gleekey_user/utils/baseconstant.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/widgets/cNetworkImage.dart';
import 'package:gleekey_user/widgets/comming_soon.dart';
import 'package:gleekey_user/widgets/commonText.dart';

import 'property_type_by_id_view.dart';

class PropertyById extends StatelessWidget {
  PropertyById({super.key});
  DashBoardController getController = Get.find();

  @override
  Widget build(BuildContext context) {
    List islikeboollist = [];
    bool liked = false;
    return GetBuilder<DashBoardController>(builder: (controller) {
      return ListView.builder(
        itemCount: controller.propertyType.length,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          islikeboollist.add(liked);
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Bounce(
                  duration: const Duration(milliseconds: 150),
                  onPressed: () {
                    (index != 2 && index != 3)
                        ? Get.to(() => PropertyTypeByIdPage(
                              name: getController.propertyType[index].name!,
                              id: getController.propertyType[index].id,
                            ))
                        : Get.to(() => const CommingSoon());
                  },
                  child: Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: Border.all(
                          color: islikeboollist[index]
                              ? kOrange
                              : kBlack.withOpacity(0.2),
                          width: 2.0),
                    ),
                    child: Center(
                        child: cNetworkImage(
                      "${BaseConstant.BASE_PROPERTY_TYPE_IMG_URL}${controller.propertyType[index].icon}",
                      width: 30,
                      height: 30,
                    )),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Flexible(
                  child: commonText(
                    text: controller.propertyType[index].name!,
                    color: kBlack,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}
