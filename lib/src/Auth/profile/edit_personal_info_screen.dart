import 'dart:io';
// import 'package:dio/dio.dart' as dio;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/extras/commonWidget.dart';
import 'package:gleekey_user/src/SubPages/appBarWithTitleAndBack.dart';
import 'package:gleekey_user/utils/baseconstant.dart';
import 'package:gleekey_user/utils/style/constants.dart';
import 'package:gleekey_user/widgets/commonText.dart';
import 'package:gleekey_user/widgets/loder.dart';
import 'package:gleekey_user/widgets/showSnackBar.dart';
import 'package:http/http.dart' as http;
// import 'package:gleeky_flutter/API/api_config.dart';
// import 'package:gleeky_flutter/src/Auth/controller/userLogin_controller.dart';
// import 'package:gleeky_flutter/src/host/dash_board/controller/getUserController.dart';
// import 'package:gleeky_flutter/src/host/setting/controller/edit_personal_info_Controller.dart';
// import 'package:gleeky_flutter/utills/app_colors.dart';
// import 'package:gleeky_flutter/utills/commonWidget.dart';
// import 'package:gleeky_flutter/utills/loder.dart';
// import 'package:gleeky_flutter/utills/snackBar.dart';
// import 'package:gleeky_flutter/utills/text_styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditPersonalInfoScreen extends StatefulWidget {
  const EditPersonalInfoScreen({Key? key}) : super(key: key);

  @override
  State<EditPersonalInfoScreen> createState() => _EditPersonalInfoScreenState();
}

