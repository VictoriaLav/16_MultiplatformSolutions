import 'package:flutter/material.dart';
import 'pages/task1.dart' as task1;
import 'pages/task2.dart' as task2;
import 'pages/task3.dart' as task3;
import 'pages/task4.dart' as task4;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      // home: const task4.WebPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Задание 1 (Chrome)'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => task1.WebPage()),
              );
            },
          ),
          ListTile(
            title: Text('Задание 2 (Desktop)'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => task2.WebPage()),
              );
            },
          ),
          ListTile(
            title: Text('Задание 3'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => task3.WebPage()),
              );
            },
          ),
          ListTile(
            title: Text('Задание 4'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => task4.WebPage()),
              );
            },
          ),
        ],
      ),

      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
