import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/src/SubPages/appBarWithTitleAndBack.dart';
import 'package:gleekey_user/src/Auth/profile/profile_controller.dart';
import 'package:gleekey_user/utils/baseconstant.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/widgets/commonText.dart';
// import 'package:gleeky_flutter/src/Auth/controller/userLogin_controller.dart';
// import 'package:gleeky_flutter/src/host/setting/edit_personal_info_screen.dart';
// import 'package:gleeky_flutter/utills/app_colors.dart';
// import 'package:gleeky_flutter/utills/text_styles.dart';
import 'package:intl/intl.dart';

import 'edit_personal_info_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _firstName = TextEditingController();

  final TextEditingController _lastName = TextEditingController();

  final TextEditingController _birthdate = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _phoneNumber = TextEditingController();

  // final TextEditingController _governmentID = TextEditingController();
  final TextEditingController _emergencyContect = TextEditingController();

  // Initial Selected Value
  RxString dropdownvalue = 'Gender'.obs;

  // List of items in our dropdown menu
  var items = [
    'Gender',
    'Male',
    'Female',
  ];

  @override
  initState() {
    // log(currUser?.userDetails?.gender ?? 'Gender');
    _firstName.text = currUser?.data?.firstName ?? "";
    _lastName.text = currUser?.data?.lastName ?? "";
    _email.text = currUser?.data?.email ?? "";
    _phoneNumber.text =
        currUser?.data?.formattedPhone ?? currUser?.data?.phone ?? '';
    _birthdate.text = currUser?.data?.email ?? "";
    // dropdownvalue.value = currUser?.userDetails?.gender ?? 'Gender';
    // _governmentID.text = 'Adhar Card';

    // _emergencyContect.text = currUser?.userDetails?.about ?? "";
    super.initState();
  }

  ProfileController userController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWithTitleAndBack(title: "Profile"),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Opacity(
                              opacity: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(6)),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 20),
                                child: commonText(
                                  text: 'EDIT',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: CachedNetworkImage(
                                      imageUrl:
                                          currUser?.data?.profileSrc ?? '',
                                      placeholder: (context, url) =>
                                          const CupertinoActivityIndicator(
                                            color: kOrange,
                                          ),
                                      errorWidget: (context, url, error) =>
                                          const CircleAvatar(
                                            backgroundColor: klightgrey,
                                            child: Icon(
                                              Icons.person,
                                              color: Colors.black,
                                            ),
                                          ),
                                      height: 100,
                                      width: 100,
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => const EditPersonalInfoScreen());
                              },
                              highlightColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(6)),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 20),
                                child: commonText(
                                  text: 'EDIT',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        commonText(
                          text:
                              'Hi, ${currUser?.data?.firstName ?? ''} ${currUser?.data?.lastName ?? ''}',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        commonText(
                          text:
                              'Member Since, ${DateFormat('dd/MM/yyyy').format(DateTime.parse((currUser?.data?.createdAt ?? '0000-00-00').toString()))}',
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    IgnorePointer(
                      ignoring: true,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 13),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  commonText(
                                    text: 'First Name',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  TextFormField(
                                    controller: _firstName,
                                    cursorColor: kOrange,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    decoration: const InputDecoration(
                                      isDense: true,
                                      border: InputBorder.none,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  commonText(
                                    text: 'Last Name',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  TextFormField(
                                    controller: _lastName,
                                    cursorColor: kOrange,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    decoration: const InputDecoration(
                                      isDense: true,
                                      border: InputBorder.none,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: InkWell(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime.now(),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: const ColorScheme.light(
                                          primary: kOrange,
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                          style: TextButton.styleFrom(
                                            foregroundColor:
                                                Colors.red, // button text color
                                          ),
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  print(
                                      formattedDate); //formatted date output using intl package =>  2021-03-16
                                  setState(() {
                                    _birthdate.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {}
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 13),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    commonText(
                                      text: 'Birthdate',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    TextFormField(
                                      readOnly: true,
                                      controller: _birthdate,
                                      cursorColor: kOrange,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                      decoration: const InputDecoration(
                                        isDense: true,
                                        border: InputBorder.none,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Obx(() {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 13,
                                vertical: 5,
                              ),
                              child: DropdownButton(
                                value: dropdownvalue.value,
                                underline: const SizedBox(),
                                isExpanded: true,
                                borderRadius: BorderRadius.circular(6),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: commonText(
                                      text: items,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  dropdownvalue.value = newValue!;
                                },
                              ),
                            );
                          }),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Divider(
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        commonText(
                                          text: 'Email',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                        TextFormField(
                                          cursorColor: kOrange,
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                          ),
                                          controller: _email,
                                          readOnly: true,
                                          decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              isDense: true),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.black.withOpacity(0.2),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                          Column(children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      commonText(
                                        text: 'Phone Number',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                      TextFormField(
                                        cursorColor: kOrange,
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                        controller: _phoneNumber,
                                        readOnly: true,
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          isDense: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Divider(
                            //   color: Colors.black.withOpacity(0.2),
                            // ),
                            // const SizedBox(
                            //   height: 8,
                            // ),
                          ]),
                          // Column(
                          //   children: [
                          //     Row(
                          //       children: [
                          //         Expanded(
                          //           child: Column(
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             children: [
                          //               commonText(
                          //                 text: 'Describe Yourself',
                          //                 fontSize: 14,
                          //                 fontWeight: FontWeight.w500,
                          //                 color: Colors.black,
                          //               ),
                          //               TextFormField(
                          //                 cursorColor: kOrange,
                          //                 style: TextStyle(
                          //                   fontSize: 13,
                          //                   fontWeight: FontWeight.w400,
                          //                   color:
                          //                       Colors.black.withOpacity(0.5),
                          //                 ),
                          //                 controller: _emergencyContect,
                          //                 readOnly: true,
                          //                 decoration: const InputDecoration(
                          //                     border: InputBorder.none,
                          //                     isDense: true),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //     Divider(
                          //       color: Colors.black.withOpacity(0.2),
                          //     ),
                          //     const SizedBox(
                          //       height: 8,
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
