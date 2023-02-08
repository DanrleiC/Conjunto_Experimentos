import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class BluetoothPermissionPage extends StatefulWidget {
  const BluetoothPermissionPage({super.key});

  @override
  State<BluetoothPermissionPage> createState() => _BluetoothPermissionPageState();
}

class _BluetoothPermissionPageState extends State<BluetoothPermissionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => pedePermission(),
      ),
    );
  }

  void pedePermission() async{
      await Permission.bluetoothConnect.request();
  }

}