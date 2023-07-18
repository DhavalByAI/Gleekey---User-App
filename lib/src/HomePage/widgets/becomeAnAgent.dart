import 'package:flutter/material.dart';
import 'package:gleekey_user/utils/baseconstant.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BecomeAnAgentWebView extends StatelessWidget {
  const BecomeAnAgentWebView({super.key});

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url
                .startsWith('https://gleekey.in/become-an-agent')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://gleekey.in/become-an-agent'));
    // controller.runJavaScript(AutofillHints.email);

    return Scaffold(
        floatingActionButton: InkWell(
          onTap: () {
            controller.runJavaScript(
                "document.querySelectorAll('.navigation').forEach((element) => element.style.display = 'none');");
            controller.runJavaScript(
                "document.querySelector('.sticky_section.mob').style.display = 'none';");
            controller.runJavaScript(
                "document.getElementsByName('email')[0].value = '${currUser!.data!.email}';");
            controller.runJavaScript(
                "document.getElementsByName('password')[0].value = '123456';");
            Future.delayed(const Duration(seconds: 1), () {
              controller.runJavaScript(
                  "document.querySelector('input[type=submit][value=\"Login\"]').click();");
            });
            Future.delayed(const Duration(seconds: 2), () {
              controller.reload();
            });
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Container(
              height: 40,
              width: 40,
              color: Colors.blue,
              child: const Text("data"),
            ),
          ),
        ),
        body: WebViewWidget(controller: controller));
  }
}
