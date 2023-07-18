import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/SubPages/SearchPlaces/searchPlaces_controller.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/widgets/commonText.dart';

class SearchPlaces extends StatelessWidget {
  const SearchPlaces({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchPlacesController>(
      initState: (_) {},
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: (() {
                    Navigator.pop(context);
                  }),
                  child: Image.asset(
                    "assets/images/cancel.png",
                    height: 21,
                    width: 21,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                commonText(
                  text: "Where's Your Trip?",
                  color: kBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 55,
              width: double.maxFinite,
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: TextField(
                    autofocus: true,
                    controller: _.searchTextController,
                    style: const TextStyle(),
                    decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: kOrange))),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonText(
                  text: "Top Search",
                  color: kBlack.withAlpha(125),
                  fontSize: 11,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 2,
                  width: 55,
                  color: kOrange,
                )
              ],
            )),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 80,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      _.pridiction.length,
                      (index) => InkWell(
                            onTap: () {
                              _.selectedPlace =
                                  _.pridiction[index]['description'];
                              _.update();
                              Get.back();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SizedBox(
                                  width: dwidth.toDouble(),
                                  child: commonText(
                                    textAlign: TextAlign.start,
                                    text: _.pridiction[index]['description'],
                                    color: kBlack,
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                          )),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
