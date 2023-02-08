import 'dart:io';

import 'package:barcode/barcode.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_read_json/utils/htlm_string.dart';
import 'package:webcontent_converter/webcontent_converter.dart';


class BarcodePage extends StatefulWidget {
  const BarcodePage({super.key});

  @override
  State<BarcodePage> createState() => _BarcodePageState();
}

class _BarcodePageState extends State<BarcodePage> {

  @override
  void initState() {
    toBase64();
    teste();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Toxico!!!'),
      ),
      body: conteudo(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          barcode(            
            Barcode.itf14(),
            '1540014128876',
          );
        },
      ),
    );
  }

  Widget conteudo(){
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.memory(
            Uint8List.fromList(teste()),
            fit: BoxFit.contain,            
          )
        ],
      ),
    );
  }

  dynamic toBase64() async{
    final content = HtmlString().html;
    var bytes = await WebcontentConverter.contentToImage(content: content);
    return bytes;
  }

  dynamic boa;
  dynamic teste(){
    toBase64().then((value) => boa = value);
    return boa;
  }

  void barcode(
    Barcode bc,
    String data, {
    String? filename,
    double? width,
    double? height,
    double? fontHeight,
  }){
    /// Create the Barcode
  final svg = bc.toSvg(
    data,
    width: width ?? 200,
    height: height ?? 80,
    fontHeight: fontHeight,
  );

  // Save the image
  filename ??= bc.name.replaceAll(RegExp(r'\s'), '-').toLowerCase();
  File('lib/assets/$filename.svg').writeAsStringSync(svg);
  }
}