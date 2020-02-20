import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Contador de Pessoas',
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _count = 0;
  String _mensagem = '';

  void _changePessoa(int value) {
    setState(() {
      _count += value;
    });

    if (_count < 0) {
      _mensagem = 'Só tem fantasma!';
    } else if (_count <= 10) {
      _mensagem = 'Pode entrar!';
    } else {
      _mensagem = 'Está lotado';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'images/background-1.jpg',
          fit: BoxFit.cover,
          height: 1000,
          alignment: Alignment.center,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("$_count pessoas",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      onPressed: () {
                        _changePessoa(1);
                      },
                      child: Text("+1",
                          style: TextStyle(fontSize: 40, color: Colors.yellow)),
                      color: Colors.red,
                    )),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      onPressed: () {
                        _changePessoa(-1);
                      },
                      child: Text("-1",
                          style: TextStyle(fontSize: 40, color: Colors.yellow)),
                      color: Colors.red,
                    )),
              ],
            ),
            Text(_mensagem,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
          ],
        ),
      ],
    );
  }
}
