import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WidgetPage extends StatelessWidget {
  final TapGestureRecognizer _tapRecognizer = TapGestureRecognizer();

  WidgetPage() : super(key: null);

  @override
  Widget build(BuildContext context) {
    _tapRecognizer.onTap = _openHiperLink;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Widgets'),
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
      ),
      body: _body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'Widgets',
        icon: const Icon(Icons.arrow_back_ios),
        label: const Text('Back'),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  /// This method returns a ListView with all the widgets
  Widget _body() {
    return Tooltip(
      showDuration: const Duration(seconds: 3),
      triggerMode: TooltipTriggerMode.longPress,
      richMessage: WidgetSpan(
        child: RichText(
          text: TextSpan(
            text: 'This is a Hyperlink',
            recognizer: _tapRecognizer,
            style: const TextStyle(
              color: Colors.lightBlueAccent,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Text('Long press me'),
      ),
    );
  }

  /// This method opens a hyperlink in the application
  void _openHiperLink() {
    launchUrlString("https://www.google.com", mode: LaunchMode.inAppBrowserView);
  }
}
