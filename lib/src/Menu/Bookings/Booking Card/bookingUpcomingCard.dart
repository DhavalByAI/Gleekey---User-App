import 'package:flutter/material.dart';
import 'package:gleekey_user/src/SubPages/Receipt/receipt_view.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/utils/style/palette.dart';

import 'package:intl/intl.dart';

class BookingUpcomingCard extends StatelessWidget {
  var upcomingProperties;
  BookingUpcomingCard({super.key, this.upcomingProperties});

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
                        upcomingProperties['properties']['cover_photo']))),
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
                    upcomingProperties['properties']['name'],
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
                  Text(
                      upcomingProperties['properties']['avg_rating'].toString(),
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
                    '${(upcomingProperties['per_night'].toInt()).toString()}/Night',
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
                      "${DateFormat.d().format(DateTime.parse(upcomingProperties['startDate']))}-${DateFormat.d().format(DateTime.parse(upcomingProperties['end_date']))} ${DateFormat.MMM().format(DateTime.parse(upcomingProperties['start_date']))} ${DateFormat.y().format(DateTime.parse(upcomingProperties['start_date']))}",
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
                // Expanded(
                //   child: SizedBox(
                //     height: 45,
                //     child: MaterialButton(
                //         elevation: 1,
                //         color: kOrangeLite,
                //         shape: Palette.subCardShape,
                //         padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                //         child: commonText(
                //           text: 'Cancel Booking',
                //           color: kOrange,
                //           fontSize: 12,
                //           fontWeight: FontWeight.w600,
                //         ),
                //         onPressed: () {
                //           BtmCancelSheet(context);
                //         }),
                //   ),
                // ),
                // const SizedBox(
                //   width: 18,
                // ),
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
                                        code: upcomingProperties['code'],
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
}
