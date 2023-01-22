import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_read_json/components/pdf.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String test = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'PALMEIRAS NÃO TEM ',
            ),
            Text(
              test,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: testeJson,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> testeJson() async {
    final configFile = File('data/flutter_assets/lib/assets/config.json');
    final jsonString = await configFile.readAsString();
    final dynamic jsonMap = jsonDecode(jsonString);

    if(jsonMap['teste'] == true){
      setState(() {
        test = 'MUNDIAL';
        saveDocument();
      }); 
    }
  }

  void saveDocument() async{
    
    dynamic unit = base64.decode(Pdf().pdf);
    int rand = Random().nextInt(999);
    final file = File('temp/example$rand.pdf');
    await file.writeAsBytes(unit.buffer.asUint8List());    
  }
}
