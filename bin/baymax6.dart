import 'dart:collection';
import 'dart:convert';
import 'dart:io';

//import 'package:baymax6/baymax6.dart' as baymax6;

// retrieves a list of toys
void getToyList() async {
  var client = HttpClient();

  try {
    Map<String, String> headers = HashMap();
    headers.putIfAbsent('Accept', () => 'application/json');

    HttpClientRequest req = await client.getUrl(Uri.parse('https://2nif3zuj43.execute-api.us-east-2.amazonaws.com/default/toys1'));
    HttpClientResponse response = await req.close();
    // Process the response
    final stringData = await response.transform(utf8.decoder).join();
    print(stringData);
  }
  on Exception catch (ex) {
    print('oops: $ex');
  }
  finally {
    client.close();
  }
}

// run the specific business command
void executeCommand(String command) async {
  switch (command) {
    case 'G':
      print('not implemented yet');
      break;
    case 'L':
      getToyList();
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
  //print('it was: $cmd');
  return cmd.toUpperCase();
}

// application starts here
void main(List<String> arguments) async {
  print('----------------------------------------');
  print('Running Baymax6 on ${Platform.operatingSystem} ${Platform.operatingSystemVersion}');

  var cmd = '';

  while( cmd != 'Q' ) {
    executeCommand(cmd);
    cmd = readCommand();
  }

  print('Exiting!');
}
