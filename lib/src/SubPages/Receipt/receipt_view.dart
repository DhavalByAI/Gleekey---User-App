import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/SubPages/appBarWithTitleAndBack.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/utils/style/palette.dart';
import 'package:gleekey_user/widgets/commonText.dart';
import 'package:intl/intl.dart';

import 'receipt_controller.dart';

class ViewReceipt extends StatelessWidget {
  String code;
  ViewReceipt({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    ReceiptController getController = Get.put(ReceiptController());
    getController.getApi(code);
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBarWithTitleAndBack(title: "View Receipt"),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 6),
            child: GetBuilder<ReceiptController>(
              initState: (_) {},
              builder: (_) {
                return _.isDataLoaded
                    ? Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                              ),
                            ]),
                            child: Card(
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(18),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        commonText(
                                            text: "Booked on",
                                            color: kBlack.withAlpha(125),
                                            fontSize: 12),
                                        commonText(
                                            text: DateFormat('dd MMM yyyy')
                                                .format(DateTime.parse(
                                                    _.booking!.createdAt)),
                                            color: kBlack,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Divider(
                                        color: kBlack.withAlpha(125),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        commonText(
                                            text: "Check In",
                                            color: kBlack.withAlpha(125),
                                            fontSize: 12),
                                        commonText(
                                            text: DateFormat('dd MMM yyyy')
                                                .format(DateTime.parse(
                                                    _.booking!.startDate)),
                                            color: kBlack,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Divider(
                                        color: kBlack.withAlpha(125),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        commonText(
                                            text: "Check Out",
                                            color: kBlack.withAlpha(125),
                                            fontSize: 12),
                                        commonText(
                                            text: DateFormat('dd MMM yyyy')
                                                .format(DateTime.parse(
                                                    _.booking!.endDate)),
                                            color: kBlack,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Divider(
                                        color: kBlack.withAlpha(125),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        commonText(
                                            text: "Guests",
                                            color: kBlack.withAlpha(125),
                                            fontSize: 12),
                                        commonText(
                                            text: "${_.booking!.guest} Adults",
                                            color: kBlack,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Divider(
                                        color: kBlack.withAlpha(125),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        commonText(
                                            text: "Nights",
                                            color: kBlack.withAlpha(125),
                                            fontSize: 12),
                                        commonText(
                                            text:
                                                "${_.booking!.totalNight} Nights",
                                            color: kBlack,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 3,
                              ),
                            ]),
                            child: Card(
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(18),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        commonText(
                                            text:
                                                "${_.booking!.perNight} x ${_.booking!.totalNight} Nights",
                                            color: kBlack.withAlpha(125),
                                            fontSize: 12),
                                        commonText(
                                            text: NumberFormat.simpleCurrency(
                                                    locale: 'en_US',
                                                    name:
                                                        _.booking!.currencyCode,
                                                    decimalDigits: 2)
                                                .format(_.booking!.perNight *
                                                    _.booking!.totalNight),
                                            color: kBlack,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Divider(
                                        color: kBlack.withAlpha(125),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        commonText(
                                            text: "Goods & Service Tax",
                                            color: kBlack.withAlpha(125),
                                            fontSize: 12),
                                        commonText(
                                            text: NumberFormat.simpleCurrency(
                                                    locale: 'en_US',
                                                    name:
                                                        _.booking!.currencyCode,
                                                    decimalDigits: 2)
                                                .format(_.booking!.ivaTax),
                                            color: kBlack,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Divider(
                                        color: kBlack.withAlpha(125),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        commonText(
                                            text: "Accomodation Tax",
                                            color: kBlack.withAlpha(125),
                                            fontSize: 12),
                                        commonText(
                                            text: NumberFormat.simpleCurrency(
                                                    locale: 'en_US',
                                                    name:
                                                        _.booking!.currencyCode,
                                                    decimalDigits: 2)
                                                .format(
                                                    _.booking!.accomodationTax),
                                            color: kBlack,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Divider(
                                        color: kBlack.withAlpha(125),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        commonText(
                                            text: "Security Fee",
                                            color: kBlack.withAlpha(125),
                                            fontSize: 12),
                                        commonText(
                                            text: NumberFormat.simpleCurrency(
                                                    locale: 'en_US',
                                                    name:
                                                        _.booking!.currencyCode,
                                                    decimalDigits: 2)
                                                .format(
                                                    _.booking!.securityMoney),
                                            color: kBlack,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Divider(
                                        color: kBlack.withAlpha(125),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        commonText(
                                            text: "Service Charge",
                                            color: kBlack.withAlpha(125),
                                            fontSize: 12),
                                        commonText(
                                            text: NumberFormat.simpleCurrency(
                                                    locale: 'en_US',
                                                    name:
                                                        _.booking!.currencyCode,
                                                    decimalDigits: 2)
                                                .format(
                                                    _.booking!.serviceCharge),
                                            color: kBlack,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Divider(
                                        color: kBlack.withAlpha(125),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        commonText(
                                            text: "Total",
                                            color: kBlack.withAlpha(125),
                                            fontSize: 12),
                                        commonText(
                                            text: NumberFormat.simpleCurrency(
                                                    locale: 'en_US',
                                                    name:
                                                        _.booking!.currencyCode,
                                                    decimalDigits: 2)
                                                .format(_.booking!.basePrice),
                                            color: kBlack,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                              ),
                            ]),
                            child: Card(
                              elevation: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(18),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        commonText(
                                            text: "Name",
                                            color: kBlack.withAlpha(125),
                                            fontSize: 12),
                                        commonText(
                                            text: "Dhaval Anghan",
                                            color: kBlack,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Divider(
                                        color: kBlack.withAlpha(125),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        commonText(
                                            text: "Phone Number",
                                            color: kBlack.withAlpha(125),
                                            fontSize: 12),
                                        commonText(
                                            text: "+91757306452",
                                            color: kBlack,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Divider(
                                        color: kBlack.withAlpha(125),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        commonText(
                                            text: "Booking ID",
                                            color: kBlack.withAlpha(125),
                                            fontSize: 12),
                                        commonText(
                                            text: "152DFD1F5F",
                                            color: kBlack,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Divider(
                                        color: kBlack.withAlpha(125),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        commonText(
                                            text: "Transection ID",
                                            color: kBlack.withAlpha(125),
                                            fontSize: 12),
                                        commonText(
                                            text: "454DSFSFSS",
                                            color: kBlack,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 6),
                                      child: Divider(
                                        color: kBlack.withAlpha(125),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        commonText(
                                            text: "Status",
                                            color: kBlack.withAlpha(125),
                                            fontSize: 12),
                                        commonText(
                                            text: "Paid",
                                            color: kBlack,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                              shape: Palette.subCardShape,
                              color: kOrange,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 45,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.file_download_outlined,
                                      color: kWhite,
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      'Download Receipt',
                                      style: Palette.btnText,
                                    ),
                                  ],
                                ),
                              ),
                              onPressed: () {}),
                          //   Navigator.push(context,
                          //       MaterialPageRoute(builder: (context) => BottomMenu()));
                          // })
                        ],
                      )
                    : SizedBox();
              },
            )),
      ),
    );
  }
}
