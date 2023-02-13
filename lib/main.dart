import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data.provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: DataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Page1.routeName,
        routes: {
          Page1.routeName: (context) => const Page1(),
          Page2.routeName: (context) => const Page2(),
        },
      ),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({super.key});
  static const routeName = '/page1';

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  String text = 'Page1';

  @override
  Widget build(BuildContext context) {
    var textProvider = Provider.of<DataProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(title: const Text('Page1')),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(textProvider.getText() == '' ? text : textProvider.getText()),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(Page2.routeName)
                    .whenComplete(() => setState(() {}));
              },
              child: const Text('Go To Page2'),
            ),
            ElevatedButton(
              onPressed: () {
                textProvider.setText('Provider Set From 1');
              },
              child: const Text('Set Provider 1'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});
  static const routeName = '/page2';

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  String text = 'Page2';

  @override
  Widget build(BuildContext context) {
    var textProvider = Provider.of<DataProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(title: const Text('Page2')),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(textProvider.getText() == '' ? text : textProvider.getText()),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Go To Page1'),
            ),
            ElevatedButton(
              onPressed: () {
                textProvider.setText('Provider Set From 2');
              },
              child: const Text('Set Provider 2'),
            ),
          ],
        ),
      ),
    );
  }
}
