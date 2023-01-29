import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/pdf.dart';

class ReadJsonPage extends StatefulWidget {
  const ReadJsonPage({super.key});

  @override
  State<ReadJsonPage> createState() => _ReadJsonPageState();
}

class _ReadJsonPageState extends State<ReadJsonPage> {
  String test = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const  Text('Read Json :D'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              test,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getUrl,
        child: const Icon(Icons.auto_awesome),
      ),
    );
  }

  /// Lê o arquivo json
  Future<String> testeJson() async {
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
