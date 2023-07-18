import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'paymentMethod_view.dart';

class PaymentMethodController extends GetxController {
  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardDateController = TextEditingController();
  TextEditingController cardCvvController = TextEditingController();

  List<PaymentCards> allCardTile = [
    PaymentCards(
      imgUrl: "assets/images/google-pay.png",
      title: "Google Pay",
    ),
    PaymentCards(
      imgUrl: "assets/images/phonepe_icon.png",
      title: "Phone pay",
    ),
    PaymentCards(
      imgUrl: "assets/images/cash.png",
      title: "Cash",
    ),
  ];

  String? nameError;
  String? numberError;
  String? dateError;
  String? cvvError;
  bool isValidated = false;
  int currSelectedMethod = 0;
  int totalCards = 0;
  int totalUpi = 2;
  int totalOthers = 1;
  addCard() {
    cardDateController.addListener(() {
      var text = cardDateController.text;
      if (text.endsWith('/')) {
      } else {
        if (text.length == 3) {
          cardDateController.text =
              "${text.substring(0, 2)}/${text.substring(2, 3)}";
          cardDateController.selection =
              TextSelection.collapsed(offset: cardDateController.text.length);
        }
      }
    });
    cardNumberController.addListener(() {
      var text = cardNumberController.text;
      if (text.endsWith(' ')) {
      } else {
        if (text.length == 5 || text.length == 11 || text.length == 17) {
          cardNumberController.text = text.length == 5
              ? "${text.substring(0, 4)}  ${text.substring(text.length - 1)}"
              : text.length == 11
                  ? "${text.substring(0, 10)}  ${text.substring(text.length - 1)}"
                  : "${text.substring(0, 16)}  ${text.substring(text.length - 1)}";
          cardNumberController.selection =
              TextSelection.collapsed(offset: cardNumberController.text.length);
        }
      }
    });
    update();
  }

  validate() {
    numberError = numberValidator();
    dateError = dateValidator();
    cvvError = cvvValidator();
    isValidated = true;
    update();
  }

  String? nameValidator() {
    if (cardNameController.text.isEmpty) {
      return "Card Holder Name is Empty";
    } else {
      return null;
    }
  }

  String? numberValidator() {
    if (cardNumberController.text.isEmpty) {
      return "Enter Correct Card Number";
    } else {
      return null;
    }
  }

  String? dateValidator() {
    print(cardDateController.text.length.toString());
    if (cardDateController.text.isEmpty ||
        cardDateController.text.length != 5 ||
        int.parse(cardDateController.text.substring(3)) < 23) {
      return "Wrong Exipry date";
    } else {
      return null;
    }
  }

  String? cvvValidator() {
    if (cardCvvController.text.isEmpty || cardCvvController.text.length != 3) {
      return "Wrong CVV";
    } else {
      return null;
    }
  }
}
