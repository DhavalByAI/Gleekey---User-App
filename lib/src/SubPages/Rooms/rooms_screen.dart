// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_bounce/flutter_bounce.dart';
// import 'package:get/get.dart';
// import 'package:gleekey_user/src/SubPages/PropertyAllDetails/propertyAllDetails_controller.dart';
// import 'package:gleekey_user/src/SubPages/SearchPlaces/searchPlaces_controller.dart';
// import 'package:gleekey_user/src/SubPages/confirm_n_pay/confirm_n_pay.dart';
// import 'package:gleekey_user/utils/style/constants.dart';
// import 'package:gleekey_user/utils/style/palette.dart';
// import 'package:gleekey_user/widgets/cNetworkImage.dart';
// import 'package:gleekey_user/widgets/commonText.dart';
// import 'package:gleekey_user/widgets/showSnackBar.dart';

// ScrollController _sc = ScrollController();

// class RoomScreen extends StatefulWidget {
//   RoomScreen({super.key});

//   @override
//   State<RoomScreen> createState() => _RoomScreenState();
// }

// class _RoomScreenState extends State<RoomScreen> {
//   PropertyAllDetailsController getController = Get.find();

//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration(milliseconds: 1000), (() {
//       _sc.animateTo(100, duration: Duration(seconds: 2), curve: Curves.easeIn);
//       Future.delayed(Duration(milliseconds: 2000), (() {
//         _sc.animateTo(0,
//             duration: Duration(seconds: 2), curve: Curves.easeInBack);
//       }));
//     }));
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> totalRooms = [
//       Room(1, Colors.amber),
//       Room(2, Colors.pink),
//       Room(3, Colors.blueGrey)
//     ];
//     return SafeArea(
//         child: Scaffold(
//             backgroundColor: Colors.white,
//             body: Stack(
//               children: [
//                 SingleChildScrollView(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Container(
//                         height: dheight.toDouble(),
//                         child: ListView.builder(
//                           // physics: NeverScrollableScrollPhysics(),
//                           shrinkWrap: true,
//                           itemCount: totalRooms.length,
//                           controller: _sc,
//                           scrollDirection: Axis.horizontal,
//                           primary: false,
//                           itemBuilder: (context, index) {
//                             return totalRooms[index];
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 reserve()
//               ],
//             )));
//   }
// }

// Widget Room(int page, Color Color) {
//   PropertyAllDetailsController getController = Get.find();
//   return Container(
//     width: dwidth.toDouble(),
//     child: Padding(
//       padding: const EdgeInsets.all(24),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             height: 250,
//             decoration: BoxDecoration(
//                 image: const DecorationImage(
//                   fit: BoxFit.cover,
//                   image: CachedNetworkImageProvider(
//                     "https://cdn.pixabay.com/photo/2016/10/18/09/02/hotel-1749602_960_720.jpg",
//                   ),
//                 ),
//                 borderRadius: BorderRadius.circular(40)),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           commonText(
//             text: "Delux Room",
//             color: Colors.black,
//             fontSize: 16,
//             fontWeight: FontWeight.w700,
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Wrap(
//                 spacing: 2,
//                 children: List.generate(
//                   getController.PropertyData!.amenities!.length > 5
//                       ? 5
//                       : getController.PropertyData!.amenities!.length,
//                   (i) {
//                     return Container(
//                       padding: const EdgeInsets.all(10),
//                       margin: const EdgeInsets.all(5),
//                       // color: kBlack.withOpacity(0.05),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           getController.PropertyData!.amenities![i]
//                                       ['amenitie_icon'] !=
//                                   null
//                               ? cNetworkImage(
//                                   getController.PropertyData!.amenities![i]
//                                       ['amenitie_icon']!,
//                                   // scale: 6,
//                                   // color: kOrange,
//                                   width: 24,
//                                   height: 24,
//                                 )
//                               : Image.asset(
//                                   "assets/images/defaultAmenities.png",
//                                   // scale: 6,
//                                   // color: kOrange,
//                                   width: 24,
//                                   height: 24,
//                                 ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Flexible(
//                             child: AutoSizeText(
//                               getController.PropertyData!.amenities![i]
//                                   ['title'],
//                               style: Palette.bestText2,
//                               minFontSize: 10,
//                               maxLines: 3,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(left: 10),
//                 child: Bounce(
//                     duration: const Duration(milliseconds: 300),
//                     child: commonText(
//                       text: 'More Details',
//                       color: kOrange,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w700,
//                     ),
//                     onPressed: () {
//                       // Get.dialog(Scaffold(body: Allaminities()));
//                     }),
//               )
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             child: Divider(
//               color: Colors.black.withOpacity(0.5),
//             ),
//           ),
//           commonText(
//             text: "Extra",
//             color: Colors.black,
//             fontSize: 16,
//             fontWeight: FontWeight.w700,
//           ),
//           const SizedBox(
//             height: 8,
//           ),
//           Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 children: [
//                   Radio(
//                     value: 1,
//                     groupValue: 1,
//                     onChanged: (i) {},
//                     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                   ),
//                   commonText(
//                     text: "Breakfast Buffet",
//                     color: Colors.black,
//                     fontSize: 13,
//                     fontWeight: FontWeight.w400,
//                   ),
//                   const Spacer(),
//                   commonText(
//                     text: "+ ₹ 1350",
//                     color: Colors.black,
//                     fontSize: 13,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   const SizedBox(
//                     width: 24,
//                   )
//                 ],
//               ),
//               Row(
//                 children: [
//                   Radio(
//                     value: 1,
//                     groupValue: 1,
//                     onChanged: (i) {},
//                     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                   ),
//                   commonText(
//                     text: "lunch",
//                     color: Colors.black,
//                     fontSize: 13,
//                     fontWeight: FontWeight.w400,
//                   ),
//                   const Spacer(),
//                   commonText(
//                     text: "+ ₹ 1350",
//                     color: Colors.black,
//                     fontSize: 13,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   const SizedBox(
//                     width: 24,
//                   )
//                 ],
//               ),
//               Row(
//                 children: [
//                   Radio(
//                     value: 1,
//                     groupValue: 1,
//                     onChanged: (i) {},
//                     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                   ),
//                   commonText(
//                     text: "Dinner",
//                     color: Colors.black,
//                     fontSize: 13,
//                     fontWeight: FontWeight.w400,
//                   ),
//                   const Spacer(),
//                   commonText(
//                     text: "+ ₹ 1350",
//                     color: Colors.black,
//                     fontSize: 13,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   const SizedBox(
//                     width: 24,
//                   )
//                 ],
//               ),
//               Row(
//                 children: [
//                   Radio(
//                     value: 1,
//                     groupValue: 1,
//                     onChanged: (i) {},
//                     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                   ),
//                   commonText(
//                     text: "All Mails",
//                     color: Colors.black,
//                     fontSize: 13,
//                     fontWeight: FontWeight.w400,
//                   ),
//                   const Spacer(),
//                   commonText(
//                     text: "+ ₹ 1350",
//                     color: Colors.black,
//                     fontSize: 13,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   const SizedBox(
//                     width: 24,
//                   )
//                 ],
//               )
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 8),
//             child: Divider(
//               color: Colors.black.withOpacity(0.5),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget RoomWidget() {
//   PropertyAllDetailsController getController = Get.find();
//   return Stack(
//     children: [
//       SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 height: 250,
//                 decoration: BoxDecoration(
//                     image: const DecorationImage(
//                       fit: BoxFit.cover,
//                       image: CachedNetworkImageProvider(
//                         "https://cdn.pixabay.com/photo/2020/10/18/09/16/bedroom-5664221_960_720.jpg",
//                       ),
//                     ),
//                     borderRadius: BorderRadius.circular(40)),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               commonText(
//                 text: "Delux Room",
//                 color: Colors.black,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w700,
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Wrap(
//                     spacing: 2,
//                     children: List.generate(
//                       getController.PropertyData!.amenities!.length > 5
//                           ? 5
//                           : getController.PropertyData!.amenities!.length,
//                       (i) {
//                         return Container(
//                           padding: const EdgeInsets.all(10),
//                           margin: const EdgeInsets.all(5),
//                           // color: kBlack.withOpacity(0.05),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               getController.PropertyData!.amenities![i]
//                                           ['amenitie_icon'] !=
//                                       null
//                                   ? cNetworkImage(
//                                       getController.PropertyData!.amenities![i]
//                                           ['amenitie_icon']!,
//                                       // scale: 6,
//                                       // color: kOrange,
//                                       width: 24,
//                                       height: 24,
//                                     )
//                                   : Image.asset(
//                                       "assets/images/defaultAmenities.png",
//                                       // scale: 6,
//                                       // color: kOrange,
//                                       width: 24,
//                                       height: 24,
//                                     ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               Flexible(
//                                 child: AutoSizeText(
//                                   getController.PropertyData!.amenities![i]
//                                       ['title'],
//                                   style: Palette.bestText2,
//                                   minFontSize: 10,
//                                   maxLines: 3,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               )
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   Container(
//                     margin: const EdgeInsets.only(left: 10),
//                     child: Bounce(
//                         duration: const Duration(milliseconds: 300),
//                         child: commonText(
//                           text: 'More Details',
//                           color: kOrange,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w700,
//                         ),
//                         onPressed: () {
//                           // Get.dialog(Scaffold(body: Allaminities()));
//                         }),
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8),
//                 child: Divider(
//                   color: Colors.black.withOpacity(0.5),
//                 ),
//               ),
//               commonText(
//                 text: "Extra",
//                 color: Colors.black,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w700,
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     children: [
//                       Radio(
//                         value: 1,
//                         groupValue: 1,
//                         onChanged: (i) {},
//                         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                       ),
//                       commonText(
//                         text: "Breakfast Buffet",
//                         color: Colors.black,
//                         fontSize: 13,
//                         fontWeight: FontWeight.w400,
//                       ),
//                       const Spacer(),
//                       commonText(
//                         text: "+ ₹ 1350",
//                         color: Colors.black,
//                         fontSize: 13,
//                         fontWeight: FontWeight.w500,
//                       ),
//                       const SizedBox(
//                         width: 24,
//                       )
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Radio(
//                         value: 1,
//                         groupValue: 1,
//                         onChanged: (i) {},
//                         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                       ),
//                       commonText(
//                         text: "lunch",
//                         color: Colors.black,
//                         fontSize: 13,
//                         fontWeight: FontWeight.w400,
//                       ),
//                       const Spacer(),
//                       commonText(
//                         text: "+ ₹ 1350",
//                         color: Colors.black,
//                         fontSize: 13,
//                         fontWeight: FontWeight.w500,
//                       ),
//                       const SizedBox(
//                         width: 24,
//                       )
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Radio(
//                         value: 1,
//                         groupValue: 1,
//                         onChanged: (i) {},
//                         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                       ),
//                       commonText(
//                         text: "Dinner",
//                         color: Colors.black,
//                         fontSize: 13,
//                         fontWeight: FontWeight.w400,
//                       ),
//                       const Spacer(),
//                       commonText(
//                         text: "+ ₹ 1350",
//                         color: Colors.black,
//                         fontSize: 13,
//                         fontWeight: FontWeight.w500,
//                       ),
//                       const SizedBox(
//                         width: 24,
//                       )
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       Radio(
//                         value: 1,
//                         groupValue: 1,
//                         onChanged: (i) {},
//                         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                       ),
//                       commonText(
//                         text: "All Mails",
//                         color: Colors.black,
//                         fontSize: 13,
//                         fontWeight: FontWeight.w400,
//                       ),
//                       const Spacer(),
//                       commonText(
//                         text: "+ ₹ 1350",
//                         color: Colors.black,
//                         fontSize: 13,
//                         fontWeight: FontWeight.w500,
//                       ),
//                       const SizedBox(
//                         width: 24,
//                       )
//                     ],
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8),
//                 child: Divider(
//                   color: Colors.black.withOpacity(0.5),
//                 ),
//               ),
//               GetBuilder<PropertyAllDetailsController>(
//                 initState: (_) {},
//                 builder: (_) {
//                   return GetBuilder<SearchPlacesController>(
//                     initState: (_C) {},
//                     builder: (_C) {
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             '₹ ${_.PropertyData!.result!.propertyPrice!.price * (_C.totalNight ?? 1)} /${_C.totalNight ?? ""} Night',
//                             style: Palette.headerText,
//                           ),
//                           const SizedBox(
//                             height: 6,
//                           ),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.info_outline_rounded,
//                                 size: 11,
//                                 color: kBlack.withOpacity(0.5),
//                               ),
//                               commonText(
//                                 color: kBlack.withAlpha(125),
//                                 text:
//                                     ' GST ₹${((_.PropertyData!.result!.propertyPrice!.price * (_C.totalNight ?? 1)) * 18) / 100} Excluded',
//                                 fontSize: 10,
//                               ),
//                             ],
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 },
//               ),
//               const SizedBox(
//                 height: 12,
//               ),
//               SizedBox(
//                 width: double.maxFinite,
//                 child: MaterialButton(
//                   color: kOrange,
//                   shape: Palette.subCardShape,
//                   padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
//                   child: Text(
//                     'Select Room',
//                     style: Palette.bestText4,
//                   ),
//                   onPressed: () {},
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//       reserve()
//     ],
//   );
// }

// Widget reserve() {
//   PropertyAllDetailsController getController = Get.find();
//   return Align(
//     alignment: Alignment.bottomCenter,
//     child: Container(
//       width: dwidth.toDouble(),
//       decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//                 color: kBlack.withOpacity(0.2), blurRadius: 10, spreadRadius: 1)
//           ],
//           color: kWhite,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           )),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             GetBuilder<PropertyAllDetailsController>(
//               initState: (_) {},
//               builder: (_) {
//                 return GetBuilder<SearchPlacesController>(
//                   initState: (_C) {},
//                   builder: (_C) {
//                     return Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           '₹ ${_.PropertyData!.result!.propertyPrice!.price * (_C.totalNight ?? 1)} /${_C.totalNight ?? ""} Night',
//                           style: Palette.headerText,
//                         ),
//                         const SizedBox(
//                           height: 6,
//                         ),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.info_outline_rounded,
//                               size: 11,
//                               color: kBlack.withOpacity(0.5),
//                             ),
//                             commonText(
//                               color: kBlack.withAlpha(125),
//                               text:
//                                   ' GST ₹${((_.PropertyData!.result!.propertyPrice!.price * (_C.totalNight ?? 1)) * 18) / 100} Excluded',
//                               fontSize: 10,
//                             ),
//                           ],
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//             ),
//             SizedBox(
//               height: 45,
//               width: 100,
//               child: MaterialButton(
//                   color: kOrange,
//                   shape: Palette.subCardShape,
//                   padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
//                   child: Text(
//                     'Reserve',
//                     style: Palette.bestText4,
//                   ),
//                   onPressed: () {
//                     SearchPlacesController _C = Get.find();
//                     _C.endDate == null
//                         ? showSnackBar(
//                             title: "Last Date Is not Selected",
//                             message:
//                                 "Please select last date of your stay with property")
//                         : Get.to(() => ConfirmNpay(
//                               coverImg: getController
//                                   .PropertyData!.result!.coverPhoto,
//                               price: getController
//                                   .PropertyData!.result!.propertyPrice!.price,
//                               totalNight: _C.totalNight ?? 1,
//                             ));
//                   }),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
