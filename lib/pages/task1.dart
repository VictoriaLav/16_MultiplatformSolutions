import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../app_platform.dart';
import 'package:html/parser.dart' show parse;

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
  late http.Response response;
  bool isLoad = false;
  Map<String, String> htmlData = {'headHtml': '', 'headCORS': '', 'headBody': ''};


  Future<void> loadHtmlPage() async {
    response = await http.get(Uri.parse(_controllerTextField.text));
    setState(() {
      isLoad = true;
    });
  }

  Future<void> fetchFileFromUri() async {
    if (isLoad) {
      try {
        var document = parse(response.body);
        htmlData['htmlBody'] = document.outerHtml;
        htmlData['htmlCORS'] = 'CORS Header: None';
        htmlData['htmlHead'] = document.getElementsByTagName('title')[0].nodes[0].text!;
      } catch (e) {
        htmlData['htmlBody'] = 'Error!';
        htmlData['htmlCORS'] = '';
        htmlData['htmlHead'] = '';
      }

      setState(() {
        isLoad = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _controllerTextField.text = 'https://google.com';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Задание 1 (Chrome)'),
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
                      onPressed: loadHtmlPage,
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
          Expanded(
            child: SingleChildScrollView(
              child: FutureBuilder(
                future: fetchFileFromUri(),
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
                      return Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              htmlData['htmlHead'] ?? '',
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              htmlData['htmlCORS'] ?? '',
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            htmlData['htmlBody'] ?? '',
                          ),
                        ],
                      );
                    default:
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}