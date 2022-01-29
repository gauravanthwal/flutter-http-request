import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PageTwo extends StatefulWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  Future<List<dynamic>> getData() async {
    print('start');
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/550?api_key=1686cb4a2769a07bb1d518fec95fc157'));
    print(response.body);
    print('end');
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            print(snapshot.hasData);
            return Text('loading....');
          } else if (snapshot.hasError) {
            return Text('Error');
          } else if (snapshot.hasData) {
            print(snapshot.data);
            return Center(
              child: Text('data'),
            );
          }
          return Text('dk');
        },
        future: getData(),
      ),
    );
  }
}
