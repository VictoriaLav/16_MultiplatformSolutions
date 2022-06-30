import 'package:flutter/material.dart';
import '../app_platform.dart';
import 'package:url_launcher/url_launcher.dart';
import '../webview.dart'
if (dart.library.io) '../non_web_webview.dart'
if (dart.library.html) '../web_webview.dart';

class WebPage extends StatefulWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  TextEditingController _controllerTextField = TextEditingController();
  final styleBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(0.0),
    borderSide: BorderSide(
      width: 1.0,
    ),
  );
  late Widget _webViewWidget;
  bool isLoad = false;

  Future<void> loadWebUri() async {
    setState(() {
      isLoad = true;
    });
  }

  Future<void> openUri() async {
    if (isLoad) {
      setState(() {
        _webViewWidget = const Text('');
        isLoad = false;
        if (!AppPlatform.isMobile && AppPlatform.platform != CustomPlatform.web) {
          _launchUrl(_controllerTextField.text);
          _webViewWidget = const Text('');
        } else {
          _webViewWidget = webView(_controllerTextField.text);
        }
      });
    }
  }

  void _launchUrl(String link) async {
    if (!await launchUrl(Uri.parse(link))) throw 'Could not launch $link';
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _controllerTextField.text = 'https://flutter.dev/';
      _webViewWidget = const Text('');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Задание 3'),
      ),
      body: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _controllerTextField,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Введите имя файла',
                      focusedBorder: styleBorder,
                      enabledBorder: styleBorder,
                      // labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                  EdgeInsets.only(top: 10.0, right: 10.0, bottom: 10.0),
                  child: Container(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: loadWebUri,
                      child: Text('LOAD'),
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            'APPLICATION RUNNING ON ${AppPlatform.operatingSystem.toUpperCase()}',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          Expanded(
            child: FutureBuilder(
              future: openUri(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.active:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.done:
                    return _webViewWidget;
                  default:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}