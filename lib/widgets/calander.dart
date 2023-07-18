import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

import '../src/SubPages/SearchPlaces/searchPlaces_controller.dart';
import '../utils/style/constants.dart';

class calander extends StatelessWidget {
  const calander({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SearchPlacesController getController = Get.find();
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: kOrange,
            )),
        child: GetBuilder<SearchPlacesController>(
          initState: (_) {},
          builder: (_) {
            return SfDateRangePicker(
              initialSelectedRange: (_.startDate != null && _.endDate != null)
                  ? PickerDateRange(
                      DateFormat('dd-MM-yyyy').parse(_.startDate!),
                      DateFormat('dd-MM-yyyy').parse(_.endDate!))
                  : null,
              navigationMode: DateRangePickerNavigationMode.scroll,
              showActionButtons: false,
              monthCellStyle: const DateRangePickerMonthCellStyle(),
              enablePastDates: false,
              minDate: DateTime.now(),
              maxDate: DateTime.now().add(const Duration(days: 45)),
              monthViewSettings:
                  const DateRangePickerMonthViewSettings(blackoutDates: [
                // DateTime(2022, 12, 29),
                // DateTime(2023, 1, 2),
                // DateTime(2023, 1, 3),
              ]),
              onSelectionChanged: ((args) {
                if (args.value.startDate != null) {
                  getController.startDate = DateFormat('dd-MM-yyyy')
                      .format(DateTime.parse(args.value.startDate.toString()))
                      .toString();
                } else {
                  getController.startDate = null;
                }
                if (args.value.endDate != null) {
                  getController.endDate = DateFormat('dd-MM-yyyy')
                      .format(DateTime.parse(args.value.endDate.toString()))
                      .toString();
                } else {
                  getController.endDate = null;
                }
                getController.priceUpdate();
                getController.update();
              }),
              selectionMode: DateRangePickerSelectionMode.range,
            );
          },
        ));
  }
}
