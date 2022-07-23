import 'dart:convert';
import 'dart:io';

//import 'package:baymax6/baymax6.dart' as baymax6;

// run the specific business command
void executeCommand(String command) {
  switch (command) {
    case 'G':
      print('not implemented yet');
      break;
    case 'L':
      print('not implemented yet');
      break;
  }
}

//
String readCommand() {
  print('Enter command [G / L / Q]: ');
  var charCode = stdin.readByteSync();
  //print('it was: $charCode');

  var x = AsciiDecoder();
  var cmd = x.convert([charCode]);
  print('it was: $cmd');
  return cmd.toUpperCase();
}

// application starts here
void main(List<String> arguments) {
  print('----------------------------------------');
  print('Running Baymax6 on ${Platform.operatingSystem} ${Platform.operatingSystemVersion}');

  var cmd = '';

  while( cmd != 'Q' ) {
    executeCommand(cmd);
    cmd = readCommand();
  }

  print('All done!');
}