class _EditPersonalInfoScreenState extends State<EditPersonalInfoScreen> {
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
    _firstName.text = currUser?.data?.firstName ?? "";
    _lastName.text = currUser?.data?.lastName ?? "";
    _email.text = currUser?.data?.email ?? "";
    _phoneNumber.text =
        currUser?.data?.formattedPhone ?? currUser?.data?.phone ?? '';
    // dropdownvalue.value = currUser?.userDetails?.gender ?? "Gender";
    // _birthdate.text = (currUser?.userDetails?.dateOfBirth ?? '').toString();
    // // _governmentID.text = 'Adhar Card';
    // _emergencyContect.text = currUser?.userDetails?.about ?? "";
    super.initState();
  }

  RxString imgPath = ''.obs;
  Future pickImg() async {
    try {
      final XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        imgPath.value = pickedFile.path;
      }
    } catch (e) {
      // showSnackBar(title: ApiConfig.error, message: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithTitleAndBack(title: "Edit Personal Info"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 17),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Obx(() {
                return Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: imgPath.value != ''
                                ? kIsWeb
                                    ? Image.memory(
                                        File(imgPath.value).readAsBytesSync(),
                                        fit: BoxFit.scaleDown,
                                      )
                                    : Image.file(
                                        File(imgPath.value),
                                        fit: BoxFit.cover,
                                      )
                                : Center(
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
                                                backgroundColor: kLightGrey,
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
                        ),
                        // CircleAvatar(
                        //   minRadius: 50,
                        //   backgroundImage: AssetImage(AppImages.homeImg),
                        // ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              pickImg();
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 10,
                                    spreadRadius: 2,
                                  ),
                                ],
                              ),
                              child: const Icon(Icons.camera_alt_outlined,
                                  color: Colors.black, size: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: SingleChildScrollView(
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
                          padding: const EdgeInsets.symmetric(horizontal: 13),
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
                          padding: const EdgeInsets.symmetric(horizontal: 13),
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
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
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
                            padding: const EdgeInsets.symmetric(horizontal: 13),
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
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2000, 01, 01),
                                      //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime.now(),
                                      builder: (context, child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme:
                                                const ColorScheme.light(
                                              primary: kOrange,
                                            ),
                                            textButtonTheme:
                                                TextButtonThemeData(
                                              style: TextButton.styleFrom(
                                                foregroundColor:
                                                    kOrange, // button text color
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
                                          DateFormat('dd-MM-yyyy')
                                              .format(pickedDate);
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2021-03-16
                                      setState(() {
                                        _birthdate.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {}
                                  },
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
                              horizontal: 13, vertical: 5),
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
                      Column(children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    controller: _email,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      isDense: true,
                                    ),
                                    validator: (val) {
                                      if (_email.text.isEmpty ||
                                          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                              .hasMatch(_email.text)) {
                                        return "Enter Correct Email Address";
                                      } else {
                                        return null;
                                      }
                                    },
                                    autovalidateMode: AutovalidateMode.always,
                                  ),
                                ],
                              ),
                            ),
                            // isEditable.value
                            //     ? IconButton(
                            //         onPressed: () {
                            //           isEditable.value = false;
                            //         },
                            //         splashColor: Colors.transparent,
                            //         icon: const Icon(
                            //           Icons.close,
                            //           size: 20,
                            //         ))
                            //     : InkWell(
                            //         onTap: () {
                            //           isEditable.value = true;
                            //         },
                            //         splashColor: Colors.transparent,
                            //         highlightColor: Colors.transparent,
                            //         child: Container(
                            //           decoration: BoxDecoration(
                            //               border: Border.all(
                            //                   color: Colors.black),
                            //               borderRadius:
                            //                   BorderRadius.circular(6)),
                            //           padding: const EdgeInsets.symmetric(
                            //               vertical: 5, horizontal: 12),
                            //           child: const Text('Edit'),
                            //         ),
                            //       )
                          ],
                        ),
                        Divider(
                          color: Colors.black.withOpacity(0.2),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ]),
                      Column(children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    keyboardType: TextInputType.phone,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      isDense: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // isEditable.value
                            //     ? IconButton(
                            //         onPressed: () {
                            //           isEditable.value = false;
                            //         },
                            //         splashColor: Colors.transparent,
                            //         icon: const Icon(
                            //           Icons.close,
                            //           size: 20,
                            //         ))
                            //     : InkWell(
                            //         onTap: () {
                            //           isEditable.value = true;
                            //         },
                            //         splashColor: Colors.transparent,
                            //         highlightColor: Colors.transparent,
                            //         child: Container(
                            //           decoration: BoxDecoration(
                            //               border: Border.all(
                            //                   color: Colors.black),
                            //               borderRadius:
                            //                   BorderRadius.circular(6)),
                            //           padding: const EdgeInsets.symmetric(
                            //               vertical: 5, horizontal: 12),
                            //           child: const Text('Edit'),
                            //         ),
                            //       )
                          ],
                        ),
                        // Divider(
                        //   color: Colors.black.withOpacity(0.2),
                        // ),
                        // const SizedBox(
                        //   height: 8,
                        // ),
                      ]),
                      // Column(children: [
                      //   Row(
                      //     children: [
                      //       Expanded(
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text('Describe Yourself',
                      //                 style: color00000s14w500),
                      //             TextFormField(
                      //               cursorColor: kOrange,
                      //               style: color50perBlacks13w400,
                      //               controller: _emergencyContect,
                      //               decoration: const InputDecoration(
                      //                   border: InputBorder.none,
                      //                   isDense: true),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       // isEditable.value
                      //       //     ? IconButton(
                      //       //         onPressed: () {
                      //       //           isEditable.value = false;
                      //       //         },
                      //       //         splashColor: Colors.transparent,
                      //       //         icon: const Icon(
                      //       //           Icons.close,
                      //       //           size: 20,
                      //       //         ))
                      //       //     : InkWell(
                      //       //         onTap: () {
                      //       //           isEditable.value = true;
                      //       //         },
                      //       //         splashColor: Colors.transparent,
                      //       //         highlightColor: Colors.transparent,
                      //       //         child: Container(
                      //       //           decoration: BoxDecoration(
                      //       //               border: Border.all(
                      //       //                   color: Colors.black),
                      //       //               borderRadius:
                      //       //                   BorderRadius.circular(6)),
                      //       //           padding: const EdgeInsets.symmetric(
                      //       //               vertical: 5, horizontal: 12),
                      //       //           child: const Text('Edit'),
                      //       //         ),
                      //       //       )
                      //     ],
                      //   ),
                      //   Divider(
                      //     color: Colors.black.withOpacity(0.2),
                      //   ),
                      //   const SizedBox(
                      //     height: 8,
                      //   ),
                      // ]),

                      CommonButton(
                          onPressed: () async {
                            // isEditable.value = false;
                            loaderShow(context);
                            // EditPersonalInfoController.to.editPersonalInfoAPI(
                            //   params: imgPath.value == ''
                            //       ? {
                            //           'first_name': _firstName.text,
                            //           'last_name': _lastName.text,
                            //           'email': _email.text,
                            //           'phone': _phoneNumber.text,
                            //           "date_of_birth": _birthdate.text,
                            //           "details[about]": _emergencyContect.text,
                            //         }
                            //       : {
                            //           'first_name': _firstName.text,
                            //           'last_name': _lastName.text,
                            //           'email': _email.text,
                            //           'phone': _phoneNumber.text,
                            //           "photos[]": [
                            //             await http.MultipartFile.fromPath(
                            //                 "", imgPath.value,
                            //                 filename: imgPath.value),
                            //           ],
                            //           "date_of_birth": _birthdate.text,
                            //           "details[about]": _emergencyContect.text,
                            //         },
                            //   isFormData: true,
                            //   error: (e) {
                            //     loaderHide();
                            //     // showSnackBar(
                            //     //   title: ApiConfig.error,
                            //     //   message: e.toString(),
                            //     // );
                            //   },
                            //   success: () {
                            //     loaderHide();
                            //     Get.back();
                            //     Get.back();
                            //     // showSnackBar(
                            //     //     title: ApiConfig.success,
                            //     //     message: 'Profile Updated Successfully..');
                            //     // GetUserController.to.getUserApi();
                            //   },
                            // );
                          },
                          name: 'Save'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
