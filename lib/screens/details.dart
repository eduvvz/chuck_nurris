import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class _Details extends State {
  final String categorie;

  _Details(this.categorie);

  Future _getJoke() async {
    try {
      var result = await http
          .get('https://api.chucknorris.io/jokes/random?category=$categorie');
      return result;
    } catch (e) {
      print(e);
    }
  }

  Widget _futureDetailJoke() {
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

        final joke = json.decode(snapshot.data.body);
        String imageUri = joke['icon_url'];
        String value = joke['value'];
        return Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Image.network(imageUri),
              ),
              height: 100,
            ),
            Container(
              child: Text(value, style: TextStyle(fontSize: 17)),
              padding: EdgeInsets.only(left: 20, right: 20),
            )
          ],
        );
      },
      future: _getJoke(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('Joke of $categorie'),
      ),
      body: _futureDetailJoke(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        child: Icon(Icons.update),
        backgroundColor: Colors.purple,
      ),
    );
  }
}

class Details extends StatefulWidget {
  final String categorie;

  Details(this.categorie);

  @override
  _Details createState() => _Details(this.categorie);
}
