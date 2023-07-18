import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/Menu/Bookings/BookingTabs/AllTab.dart';
import 'package:gleekey_user/src/Menu/Bookings/BookingTabs/cancelledTab.dart';
import 'package:gleekey_user/src/Menu/Bookings/BookingTabs/compltedTab.dart';
import 'package:gleekey_user/src/Menu/Bookings/BookingTabs/onGoingTab.dart';
import 'package:gleekey_user/src/Menu/Bookings/BookingTabs/upcomingTab.dart';
import 'package:gleekey_user/src/Menu/Bookings/bookings_controller.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/utils/style/palette.dart';

import 'BookingTabs/expiredTab.dart';

late TabController _controller;
List<String> tabNames = [
  "All",
  "Ongoing",
  "Completed",
  "Upcoming",
  "Expired",
  "Canceled"
];
List<Widget> bookingTabs = const [
  AllTab(),
  OnGoingtab(),
  CompletedTab(),
  UpcomingTab(),
  ExpiredTab(),
  CencelledTab(),
];

class Bookings extends StatefulWidget {
  const Bookings({Key? key}) : super(key: key);

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> with TickerProviderStateMixin {
  BookingsController getController = Get.find();
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: tabNames.length, vsync: this);
    _controller.index = 0;
    getController.tabCurrIndex = _controller.index;
    getController.update();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: kWhite,
        shadowColor: kWhite,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "My Bookings",
              style: Palette.headerText,
            ),
          ],
        ),
        bottom: TabBar(
          // physics: const NeverScrollableScrollPhysics(),

          indicatorColor: kWhite,
          controller: _controller,
          onTap: (index) {
            _controller.index = index;
            getController.tabCurrIndex = index;
            getController.update();
          },
          isScrollable: true,
          tabs: tabs,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
        child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            children: bookingTabs),
      ),
    );
  }
}

var tabs = List.generate(tabNames.length, ((index) {
  return GetBuilder<BookingsController>(
    initState: (_) {},
    builder: (_) {
      return Container(
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: kOrange),
          borderRadius: BorderRadius.circular(6),
          color: _.tabCurrIndex == index ? kOrange : kWhite,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Text(
              '${tabNames[index]}',
              maxLines: 1,
              style: _.tabCurrIndex == index
                  ? Palette.bookingTabSelected
                  : Palette.bookingTabunSelected,
            ),
          ),
        ),
      );
    },
  );
}));
