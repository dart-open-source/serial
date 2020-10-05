import 'dart:io';
import 'dart:typed_data';
import 'package:convert/convert.dart';

import 'package:dart_serial_port/dart_serial_port.dart';

Future<void> main() async {

  final port = SerialPort('/dev/cu.MindLink-MindLink');

  print('config: ${port.config}');
  print('\tDescription: ${port.description}');
  print('\tManufacturer: ${port.manufacturer}');
  print('\tSerial Number: ${port.serialNumber}');
  print('\tProduct ID: 0x${port.productId.toRadixString(16)}');
  print('\tVendor ID: 0x${port.vendorId.toRadixString(16)}');

  try{
    print('openRead');
    if (!port.openRead()) {
      print(SerialPort.lastError);
      exit(-1);
    }
    print('openRead.done');
    // port.write(Uint8List.fromList([0]));

    print('openRead.start');
    final reader = SerialPortReader(port,timeout: 10000);
    reader.stream.listen((data) {
      var hstr=hex.encode(data);
      print(hstr.toUpperCase());
    });
  }catch(e){
    print('error: $e');
  }

  // port.dispose();

}
