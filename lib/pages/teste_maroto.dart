import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class Gasparnoix extends StatelessWidget {
  const Gasparnoix({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final GlobalKey genKey = GlobalKey();

  Future takePicture() async {
    RenderRepaintBoundary boundary = genKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List? pngBytes = byteData?.buffer.asUint8List();
    File imgFile = File('$directory/photo.png');
    return await imgFile.writeAsBytes(pngBytes!);
  }

  dynamic _incrementCounter() {
    dynamic test;
    takePicture().then((value) => test = value);
    return test;
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: genKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await takePicture();
                  },
                  child: const Text(
                    "Take Picture",
                  ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed:() {
            _incrementCounter();
            
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}