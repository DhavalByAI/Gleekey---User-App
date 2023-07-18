// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/SubPages/addNewPaymentCard_view.dart';
import 'package:gleekey_user/src/SubPages/appBarWithTitleAndBack.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/utils/style/palette.dart';
import 'package:gleekey_user/widgets/commonText.dart';

import 'paymentMethod_controller.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => PaymentMethodController(), fenix: true);
    return Scaffold(
      backgroundColor: kWhite,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: MaterialButton(
            shape: Palette.subCardShape,
            color: kOrange,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: Center(
                child: Text(
                  'Select',
                  style: Palette.btnText,
                ),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      appBar: AppBarWithTitleAndBack(title: "Payment Method"),
      floatingActionButton: GetBuilder<PaymentMethodController>(
        initState: (_) {},
        builder: (_) {
          return FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              _.addCard();
              Get.to(() => const AddNewPaymentCard());
            },
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            child: GetBuilder<PaymentMethodController>(
              initState: (_) {},
              builder: (_) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    commonText(
                      text: "Cards",
                      color: kBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _.totalCards > 0
                        ? ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: ((context, index) {
                              return CardTile(
                                  cardTile: _.allCardTile[index], value: index);
                            }),
                            separatorBuilder: ((context, index) {
                              return const SizedBox(
                                height: 8,
                              );
                            }),
                            itemCount: _.totalCards)
                        : SizedBox(
                            height: 25,
                            child: Center(
                              child: commonText(
                                text: 'No Card Found',
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    commonText(
                      text: "UPI",
                      color: kBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return CardTile(
                            cardTile: _.allCardTile[index + _.totalCards],
                            value: index + _.totalCards,
                          );
                        }),
                        separatorBuilder: ((context, index) {
                          return const SizedBox(
                            height: 8,
                          );
                        }),
                        itemCount: _.totalUpi),
                    const SizedBox(
                      height: 20,
                    ),
                    commonText(
                      text: "Other",
                      color: kBlack,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return CardTile(
                            cardTile: _
                                .allCardTile[index + _.totalCards + _.totalUpi],
                            value: index + _.totalCards + _.totalUpi,
                          );
                        }),
                        separatorBuilder: ((context, index) {
                          return const SizedBox(
                            height: 8,
                          );
                        }),
                        itemCount: _.totalOthers),
                    const SizedBox(
                      height: 40,
                    ),
                    // commonText(
                    //   text: "Current Method",
                    //   color: kBlack,
                    //   fontSize: 14,
                    //   fontWeight: FontWeight.w700,
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),
                    // CardTile(
                    //     cardTile: _.allCardTile[_.currSelectedMethod],
                    //     value: _.currSelectedMethod),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}

class PaymentCards {
  String imgUrl;
  String title;
  String? subtitle;
  PaymentCards({
    required this.imgUrl,
    required this.title,
    this.subtitle,
  });
}

class CardTile extends StatelessWidget {
  PaymentCards cardTile;
  int value;
  CardTile({Key? key, required this.cardTile, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentMethodController>(
      initState: (_) {},
      builder: (_) {
        return Bounce(
          onPressed: (() {
            _.currSelectedMethod = value;
            _.update();
          }),
          duration: const Duration(milliseconds: 200),
          child: Container(
            decoration: BoxDecoration(
                border: _.currSelectedMethod == value
                    ? Border.all(color: kOrange, width: 2)
                    : Border.all(color: kWhite.withOpacity(0)),
                borderRadius: BorderRadius.circular(10)),
            child: Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                dense: true,
                leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: Center(
                      child: Image.asset(
                    cardTile.imgUrl,
                    height: 15,
                  )),
                ),
                title: commonText(
                  text: value < _.totalCards
                      ? "**** **** **** ${cardTile.title.substring(cardTile.title.length - 4)}"
                      : cardTile.title,
                  color: kBlack,
                  fontSize: 12,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w600,
                ),
                subtitle: cardTile.subtitle != null
                    ? commonText(
                        text: cardTile.subtitle!,
                        color: kBlack.withOpacity(0.5),
                        fontSize: 12,
                        textAlign: TextAlign.start,
                        fontWeight: FontWeight.w400,
                      )
                    : null,
                trailing: GetBuilder<PaymentMethodController>(
                  initState: (_) {},
                  builder: (_) {
                    return SizedBox(
                      height: 50,
                      child: Transform.scale(
                        scale: 1.2,
                        child: Radio(
                          splashRadius: 30,
                          toggleable: true,
                          focusColor: kOrange,
                          value: value,
                          autofocus: true,
                          activeColor: kOrange,
                          groupValue: _.currSelectedMethod,
                          onChanged: (value) {
                            _.currSelectedMethod = value!;
                            _.update();
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
