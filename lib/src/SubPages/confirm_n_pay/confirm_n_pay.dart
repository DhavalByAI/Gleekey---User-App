import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/SubPages/Payment%20Methods/paymentMethod_controller.dart';
import 'package:gleekey_user/src/SubPages/Payment%20Methods/paymentMethod_view.dart';
import 'package:gleekey_user/src/SubPages/PropertyAllDetails/propertyAllDetails_controller.dart';
import 'package:gleekey_user/src/SubPages/SearchPlaces/searchPlaces_controller.dart';
import 'package:gleekey_user/src/SubPages/appBarWithTitleAndBack.dart';
import 'package:gleekey_user/src/SubPages/confirm_n_pay/confirm_n_pay_controller.dart';
import 'package:gleekey_user/widgets/commonText.dart';

import 'package:intl/intl.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/widgets/text_fields_widgets/custom_textfield_common.dart';
import 'package:gleekey_user/widgets/text_fields_widgets/custrom_textfield_paragraph.dart';

import '../../../utils/style/palette.dart';

class ConfirmNpay extends StatelessWidget {
  String coverImg;
  int totalPrice;
  List<SelectedDateWithPrice> selectedDates;

  ConfirmNpay(
      {super.key,
      required this.selectedDates,
      required this.coverImg,
      required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    ConfrimNPayController _ = Get.put(ConfrimNPayController());
    PaymentMethodController c = Get.put(PaymentMethodController());
    return Scaffold(
      appBar: AppBarWithTitleAndBack(title: "Confirm & Pay"),
      body: SingleChildScrollView(
        child: Container(
          color: kWhite,
          padding: const EdgeInsets.all(22),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: kOrange,
                      width: 1.3,
                    )),
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    // Container(
                    //   height: 145,
                    //   width: double.maxFinite,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(6),
                    //       image: DecorationImage(
                    //           fit: BoxFit.cover,
                    //           image: NetworkImage(coverImg))),
                    // ),
                    CachedNetworkImage(
                      imageUrl: coverImg.toString(),
                      imageBuilder: (context, imageProvider) => Container(
                        height: 145,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                            // colorFilter: const ColorFilter.mode(
                            //     Colors.yr, BlendMode.colorBurn)
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Price ",
                                style: Palette.paymentBlack13,
                              ),
                              Text(
                                "(${selectedDates.length} Night)",
                                style: Palette.paymentGrey13,
                              ),
                              const Spacer(),
                              Text(
                                "₹ ",
                                style: Palette.paymentBlack13,
                              ),
                              Text(
                                "$totalPrice",
                                style: Palette.paymentBlack13,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Bounce(
                            onPressed: () {
                              _.isPriceBreakup = !_.isPriceBreakup;
                              _.update();
                            },
                            duration: const Duration(milliseconds: 150),
                            child: const Row(
                              children: [
                                Text(
                                  "View Price Breakup",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: kOrange,
                                      decoration: TextDecoration.underline),
                                ),
                              ],
                            ),
                          ),
                          GetBuilder<ConfrimNPayController>(
                            initState: (_) {},
                            builder: (_) {
                              return Visibility(
                                visible: _.isPriceBreakup,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: ListView.separated(
                                    itemCount: selectedDates.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return Row(
                                        children: [
                                          Text(selectedDates[index].date,
                                              style: Palette.GreyText12w500
                                                  .copyWith(
                                                      color: Colors.black54)),
                                          const Spacer(),
                                          Text(
                                            selectedDates[index].price,
                                            style: Palette.paymentBlack13,
                                          ),
                                        ],
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(
                                        height: 8,
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Text(
                                "Goods & Services Tax",
                                style: Palette.paymentBlack13,
                              ),
                              const Spacer(),
                              Text(
                                "₹ ",
                                style: Palette.paymentBlack13,
                              ),
                              Text(
                                "${(totalPrice * 12) / 100}",
                                style: Palette.paymentBlack13,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          const Divider(
                            height: 1,
                            color: kBlack,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Text(
                                "Total",
                                style: Palette.paymentBlack13,
                              ),
                              const Spacer(),
                              Text(
                                "₹ ",
                                style: Palette.paymentBlack13,
                              ),
                              Text(
                                "${totalPrice + (totalPrice * 12) / 100}",
                                style: Palette.paymentBlack13,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 28,
              // ),
              // Text(
              //   "Do You Have A Promo Code?",
              //   style: Palette.headerText,
              // ),
              // const SizedBox(
              //   height: 13,
              // ),
              // Text(
              //   "Enter Your Promo Code",
              //   style: Palette.bottomTextDark,
              // ),
              // const SizedBox(
              //   height: 15,
              // ),
              // SizedBox(
              //   height: 45,
              //   child: Row(
              //     children: [
              //       Flexible(
              //         child: CustomTextfieldCommon(
              //             validate: () {},
              //             controller: _.promoCode,
              //             label: " ",
              //             hint: " "),
              //       ),
              //       const SizedBox(
              //         width: 10,
              //       ),
              //       SizedBox(
              //         height: 45,
              //         width: 100,
              //         child: MaterialButton(
              //             color: kOrange,
              //             shape: Palette.subCardShape,
              //             padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
              //             child: Text(
              //               'Apply',
              //               style: Palette.bestText4,
              //             ),
              //             onPressed: () {}),
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(
                height: 16,
              ),
              // const Divider(
              //   color: kBlack,
              // ),
              const SizedBox(
                height: 26,
              ),
              Row(
                children: [
                  Text(
                    "Your Trip",
                    style: Palette.headerText,
                  ),
                  const Spacer(),
                  // const SizedBox(height: 45, width: 85, child: searchEdit()
                  //  MaterialButton(
                  //     color: kOrange,
                  //     shape: Palette.subCardShape,
                  //     padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                  //     child: Text(
                  //       'Edit',
                  //       style: Palette.bestText4,
                  //     ),
                  //     onPressed: () {
                  //       Get.dialog(Scaffold(body: SearchBarWidget()));

                  //     }),

                  // ),
                ],
              ),
              const SizedBox(
                height: 26,
              ),
              Row(
                children: [
                  Text(
                    "Check In :",
                    style: Palette.paymentBlack13,
                  ),
                  const Spacer(),
                  Text(
                    selectedDates[0].date,
                    style: Palette.GreyText12w500,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    "Check Out :",
                    style: Palette.paymentBlack13,
                  ),
                  const Spacer(),
                  Text(
                    DateFormat('dd-MM-yyyy').format(DateFormat('dd-MM-yyyy')
                        .parse(selectedDates.last.date)
                        .add(const Duration(days: 1))),
                    style: Palette.GreyText12w500,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<SearchPlacesController>(
                initState: (_) {},
                builder: (_) {
                  return Row(
                    children: [
                      Text(
                        "Total Guests :",
                        style: Palette.paymentBlack13,
                      ),
                      const Spacer(),
                      Text(
                        "${_.totalAdults} Adults",
                        style: Palette.GreyText12w500,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<SearchPlacesController>(
                initState: (_) {},
                builder: (_) {
                  return Row(
                    children: [
                      Text(
                        "Total Childrens :",
                        style: Palette.paymentBlack13,
                      ),
                      const Spacer(),
                      Text(
                        "${_.totalChildren} Childrens",
                        style: Palette.GreyText12w500,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<SearchPlacesController>(
                initState: (_) {},
                builder: (_) {
                  return Row(
                    children: [
                      Text(
                        "Total Infant :",
                        style: Palette.paymentBlack13,
                      ),
                      const Spacer(),
                      Text(
                        "${_.totalInphant} Infant",
                        style: Palette.GreyText12w500,
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Text(
                    "Room :",
                    style: Palette.paymentBlack13,
                  ),
                  const Spacer(),
                  Text(
                    "1 Room",
                    style: Palette.GreyText12w500,
                  ),
                ],
              ),
              const SizedBox(
                height: 21,
              ),
              const Divider(
                color: kBlack,
              ),
              const SizedBox(
                height: 28,
              ),
              Text(
                "Enter Your Details",
                style: Palette.headerText,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "First Name",
                style: Palette.paymentBlack13,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 45,
                  child: CustomTextfieldCommon(
                      validate: () {},
                      controller: _.firstName,
                      label: "",
                      hint: "")),
              const SizedBox(
                height: 18,
              ),
              Text(
                "Last Name",
                style: Palette.paymentBlack13,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 45,
                  child: CustomTextfieldCommon(
                      validate: () {},
                      controller: _.lastName,
                      label: "",
                      hint: "")),
              const SizedBox(
                height: 18,
              ),
              Text(
                "Email Address",
                style: Palette.paymentBlack13,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 45,
                  child: CustomTextfieldCommon(
                      validate: () {},
                      controller: _.email,
                      label: "",
                      hint: "")),
              const SizedBox(
                height: 18,
              ),
              Text(
                "Mobile Number",
                style: Palette.paymentBlack13,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 45,
                  child: CustomTextfieldCommon(
                      validate: () {},
                      controller: _.mobile,
                      textInputType: TextInputType.phone,
                      label: "",
                      hint: "")),
              const SizedBox(
                height: 24,
              ),
              const Divider(
                color: kBlack,
              ),
              // const SizedBox(
              //   height: 16,
              // ),
              // Text(
              //   "Who Are You Booking For?",
              //   style: Palette.headerText,
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   children: [
              //     Transform.scale(
              //       scale: 1.3,
              //       child: Radio(
              //         splashRadius: 50,
              //         toggleable: true,
              //         focusColor: kOrange,
              //         value: 0,
              //         autofocus: true,
              //         activeColor: kOrange,
              //         groupValue: _.selectedRadioButton,
              //         onChanged: (value) {
              //           // setState(() {
              //           //   selectedRadioButton = value!.toDouble();
              //           // });
              //         },
              //       ),
              //     ),
              //     Text("I am The Main Guest", style: Palette.GreyText12w500),
              //   ],
              // ),
              // Row(
              //   children: [
              //     Transform.scale(
              //       scale: 1.3,
              //       child: Radio(
              //         toggleable: true,
              //         focusColor: kOrange,
              //         overlayColor:
              //             MaterialStateColor.resolveWith((states) => kOrange),
              //         value: 1,
              //         autofocus: true,
              //         activeColor: kOrange,
              //         groupValue: _.selectedRadioButton,
              //         onChanged: (value) {
              //           // setState(() {
              //           //   _.selectedRadioButton = value!.toDouble();
              //           // });
              //         },
              //       ),
              //     ),
              //     Text("Booking is for Someone Else",
              //         style: Palette.GreyText12w500),
              //   ],
              // ),
              // const SizedBox(
              //   height: 22,
              // ),
              // const Divider(
              //   color: kBlack,
              // ),
              // const SizedBox(
              //   height: 18,
              // ),
              // Text(
              //   "Guests : 1 Adults",
              //   style: Palette.headerText,
              // ),
              // const SizedBox(
              //   height: 22,
              // ),
              // Text(
              //   "Full Guest Name",
              //   style: Palette.paymentBlack13,
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // SizedBox(
              //     height: 45,
              //     child: CustomTextfieldCommon(
              //         validate: () {},
              //         controller: _.lastName,
              //         label: "",
              //         hint: "")),
              // const SizedBox(
              //   height: 18,
              // ),
              // Row(
              //   children: [
              //     Text(
              //       "Guest email ",
              //       style: Palette.paymentBlack13,
              //     ),
              //     Text(
              //       "(Optional)",
              //       style: Palette.paymentGrey13,
              //     ),
              //   ],
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              // SizedBox(
              //     height: 45,
              //     child: CustomTextfieldCommon(
              //         validate: () {},
              //         controller: _.lastName,
              //         label: "",
              //         hint: "")),
              // const SizedBox(
              //   height: 18,
              // ),
              // const Divider(
              //   color: kBlack,
              // ),

              Text(
                "Request",
                style: Palette.headerText,
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Text(
              //   "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              //   style: Palette.paymentRequestText,
              // ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 92,
                  child: CustomTextfieldPara(
                      controller: _.request,
                      label: "",
                      hint: "Additional request")),
              const SizedBox(
                height: 18,
              ),
              const Divider(
                color: kBlack,
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                "Cancellation Policy",
                style: Palette.headerText,
              ),
              const SizedBox(
                height: 10,
              ),

              Column(
                children: List<Widget>.generate(
                  4,
                  ((index) {
                    List CancellationPollicy = [
                      "If you wish to cancel 30 days before the arrival date, you will be charged 5% cancellation charges** of the booking value in the original payment mode.",
                      "Cancellations that are made between 16 to 30 days prior to the arrival date, 15% cancellation charges** of the total booking value.",
                      "Cancellations that are made between 8 to 15 days prior to the arrival date, 25% cancellation charges** of the total booking value.",
                      "For any cancellations requested within 7 days of the check-in date, the booking will be non-refundable."
                    ];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/orangeDot.png",
                            height: 8,
                            width: 8,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Text(
                              CancellationPollicy[index],
                              style: Palette.bestText2,
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "**Please note: Cancellation fee is primarily applicable to cover platform charges, convenience fee and processing charges. Taxes as applicable.",
                style: Palette.bestText2
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
              ),

              const SizedBox(
                height: 13,
              ),
              const Divider(
                color: kBlack,
              ),
              const SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Pay With",
                    style: Palette.headerText,
                  ),
                  Bounce(
                    duration: const Duration(milliseconds: 300),
                    onPressed: () {
                      Get.to(() => const PaymentMethod());
                    },
                    child: commonText(
                      text: "Change Method",
                      color: kOrange,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              GetBuilder<PaymentMethodController>(
                initState: (_) {},
                builder: (_) {
                  return CardTile(
                      cardTile: _.allCardTile[_.currSelectedMethod],
                      value: _.currSelectedMethod);
                },
              ),
              // Container(
              //   height: 45,
              //   decoration: BoxDecoration(
              //       color: kWhite,
              //       borderRadius: BorderRadius.circular(6),
              //       border: Border.all(
              //         color: kDarkGrey.withAlpha(150),
              //         width: 1,
              //       )),
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 12),
              //     child: Row(
              //       children: [
              //         Image.asset(
              //           "assets/images/credit_card.png",
              //           height: 20,
              //           width: 20,
              //         ),
              //         const Text("    Credit Card / Debit Card"),
              //         const Spacer(),
              //         Transform.scale(
              //           scale: 1.2,
              //           child: Radio(
              //             splashRadius: 50,
              //             toggleable: true,
              //             focusColor: kOrange,
              //             value: 0,
              //             autofocus: true,
              //             activeColor: kOrange,
              //             groupValue: _.selectedRadioButton1,
              //             onChanged: (value) {
              //               // setState(() {
              //               //   selectedRadioButton1 = value!.toDouble();
              //               // });
              //             },
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 12,
              // ),
              // Container(
              //   height: 45,
              //   decoration: BoxDecoration(
              //       color: kWhite,
              //       borderRadius: BorderRadius.circular(6),
              //       border: Border.all(
              //         color: kDarkGrey.withAlpha(150),
              //         width: 1,
              //       )),
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 12),
              //     child: Row(
              //       children: [
              //         Image.asset(
              //           "assets/images/google-pay.png",
              //           height: 20,
              //           width: 20,
              //         ),
              //         const Text("    Credit Card / Debit Card"),
              //         const Spacer(),
              //         Transform.scale(
              //           scale: 1.2,
              //           child: Radio(
              //             splashRadius: 50,
              //             toggleable: true,
              //             focusColor: kOrange,
              //             value: 1,
              //             autofocus: true,
              //             activeColor: kOrange,
              //             groupValue: _.selectedRadioButton1,
              //             onChanged: (value) {
              //               // setState(() {
              //               //   selectedRadioButton1 = value!.toDouble();
              //               // });
              //             },
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 12,
              // ),
              // Container(
              //   height: 45,
              //   decoration: BoxDecoration(
              //       color: kWhite,
              //       borderRadius: BorderRadius.circular(6),
              //       border: Border.all(
              //         color: kDarkGrey.withAlpha(150),
              //         width: 1,
              //       )),
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 12),
              //     child: Row(
              //       children: [
              //         Image.asset(
              //           "assets/images/paytm.png",
              //           height: 20,
              //           width: 20,
              //         ),
              //         const Text("    Credit Card / Debit Card"),
              //         const Spacer(),
              //         Transform.scale(
              //           scale: 1.2,
              //           child: Radio(
              //             splashRadius: 50,
              //             toggleable: true,
              //             focusColor: kOrange,
              //             value: 2,
              //             autofocus: true,
              //             activeColor: kOrange,
              //             groupValue: _.selectedRadioButton1,
              //             onChanged: (value) {
              //               // setState(() {
              //               //   selectedRadioButton1 = value!.toDouble();
              //               // });
              //             },
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              // const SizedBox(
              //   height: 20,
              // ),

              // const Divider(
              //   color: kBlack,
              // ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                width: double.maxFinite,
                child: MaterialButton(
                    color: kOrange,
                    shape: Palette.subCardShape,
                    padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
                    child: Text(
                      'Continue',
                      style: Palette.bestText4,
                    ),
                    onPressed: () {}),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
