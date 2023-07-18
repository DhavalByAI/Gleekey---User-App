import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/Auth/Login/userLogin_controller.dart';
import 'package:gleekey_user/src/Auth/Login/userLogin_view.dart';
import 'package:gleekey_user/utils/style/constants.dart';

import 'addWishlist_controller.dart';

class addWishlistWidget extends StatelessWidget {
  const addWishlistWidget({
    Key? key,
    required this.PropertyID,
  }) : super(key: key);

  final int PropertyID;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishlistController>(
      initState: (_) {},
      builder: (_) {
        return Bounce(
          duration: const Duration(milliseconds: 150),
          onPressed: (() {
            UserLoginController isLogedin = Get.find();
            if (!isLogedin.isUserLogedIn) {
              Get.off(() => const Login());
            } else {
              _.getApi(PropertyID);
              _.wishlistedID.contains(PropertyID)
                  ? _.wishlistedID.remove(PropertyID)
                  : _.wishlistedID.add(PropertyID);
              _.update();
            }
          }),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: kBlack.withOpacity(0.3),
            child: _.wishlistedID.contains(PropertyID)
                ? Image.asset(
                    "assets/images/wishlist_icon_color.png",
                    color: kWhite,
                    width: 15,
                    height: 15,
                  )
                : Image.asset(
                    "assets/images/wishlist_icon.png",
                    color: kWhite,
                    width: 15,
                    height: 15,
                  ),
          ),
        );
      },
    );
  }
}
