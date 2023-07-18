import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/widgets/commonText.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportScreen extends StatelessWidget {
  SupportScreen({Key? key}) : super(key: key);
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _contactNumber = TextEditingController();
  TextEditingController _message = TextEditingController();
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
                      child: commonText(
                        text: 'Support',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
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
        commonText(
          text: 'Welcome To Gleekey!',
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        const SizedBox(
          height: 30,
        ),
        CommonNextStepView(
            title: 'PHONE',
            name: '6358400455 / 56/ 57',
            onTap: () async {
              if (await canLaunch("tel:+91 6358400455")) {
                await launch("tel:+91 6358400455");
              } else {
                throw 'Could not launch';
              }
            }),
        CommonNextStepView(
            title: 'BUSINESS INQUIRY',
            name: 'business@gleekey.in',
            onTap: () async {
              if (await canLaunch("mailto:business@gleekey.in")) {
                await launch("mailto:business@gleekey.in");
              } else {
                throw 'Could not launch';
              } /*final String subject = "BUSINESS INQUIRY";              final String stringText = "Same Message:";              String uri = 'mailto:business@gleekey.in?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(stringText)}';              if (await canLaunch(uri)) {                await launch(uri);              } else {                print("No email client found");              }*/
            }),
        CommonNextStepView(
          title: 'CONTACT INQUIRY',
          name: 'no-reply@gleekey.in',
          onTap: () async {
            if (await canLaunch("mailto:no-reply@gleekey.in")) {
              await launch(
                "mailto:no-reply@gleekey.in",
              );
            } else {
              throw 'Could not launch';
            }
          },
        ), /*   Text(          'Fill out the form & we\'ll be in touch soon!',          style: color00000s15w600,        ),        CommonTextFeildPart(controller: _name, title: 'Name'),        CommonTextFeildPart(controller: _email, title: 'Email'),        CommonTextFeildPart(            controller: _contactNumber, title: 'Contact Number'),        CommonTextFeildPart(            controller: _message, title: 'Message', maxLines: 4),        Align(          alignment: Alignment.center,          child: CommonButton(            onPressed: () {},            name: 'Save',          ),        )*/
      ],
    );
  }

  Column CommonNextStepView({
    required String name,
    required String title,
    GestureTapCallback? onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonText(
          text: title,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        InkWell(
          onTap: onTap,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              commonText(
                text: name,
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: kOrange,
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
            color: Colors.black.withOpacity(0.2),
          ),
        ),
      ],
    );
  }

  Widget CommonTextFeildPart(
      {String? title,
      required TextEditingController controller,
      Widget? suffix,
      Widget? prefix,
      bool readOnly = false,
      GestureTapCallback? onTap,
      int? maxLines = 1,
      List<TextInputFormatter>? inputFormatters,
      ValueChanged<String>? onChanged,
      TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          commonText(
            text: title ?? '',
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            onTap: onTap,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            maxLines: maxLines,
            cursorColor: kOrange,
            keyboardType: keyboardType,
            controller: controller,
            readOnly: readOnly,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            decoration: InputDecoration(
              suffixIcon: suffix,
              prefixIcon: prefix,
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
