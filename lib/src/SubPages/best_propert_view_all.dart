import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/Menu/DashBoard/dashboard_controller.dart';
import 'package:gleekey_user/widgets/property_widget.dart';
import '../../utils/style/constants.dart';
import '../../utils/style/palette.dart';
import 'SearchPlaces/searchBar.dart';

class BestPropertyViewAll extends StatelessWidget {
  const BestPropertyViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    DashBoardController getc = Get.find();
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: kWhite,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: kBlack,
              ),
            ),
            const Spacer(),
            Text(
              "Villa",
              style: Palette.headerText,
            ),
            const Spacer()
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(26, 0, 26, 8),
        child: Column(
          children: [
            const SearchBarWidget(),
            const SizedBox(
              height: 15,
            ),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: getc.properties.length,
                itemBuilder: ((context, index) {
                  return Property(
                    properties: getc.properties[index],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
