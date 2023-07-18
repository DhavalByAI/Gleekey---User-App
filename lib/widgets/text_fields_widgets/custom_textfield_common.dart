import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/style/constants.dart';
import '../../utils/style/palette.dart';

bool obSecure = false;

class CustomTextfieldCommon extends StatefulWidget {
  final TextEditingController controller;
  final String? label, hint;
  String? errorText;
  TextInputType? textInputType = TextInputType.text;
  bool? obscureText;
  Function validate;
  Function()? onTap;
  bool? isBorder;
  List<TextInputFormatter>? textInputFormatter;
  bool? btnValidate = false;

  CustomTextfieldCommon(
      {super.key,
      required this.controller,
      this.label,
      this.hint,
      this.textInputType,
      this.errorText,
      this.obscureText = false,
      required this.validate,
      this.onTap,
      this.textInputFormatter,
      this.isBorder = true,
      this.btnValidate});

  @override
  State<CustomTextfieldCommon> createState() => _CustomTextfieldCommonState();
}

class _CustomTextfieldCommonState extends State<CustomTextfieldCommon> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        if (widget.btnValidate == null) {
          null;
        } else {
          widget.btnValidate! ? widget.validate() : null;
        }
      },
      onTap: widget.onTap,
      controller: widget.controller,
      keyboardType: widget.textInputType,
      obscureText: obSecure,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: kBlack,
      ),
      inputFormatters: widget.textInputFormatter,
      decoration: InputDecoration(
          errorText: widget.errorText,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(
                  width: 1,
                  color: widget.isBorder! ? kBlack : Colors.transparent)),
          // disabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(6.0),
          //     borderSide: BorderSide(
          //         width: 1,
          //         color: widget.isBorder! ? kBlack : Colors.transparent)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(
                  width: 1,
                  color: widget.isBorder! ? kBlack : Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6.0),
              borderSide: BorderSide(
                  width: 1,
                  color: widget.isBorder! ? kBlack : Colors.transparent)),
          contentPadding: const EdgeInsets.all(13.0),
          suffixIcon: widget.obscureText!
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      obSecure = !obSecure;
                    });
                  },
                  child: Icon(
                    obSecure ? Icons.visibility : Icons.visibility_off,
                    color: kDarkGrey,
                  ),
                )
              : null,
          labelText: widget.label,
          labelStyle: Palette.labelStyle,
          hintText: widget.hint,
          hintStyle: Palette.hintStyle),
    );
  }
}
