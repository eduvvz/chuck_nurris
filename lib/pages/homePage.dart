import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class _HomePageState extends State<HomePage> {
  final teste = ['Jorge', 'Vitor', 'Rodrigo'];

  Future _getCategories() async {
    var result = await http.get('https://api.chucknorris.io/jokes/categories');
    return result;
  }

  Widget futureListCategories() {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Container(
            alignment: Alignment.center,
            child: SpinKitRotatingCircle(
              color: Colors.purple,
              size: 50.0,
            ),
          );
        }

        final categories = json.decode(snapshot.data.body);
        return ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, i) {
            return  ListTile(
              leading: Icon(Icons.details),
              title: Text(categories[i]),
              onTap: () => print('vamoooooo'),
            );
          },
        );
      },
      future: _getCategories(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Chuck Norris'),
      ),
      body: (futureListCategories()),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
