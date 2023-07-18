import 'dart:ui';
import 'package:gleekey_user/src/SubPages/Receipt/receipt_view.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:gleekey_user/src/Menu/Bookings/bookings_model.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/utils/style/palette.dart';
import 'package:gleekey_user/widgets/commonText.dart';

class BookingOnGoingCard extends StatelessWidget {
  var onGoingBookings;
  BookingOnGoingCard({Key? key, required this.onGoingBookings})
      : super(key: key);

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
                    image: NetworkImage(
                        onGoingBookings['properties']['cover_photo']))),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      color: kOrange,
                    ),
                    height: 40,
                    child: SizedBox(
                      width: 80,
                      child: Center(
                        child: Text(
                          "Paid",
                          style: Palette.topText,
                        ),
                      ),
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
                  Text(
                    onGoingBookings['properties']['name'],
                    style: Palette.bestText,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.star_rounded,
                    color: kOrange,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(onGoingBookings['properties']['avg_rating'].toString(),
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
                    '${(onGoingBookings['per_night'].toInt()).toString()}/Night',
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
                      "${DateFormat.d().format(DateTime.parse(onGoingBookings['start_date']))}-${DateFormat.d().format(DateTime.parse(onGoingBookings['end_date']))} ${DateFormat.MMM().format(DateTime.parse(onGoingBookings['start_date']))} ${DateFormat.y().format(DateTime.parse(onGoingBookings['start_date']))}",
                      style: Palette.registerText1),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: MaterialButton(
                        elevation: 1,
                        color: kOrangeLite,
                        shape: Palette.subCardShape,
                        padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                        child: commonText(
                          text: 'Cancel Booking',
                          color: kOrange,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        onPressed: () {
                          BtmCancelSheet(context);
                        }),
                  ),
                ),
                const SizedBox(
                  width: 18,
                ),
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: MaterialButton(
                        color: kOrange,
                        shape: Palette.subCardShape,
                        padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                        child: Text(
                          'View Receipt',
                          style: Palette.topText,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewReceipt(
                                        code: onGoingBookings['code'],
                                      )));
                        }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> BtmCancelSheet(BuildContext context) {
    return showModalBottomSheet(
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
                      text: "Cancel Booking",
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
                          text:
                              "Are You Sure Want To Cancel Your Hotel Booking",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    commonText(
                      textAlign: TextAlign.center,
                      color: kBlack.withAlpha(125),
                      fontSize: 14,
                      text:
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum has been the industry's standard dummy text ever ",
                      fontWeight: FontWeight.w400,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 6,
                        right: 6,
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
                                    border: Border.all(color: kOrange),
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(6)),
                                height: 45,
                                child: Center(
                                  child: commonText(
                                    textAlign: TextAlign.center,
                                    color: kBlack,
                                    fontSize: 12,
                                    text: "Cancel",
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
                              onTap: (() {
                                Navigator.pop(context);
                              }),
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
                                    text: "Yes, Continue",
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
}
