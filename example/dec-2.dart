import 'dart:io';
import 'dart:typed_data';
import 'package:convert/convert.dart';

import 'package:dart_serial_port/dart_serial_port.dart';


Future<void> main() async {

  ///   8   Head
  ///   2    Signal
  ///   6    Delta 6
  ///   6    Theta 6
  ///   6    LowAlpha
  ///   6    HighAlpha
  ///   6    LowBeta
  ///   6    HighBeta
  ///   6    LowGamma
  ///   6    MiddleGamma
  ///   2    -04
  ///   2    Attention
  ///   2    -05
  ///   2    Meditation
  ///   2    checkSum
  ///   68
  ///

  var hstr='AAAA 20020083 18 01C3BC 0057CA 000976 0005F6 0011BE 001B36 0004C0 00075D 040B 0508 E3';
  var hst1='AAAA 20020083 18 22FDC6 1DA7EB 006912 0574B1 023AA2 02D2ED 028D1F 010659 0410 0501 62';


  print(int.parse('18',radix: 16));
  print(int.parse('01C3BC',radix: 16));

  print(hstr.length);


  var rst1='AAAA 0480 02 0050 2D';

  print(00<<8|0x50);
  print(int.parse('0050',radix: 16));

  var rst2='AAAA048002FFEC92';



  print(0xff<<8|0xec);
  print(int.parse('FFEC',radix: 16));

  var rawWaveData=int.parse('FFEC',radix: 16);
  if (rawWaveData > 32768) rawWaveData -= 65536;

  print('rawWaveData:$rawWaveData');

  print(int.parse('8b',radix: 16));
  print(int.parse('aa',radix: 16));
  print(int.parse('aa',radix: 16));
  print(int.parse('04',radix: 16));
  print(int.parse('80',radix: 16));



}
