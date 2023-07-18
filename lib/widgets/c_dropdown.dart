import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'ctext.dart';

Widget cDropDown({
  String? hintText,
  required List<String> items,
  Function(int?)? onChanged,
  double? itemHeight,
  String? label,
  int? value,
  double? height,
  double? heightPadding,
  double? width,
  Color? borderColor,
  double? borderRadius,
  Color? fillColor,
  Color? hintTextColor,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      label != null ? ctext(label) : const SizedBox(),
      SizedBox(
        height: label != null ? 8 : 0,
      ),
      SizedBox(
        width: width,
        height: height,
        child: DropdownButtonFormField2(
            barrierColor: Colors.black54,
            // dropdownStyleData: DropdownStyleData(),
            // dropdownOverButton: false,
            // dropdownDecoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(12),
            // ),
            value: value,
            isDense: true,
            menuItemStyleData: MenuItemStyleData(
              height: itemHeight ?? 26,
            ),
            isExpanded: true,
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(
                    top: heightPadding ?? 6,
                    bottom: heightPadding ?? 6,
                    right: 6,
                    left: 0),
                fillColor: fillColor ?? Colors.white,
                filled: true,
                hintText: hintText ?? "",
                hintStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: hintTextColor ?? Colors.black),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(borderRadius ?? 10),
                    borderSide:
                        BorderSide(color: borderColor ?? Colors.black))),
            items: List.generate(
                items.length,
                (index) => DropdownMenuItem(
                      value: index,
                      child: ctext(items[index],
                          minFontSize: 10, color: Colors.black, maxLines: 100),
                    )),
            onChanged: onChanged ?? (value) {}),
      ),
    ],
  );
}
