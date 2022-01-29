import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
      // ignore: prefer_const_constructors
      MaterialApp(
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // ignore: prefer_typing_uninitialized_variables
  var data;

  @override
  void initState(){
    super.initState();
    getData();
  }

  Future<List<dynamic>> getData() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    http.Response res = await http.get(url);
    // ignore: avoid_print
    if (res.statusCode == 200) {
      // ignore: avoid_print
      print(res.body);
      setState(() {
        var jsonData = jsonDecode(res.body);
        data = jsonData;
      });
      return jsonDecode(res.body);
    } else {
      // ignore: avoid_print
      print('something went wrong');
      return jsonDecode(res.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('WhatsApp')),
        body: ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(data[index]['id'].toString()),
                      Text(data[index]['name']),
                      Text(data[index]['username']),
                      Text(data[index]['email']),
                      Text(data[index]['phone']),
                      Text(data[index]['address']['street']),
                      Text(data[index]['address']['suite']),
                    ],
                  ),
                ),
              );
            }));
  }
}


//  ElevatedButton(onPressed: getData, child: const Text('Get Data'))