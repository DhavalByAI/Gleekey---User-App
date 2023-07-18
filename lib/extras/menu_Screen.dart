// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gleeky_flutter/API/api_config.dart';
// import 'package:gleeky_flutter/shared_Preference/prefController.dart';
// import 'package:gleeky_flutter/src/Main/main_screen.dart';
// import 'package:gleeky_flutter/src/add_property/view/hostScreen.dart';
// import 'package:gleeky_flutter/src/menu/controller/menu_screen_controller.dart';
// import 'package:gleeky_flutter/src/menu/view/wishlist/wishlist.dart';
// import 'package:gleeky_flutter/src/setting/setting_screen.dart';
// import 'package:gleeky_flutter/utills/app_colors.dart';
// import 'package:gleeky_flutter/utills/app_images.dart';
// import 'package:gleeky_flutter/utills/loder.dart';
// import 'package:gleeky_flutter/utills/snackBar.dart';
// import 'package:gleeky_flutter/utills/text_styles.dart';

// import 'become_an_agent/become_an_agent_screen.dart';
// import 'get_help/get_help_screen.dart';
// import 'hosting/hosting_screen.dart';
// import 'notification/notification.dart';
// import 'profile/profile.dart';

// class MenuScreen extends StatelessWidget {
//   MenuScreen({Key? key}) : super(key: key);

//   List menuItems = [
//     {
//       'img': AppImages.proMemberIcon,
//       'name': 'Become A Pro Member',
//       'screen': const WishListScreen()
//     },
//     {
//       'img': AppImages.hostIcon,
//       'name': 'Become A Host',
//       'screen': const WishListScreen()
//     },
//     {
//       'img': AppImages.agentIcon,
//       'name': 'Become A Agent',
//       'screen': BecomeAnAgentScreen(),
//     },
//     {
//       'img': AppImages.wishlistIcon,
//       'name': 'Wishlist',
//       'screen': const WishListScreen()
//     },
//     {
//       'img': AppImages.notificationIcon,
//       'name': 'Notification',
//       'screen': const NotificationScreen()
//     },
//     {
//       'img': AppImages.bookingIcon,
//       'name': 'My Bookings',
//       'screen': const WishListScreen()
//     },
//     {
//       'img': AppImages.paymentIcon,
//       'name': 'Payment Method',
//       'screen': const WishListScreen()
//     },
//     {
//       'img': AppImages.helpIcon,
//       'name': 'Help',
//       'screen': const WishListScreen()
//     },
//   ];

//   List profileItem = [
//     {
//       'img': AppImages.createListingIcon,
//       'name': 'Create A New Listing',
//       'screen': HostScreen()
//     },
//     {
//       'img': AppImages.settingIcon,
//       'name': 'settings',
//       'screen': Setting_Screen()
//     },
//     {
//       'img': AppImages.profileIcon,
//       'name': 'profile',
//       'screen': const ProfileScreen(),
//     },
//     {'img': AppImages.helpIcon, 'name': 'Get Help', 'screen': GetHelpScreen()},
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 17),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       selectedBottom.value = 0;
//                     },
//                     icon: const Icon(
//                       Icons.arrow_back_ios_new,
//                       size: 20,
//                     ),
//                   ),
//                   Expanded(
//                     child: Center(
//                       child: Text(
//                         'Menu',
//                         style: color00000s18w600,
//                       ),
//                     ),
//                   ),
//                   Opacity(
//                     opacity: 0,
//                     child: IgnorePointer(
//                       ignoring: true,
//                       child: IconButton(
//                         onPressed: () {},
//                         icon: const Icon(
//                           Icons.arrow_back_ios_new,
//                           size: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 12),
//                 child: InkWell(
//                   onTap: () {
//                     Get.to(() => HostingScreen());
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(6),
//                         boxShadow: [
//                           BoxShadow(
//                               color: AppColors.color000000.withOpacity(0.12),
//                               spreadRadius: 5,
//                               blurRadius: 5)
//                         ],
//                         color: AppColors.colorffffff),
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 15, horizontal: 15),
//                     child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             '2 hosting',
//                             style: color00000s13w600,
//                           ),
//                           Icon(
//                             Icons.arrow_forward_ios,
//                             size: 20,
//                           )
//                         ]),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Column(
//                         children: List.generate(
//                           menuItems.length,
//                           (index) => InkWell(
//                             onTap: () {
//                               Get.to(menuItems[index]['screen']);
//                             },
//                             child: Column(
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Row(
//                                     children: [
//                                       Image.asset(
//                                         menuItems[index]['img'],
//                                         height: 25,
//                                       ),
//                                       SizedBox(
//                                         width: Get.width * 0.04,
//                                       ),
//                                       Expanded(
//                                         child: Text(
//                                           menuItems[index]['name'],
//                                           style: color00000s13w600,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Divider(
//                                   endIndent: 10,
//                                   indent: 10,
//                                   color: AppColors.color000000.withOpacity(0.1),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       Column(
//                         children: List.generate(
//                           profileItem.length,
//                           (index) => Column(
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   index == 0
//                                       ? {
//                                           loaderShow(context),
//                                           MenuScreenController.to
//                                               .getStartHostApi(
//                                                   params: {
//                                                 'user_id': PrefController
//                                                     .to.user_id.value
//                                               },
//                                                   error: (e) {
//                                                     loaderHide();
//                                                     Get.closeAllSnackbars();
//                                                     showSnackBar(
//                                                         title: ApiConfig.error,
//                                                         message: e.toString());
//                                                     log(e.toString());
//                                                   },
//                                                   success: () {
//                                                     loaderHide();
//                                                     Get.to(() =>
//                                                         profileItem[index]
//                                                                 ['screen']
//                                                             as Widget);
//                                                   })
//                                         }
//                                       : Get.to(() => profileItem[index]
//                                           ['screen'] as Widget);
//                                 },
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Row(
//                                     children: [
//                                       Image.asset(
//                                         profileItem[index]['img'],
//                                         height: 25,
//                                       ),
//                                       SizedBox(
//                                         width: Get.width * 0.04,
//                                       ),
//                                       Expanded(
//                                         child: Text(
//                                           profileItem[index]['name'],
//                                           style: color00000s13w600,
//                                         ),
//                                       ),
//                                       Icon(
//                                         Icons.arrow_forward_ios_outlined,
//                                         size: 20,
//                                       ),
//                                       SizedBox(
//                                         width: Get.width * 0.02,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               Divider(
//                                 endIndent: 10,
//                                 indent: 10,
//                                 color: AppColors.color000000.withOpacity(0.1),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
