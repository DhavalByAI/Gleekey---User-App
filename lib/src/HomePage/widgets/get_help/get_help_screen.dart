// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/extras/app_colors.dart';
import 'package:gleekey_user/extras/text_styles.dart';

import 'help_detail_screen.dart';

class GetHelpScreen extends StatelessWidget {
  const GetHelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 17, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 20,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Help',
                        style: color00000s18w600,
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0,
                    child: IgnorePointer(
                      ignoring: true,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: HelpView(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column HelpView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
          style: color00000s15w600,
        ),
        const SizedBox(
          height: 30,
        ),
        CommonNextStepView(
          name: 'Edit your account settings',
          onTap: () {
            Get.to(() => HelpDetailScreen());
          },
        ),
        CommonNextStepView(
          name: 'How to submit your ID',
          onTap: () {
            print('tap');
          },
        ),
        CommonNextStepView(
          name: 'Find your payment',
          onTap: () {
            print('tap');
          },
        ),
        CommonNextStepView(
          name: 'Lorem Ipsum is simply dummy text',
          onTap: () {
            print('tap');
          },
        ),
      ],
    );
  }

  Column CommonNextStepView({
    required String name,
    GestureTapCallback? onTap,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: color00000s14w500,
              ),
              const Icon(
                Icons.arrow_forward_outlined,
                size: 20,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            color: AppColors.color000000.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}
