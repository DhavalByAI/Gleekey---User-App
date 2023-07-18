import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:gleekey_user/widgets/ctext.dart';

class CommingSoon extends StatelessWidget {
  const CommingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Stack(
          children: [
            Positioned(
                right: 5,
                top: 22,
                child: Bounce(
                  duration: const Duration(milliseconds: 150),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.cancel_outlined,
                    color: Colors.black,
                    size: 28,
                  ),
                )),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ctext('Coming Soon',
                      fontSize: 32, fontWeight: FontWeight.w700),
                  Image.asset('assets/images/coming-soon-bg.png'),
                  const SizedBox(
                    height: 22,
                  ),
                  ctext(
                      'We\'re coming soon! We\'re working hard to give you the best experience.',
                      textAlign: TextAlign.center)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
