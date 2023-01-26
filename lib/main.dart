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
      darkTheme: ThemeData.dark(),
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
        onPressed: getUrl,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  /// Lê o arquivo json
  Future<String> testeJson() async {
    //final configFile = File('data/flutter_assets/lib/assets/config.json');
    final configFile = File('lib/assets/config.json');
    final jsonString = await configFile.readAsString();
    final dynamic jsonMap = jsonDecode(jsonString);
    if(jsonMap['teste'] == true){
      setState(() {
        //test = 'MUNDIAL';
        test = jsonMap['ultimo_teste'];
        //saveDocument();
      }); 
    }else{
      setState(() {
        test = 'O NECESSARIO PARA UM MUNDIAL';
      });
    }
    return jsonMap['teste_string'];
  }

  /// Salva o documento no caminho indicado
  void saveDocument() async{
    dynamic unit = base64.decode(Pdf().pdf);
    int rand = Random().nextInt(999);
    final file = File('temp/example$rand.pdf');
    await file.writeAsBytes(unit.buffer.asUint8List());    
  }

  /// transforma Future<String> em String
  String getUrl(){
    testeJson().then((value) => setState((){
      test = value;
    }));
    return test;
  } 
}
