import 'package:flutter/material.dart';
import 'package:flutter_read_json/pages/barcode.dart';
import 'package:flutter_read_json/pages/bluetooth_permission.dart';
import 'package:flutter_read_json/pages/checkbox_list.dart';
import 'package:flutter_read_json/pages/crud_sqlite.dart';
import 'package:flutter_read_json/pages/read_json.dart';
import 'package:flutter_read_json/utils/cabecalho.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nobody yes door',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Homee!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homee!'),
      ),
      body: getConteudo(),
    );
  }

  /// Get conteudo tela
  Widget getConteudo(){
    return ListView.builder(
      itemCount: Cabecalho().experimentos.length,
      itemBuilder: (context, index) => card(index)
    );
  }

  Widget card(int index){
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              Cabecalho().experimentos[index]['nome'],
              style: const TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            )
          ),
        ),
        onTap: () => navegaExperimentos(index),
      ),
    );
  }

  void navegaExperimentos(int index){
    switch (Cabecalho().experimentos[index]['id']) {
      case '1':
        Navigator.push(context, MaterialPageRoute(builder:(context) => const ReadJsonPage()));
        break;
      case '2':
        Navigator.push(context, MaterialPageRoute(builder:(context) => const CRUDSQLitePage()));
        break;
      case '3':
        Navigator.push(context, MaterialPageRoute(builder:(context) => const CheckBoxListPage()));
        break;
      case '4':
        Navigator.push(context, MaterialPageRoute(builder:(context) => const BarcodePage()));
        break;
      case '5':
        Navigator.push(context, MaterialPageRoute(builder:(context) => const BluetoothPermissionPage()));
        break;
      default:
    }
  }
}
