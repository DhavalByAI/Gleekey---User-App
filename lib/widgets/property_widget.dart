import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';

import '../src/Menu/DashBoard/dashBoard_model.dart';
import '../src/Menu/WishList/AddWishList_Widget/addWishlist_controller.dart';
import '../src/Menu/WishList/AddWishList_Widget/addWishlist_view.dart';
import '../src/SubPages/PropertyAllDetails/propertyAllDetails_view.dart';
import '../utils/style/constants.dart';
import '../utils/style/palette.dart';
import 'cNetworkImage.dart';
import 'commonText.dart';

class Property extends StatefulWidget {
  Properties properties;
  Property({super.key, required this.properties});

  @override
  State<Property> createState() => _PropertyState();
}

class _PropertyState extends State<Property> {
  WishlistController getController = Get.put(WishlistController());
  @override
  void initState() {
    if (widget.properties.wishlist != null) {
      widget.properties.wishlist!
          ? getController.wishlistedID.add(widget.properties.id)
          : null;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 150),
      onPressed: (() {
        Get.to(() => PropertyAllDetails(
              slug: widget.properties.slug!,
              id: widget.properties.id.toString(),
            ));
      }),
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: cNetworkImage(
                    widget.properties.coverPhoto!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: kOrange,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: commonText(
                        text: widget.properties.propertyTypeName.toString(),
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, right: 15),
                    child: addWishlistWidget(PropertyID: widget.properties.id),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  widget.properties.propertyName ?? "",
                  style: Palette.bestText,
                )),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/star_icon.png",
                      scale: 6,
                      color: kOrange,
                      width: 19,
                      height: 19,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.properties.avgRating.toString(),
                      style: Palette.bestText1,
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  child: Row(
                    children: [
                      Text(
                        'start from',
                        style: Palette.bestText2,
                      ),
                      Row(
                        children: [
                          Text(
                            // ignore: prefer_interpolation_to_compose_strings
                            (" " +
                                widget.properties.propertyPrice!.defaultSymbol!
                                    .toString() +
                                // htmlSymbol(widget
                                //     .properties.propertyPrice!.defaultSymbol!) +
                                " " +
                                (widget.properties.propertyPrice!.price!
                                            .toInt() +
                                        (widget.properties.propertyPrice!.price!
                                                    .toInt() *
                                                0.15)
                                            .toInt())
                                    .toString()),
                            style: Palette.bestText3,
                          ),
                          Text(
                            ' /night',
                            style: Palette.bestText3,
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                // Row(
                //   children: [
                //     Image.asset(
                //       "assets/images/calender_icon.png",
                //       scale: 6,
                //       color: kBround,
                //       width: 19,
                //       height: 19,
                //     ),
                //     const SizedBox(
                //       width: 5,
                //     ),
                //     Text(
                //       '3 - 10 Dec',
                //       style: Palette.bestText1,
                //     )
                //   ],
                // )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
            child: Row(
              children: [
                Expanded(
                  child: Bounce(
                    onPressed: () {
                      Get.to(() => PropertyAllDetails(
                            slug: widget.properties.slug!,
                            id: widget.properties.id.toString(),
                          ));
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
                                'Book Now',
                                style: Palette.bestText4,
                              ),
                            ))),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  radius: 23,
                  backgroundColor: kOrange.withOpacity(0.3),
                  child: Image.asset(
                    "assets/images/grup_icon.png",
                    scale: 6,
                    color: kOrange,
                    width: 19,
                    height: 19,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

String htmlSymbol(String input) {
  List<String> parts = input.split(RegExp(r'[x;]'));
  String Symbol = String.fromCharCode(int.parse(parts[1], radix: 16));
  return Symbol; // "Amount: 200"
}

String htmlPrice(String input) {
  List<String> parts = input.split(RegExp(r'[ ]'));
  return parts[1];
}
