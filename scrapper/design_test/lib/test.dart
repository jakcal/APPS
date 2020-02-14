import 'package:design_test/scrappers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class test extends StatefulWidget {
  @override
  testState createState() => testState();
}

class testState extends State<test> {
  bool upStreamLoading = false;
  bool upStreamVisible = false;
  bool canClick = true;
  String StreamUrl = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ListTile(
      onTap: () {
        if (canClick) {
          setState(() {
            upStreamVisible = !upStreamVisible;
            upStreamLoading = true;
          });
          scrape();
        }
      },
      title: Text('TEST.Api'),
      subtitle: Text('Fast server'),
      leading: Icon(Icons.info_outline),
      trailing: Visibility(
        visible: upStreamVisible,
        child: upStreamLoading
            ? CircularProgressIndicator()
            : WatchBut(StreamUrl, context),
      ),
    );
  }

  Future<String> scrape() async {
    try {
      var url = 'https://ouo.io/reallygo/V0FQfl';
      var jawResp = await post(url,
          body: {"_token": "PmTwqbV7BUHmxUKQZzUZg2UEQMgwzp52IKERv8LX"},
          headers: {"Referer": "https://ouo.io/go/V0FQfl"});
      var xXx = jawResp.body;

      print(xXx);
      if (xXx != null && jawResp.statusCode == 200) {
        setState(() {
          canClick = false;
          upStreamLoading = false;
          StreamUrl = xXx;
        });
      } else {
        setState(() {
          canClick = false;
          upStreamLoading = false;
          StreamUrl = null;
        });
      }
    } catch (e) {
      setState(() {
        canClick = false;
        upStreamLoading = false;
        StreamUrl = null;
      });
    }

    return 'SUCCES';
  }

  ///Watch button once the scrape is done
}
