import 'package:flutter/material.dart';
import '../persons/narrow/narrow_layout.dart';
import '../persons/wide/wide_layout.dart';

class WebPage extends StatefulWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 4'),
      ),
      body: LayoutBuilder(
          builder: (context, constraints) {
            return constraints.maxWidth < 720
                ? NarrowLayout()
                : WideLayout();
          }
      ),
    );
  }
}