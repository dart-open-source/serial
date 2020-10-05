# Serial Port for Dart

`dart_serial_port` is based on [`libserialport`](https://sigrok.org/wiki/Libserialport),
which is a minimal C-library created by the [sigrok](https://sigrok.org/) project, and
released under the LGPL3+ license. 

Supported platforms:
- Linux
- macOS
- Windows
- Android

`dart_serial_port` uses [dart:ffi](https://dart.dev/guides/libraries/c-interop) to call
`libserialport`'s C APIs, which implies that `libserialport` must be bundled to or deployed
with the host application. It can be tedious to build and deploy `libserialport` on all target
platforms, but in case you are building a Flutter app instead of a pure Dart app, there is
a ready-made drop-in solution called [`flutter_serial_port`](https://github.com/jpnurmi/flutter_serial_port)
that utilizes Flutter's build system to build and deploy `libserialport` on all supported platforms:

## Usage

```dart
import 'package:dart_serial_port/dart_serial_port.dart';

final name = SerialPort.availablePorts.first;
final port = SerialPort(name);
if (!port.openReadWrite()) {
  print(SerialPort.lastError);
  exit(-1);
}

port.write(/* ... */);

final reader = SerialPortReader(port);
reader.stream.listen((data) {
  print('received: $data');
});
```
