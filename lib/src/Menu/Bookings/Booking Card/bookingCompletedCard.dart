import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/Menu/Bookings/bookings_controller.dart';
import 'package:gleekey_user/src/Menu/Bookings/bookings_model.dart';
import 'package:gleekey_user/widgets/commonText.dart';
import 'package:gleekey_user/widgets/text_fields_widgets/custrom_textfield_paragraph.dart';
import 'package:intl/intl.dart';
import '../../../../utils/style/constants.dart';
import '../../../../utils/style/palette.dart';

TextEditingController reviewController = TextEditingController(
    text:
        "The application was great! It was easy to use and had all the features I needed. I would definitely recommend it.");

class BookingCompletedCard extends StatefulWidget {
  var completedBookings;
  BookingCompletedCard({
    required this.completedBookings,
    Key? key,
  }) : super(key: key);

  @override
  State<BookingCompletedCard> createState() => _BookingCompletedCardState();
}

class _BookingCompletedCardState extends State<BookingCompletedCard> {
  BookingsController getController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.completedBookings['properties']
                        ['cover_photo']))),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                      color: kOrange,
                    ),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.check_circle_outline_rounded,
                          color: kWhite,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "You Have Completed",
                          style: Palette.topText,
                        ),
                      ],
                    ),
                  ),
                ),
                // Positioned(
                //   top: 15,
                //   right: 15,
                //   child: CircleAvatar(
                //       radius: 16,
                //       backgroundColor: kBlack.withOpacity(0.5),
                //       child: Image.asset(
                //         "assets/images/wishlist_icon_color.png",
                //         color: kWhite,
                //         height: 15,
                //       )),
                // )
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.completedBookings['properties']['name'],
                      overflow: TextOverflow.ellipsis,
                      style: Palette.bestText,
                    ),
                  ),
                  const Icon(
                    Icons.star_rounded,
                    color: kOrange,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                      widget.completedBookings['properties']['avg_rating']
                          .toString(),
                      style: Palette.bestText1),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              child: Row(
                children: [
                  Text(
                    'Start From',
                    style: Palette.bestText2,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Icon(
                    Icons.currency_rupee_sharp,
                    size: 12,
                  ),
                  Text(
                    '${(widget.completedBookings['per_night'].toInt()).toString()}/Night',
                    style: Palette.bestText3,
                  ),
                  const Spacer(),
                  Image.asset(
                    "assets/images/calender_icon.png",
                    height: 15,
                    width: 15,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                      "${DateFormat.d().format(DateTime.parse(widget.completedBookings['start_date']))}-${DateFormat.d().format(DateTime.parse(widget.completedBookings['end_date']))} ${DateFormat.MMM().format(DateTime.parse(widget.completedBookings['start_date']))} ${DateFormat.y().format(DateTime.parse(widget.completedBookings['start_date']))}",
                      style: Palette.registerText1),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SizedBox(
              height: 45,
              width: double.maxFinite,
              child: MaterialButton(
                  color: kOrange,
                  shape: Palette.subCardShape,
                  padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                  child: Text(
                    'Leave Review',
                    style: Palette.topText,
                  ),
                  onPressed: () {
                    BtmReviewSheet(context);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

Future<dynamic> BtmReviewSheet(BuildContext context) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      useRootNavigator: true,
      context: context,
      builder: ((context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            decoration: const BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                    height: 4,
                    width: 40,
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  commonText(
                    color: kBlack,
                    fontSize: 15,
                    text: "Leave a Review",
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Divider(
                    color: kBlack.withOpacity(0.4),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: 250,
                    child: Center(
                      child: commonText(
                        textAlign: TextAlign.center,
                        color: kBlack,
                        fontSize: 15,
                        text: "How Your Experience with \nLonavala Resort",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.star_border_rounded,
                        size: 46,
                        color: kOrange,
                      ),
                      Icon(
                        Icons.star_border_rounded,
                        size: 46,
                        color: kOrange,
                      ),
                      Icon(
                        Icons.star_border_rounded,
                        size: 46,
                        color: kOrange,
                      ),
                      Icon(
                        Icons.star_border_rounded,
                        size: 46,
                        color: kOrange,
                      ),
                      Icon(
                        Icons.star_border_rounded,
                        size: 46,
                        color: kOrange,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: kBlack.withOpacity(0.4),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: commonText(
                      color: kBlack,
                      fontSize: 15,
                      text: "  Write Your Review",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: 120,
                    child: CustomTextfieldPara(
                        controller: reviewController, label: "", hint: ""),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 0,
                      right: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (() {
                              Navigator.pop(context);
                            }),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: kOrangeLite,
                                  borderRadius: BorderRadius.circular(6)),
                              height: 45,
                              child: Center(
                                child: commonText(
                                  textAlign: TextAlign.center,
                                  color: kOrange,
                                  fontSize: 12,
                                  text: "Maybe Later",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: kOrange),
                                  color: kOrange,
                                  borderRadius: BorderRadius.circular(6)),
                              height: 45,
                              child: Center(
                                child: commonText(
                                  textAlign: TextAlign.center,
                                  color: kWhite,
                                  fontSize: 12,
                                  text: "Submit",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }));
}
