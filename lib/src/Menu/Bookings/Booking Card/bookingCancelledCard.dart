import 'package:flutter/material.dart';
import 'package:gleekey_user/src/Menu/Bookings/bookings_model.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/utils/style/palette.dart';
import 'package:intl/intl.dart';

class BookingCancelledCard extends StatelessWidget {
  var canceledBookings;
  BookingCancelledCard({Key? key, required this.canceledBookings})
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
                        canceledBookings['properties']['coverPhoto']))),
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
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Center(
                        child: Text(
                          "Cancelled And Refunded",
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
                    canceledBookings['properties']['name'],
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
                  Text(canceledBookings['properties']['avgRating'].toString(),
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
                    '${(canceledBookings['per_night'].toInt()).toString()}/Night',
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
                      "${DateFormat.d().format(DateTime.parse(canceledBookings['start_date']))}-${DateFormat.d().format(DateTime.parse(canceledBookings['end_date']))} ${DateFormat.MMM().format(DateTime.parse(canceledBookings['start_date']))} ${DateFormat.y().format(DateTime.parse(canceledBookings['start_date']))}",
                      style: Palette.registerText1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
