import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "API Call",
      home: Scaffold(
        appBar: AppBar(
          title: Text("API Call"),
        ),
        body: Container(
          child: Center(
            child: APICallPage(),
          ),
        ),
      ),
    );
  }
}

class APICallPage extends StatefulWidget {
  var url = "https://creative-lizard.000webhostapp.com/getDetailse.php";
  var response = "Unknown";
  @override
  State<StatefulWidget> createState() {


    //http.read("http://example.com/foobar.txt").then(print);
    return _State();
  }
}

class _State extends State<APICallPage> {
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(widget.response),
        RaisedButton(
            child: Text("Fatch API"),
            onPressed: () => callAPI(widget.url),

        )
      ],
    );
  }

  callAPI(String url) {
    http.get(url,/* body: {"name": "doodle", "color": "blue"}*/)
        .then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      Map<String, dynamic> user = jsonDecode(response.body);
      var data = user['data'];
      var name = data['name'];
      var age =data['age'];
      var status = data['status'];

      if(status){
        setState(() {
          widget.response = "This App designed by $name and his age is $age";
        });

      }


    });
  }
}
