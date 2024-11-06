import 'package:flutter/material.dart';
import 'package:link_preview_generator/link_preview_generator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Link Preview Generator Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List of links to preview.
  List<String> get urls => const [
        'https://github.com/ghpranav/link_preview_generator',
      ];

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Link Preview Generator'),
      ),
      body: Column(
        children: [
          LinkPreviewGenerator(
              link: urls[0], linkPreviewStyle: LinkPreviewStyle.large),
          SizedBox(
            height: 20,
          ),
            TextField(
            decoration: InputDecoration(
              hintText: 'Paste a link here',
              border: OutlineInputBorder(),
            ),
            controller: controller,
            onSubmitted: (value) {
              showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                content: LinkPreviewGenerator(
                  link: controller.text,
                  linkPreviewStyle: LinkPreviewStyle.large,
                ),
                actions: [
                  TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                  ),
                ],
                );
              },
              );
            },
            ),
        ],
      ),
    );
  }
}
