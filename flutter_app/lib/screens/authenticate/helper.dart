import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:html/parser.dart';

class Helper {
  Client _client;
  Helper() {
    this._client = Client();
  }

  void checkCreds(String pictid, String Password) async {
    final uname = [];
    String url = 'https://pict.ethdigitalcampus.com/DCWeb/authenticate.do?loginid='+pictid+'&password='+Password+'&dbConnVar=PICT&service_id=';
    print(url);
    final response = await _client.get(url);
    final document = parse(response.body);
    final username = document.getElementsByTagName('marquee');
    final doc2 = parse(username);
    final tag = doc2.getElementsByTagName('b');
    print(tag);
    uname.add(tag);
    print(uname.runtimeType);
  }


}