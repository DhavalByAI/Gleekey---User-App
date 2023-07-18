import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:gleekey_user/src/Menu/Bookings/Booking%20Card/bookingUpcomingCard.dart';
import 'package:gleekey_user/src/Menu/Bookings/bookings_controller.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/widgets/Shimmer/property_shimmer.dart';

class UpcomingTab extends StatelessWidget {
  const UpcomingTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingsController>(
      initState: (_) {},
      builder: (_) {
        return _.isDataLoaded
            ? _.upcomingBookings.isNotEmpty
                ? ListView.builder(
                    itemCount: _.upcomingBookings.length,
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          BookingUpcomingCard(
                            upcomingProperties: _.upcomingBookings[index],
                          ),
                          index != _.upcomingBookings.length - 1
                              ? const Divider(
                                  color: kDarkGrey,
                                  height: 1,
                                )
                              : const SizedBox()
                        ],
                      );
                    }))
                : Center(
                    child: Image.asset("assets/images/noData.png"),
                  )
            : ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 24,
                  );
                },
                itemCount: 3,
                itemBuilder: ((context, index) {
                  return const PropertyShimmer();
                }));
      },
    );
  }
}
