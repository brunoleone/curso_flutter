import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Calculadora de IMC',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  TextEditingController weigthController = TextEditingController();
  TextEditingController heigthController = TextEditingController();

  String _informacoes = 'Informe seus dados!';

  void _resetFiels() {
    weigthController.text = '';
    heigthController.text = '';
    setState(() {
      _informacoes = 'Informe seus dados!';
    });
  }

  void _calcular() {
    setState(() {
      double weigth = double.parse(weigthController.text);
      double height = double.parse(heigthController.text) / 100;
      double imc = weigth / (height * height);

      if (imc < 18.6) {
        _informacoes = 'Abaixo do Peso (${imc.toStringAsPrecision(2)})';
      } else if (imc >= 18.6 && imc < 24.9) {
        _informacoes = 'Peso Ideal (${imc.toStringAsPrecision(2)})';
      } else if (imc >= 24.9 && imc < 29.9) {
        _informacoes =
            'Levemente Acima do Peso (${imc.toStringAsPrecision(2)})';
      } else if (imc >= 29.9 && imc < 34.9) {
        _informacoes = 'Obesidade Grau I (${imc.toStringAsPrecision(2)})';
      } else if (imc >= 34.9 && imc < 39.9) {
        _informacoes = 'Obesidade Grau II (${imc.toStringAsPrecision(2)})';
      } else if (imc >= 40) {
        _informacoes = 'Obesidade Grau III (${imc.toStringAsPrecision(2)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculadora de IMC'),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  _resetFiels();
                })
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Form(
              key: _globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(
                    Icons.person_outline,
                    size: 120,
                    color: Colors.green,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        labelText: 'Peso (kg)',
                        labelStyle: TextStyle(color: Colors.green)),
                    style: TextStyle(color: Colors.green, fontSize: 20.0),
                    controller: weigthController,
                    validator: (value) {},
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        labelText: 'Altura (cm)',
                        labelStyle: TextStyle(color: Colors.green)),
                    style: TextStyle(color: Colors.green, fontSize: 20.0),
                    controller: heigthController,
                    validator: (value) {},
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Container(
                      height: 50.0,
                      child: RaisedButton(
                        onPressed: () {
                          _calcular();
                        },
                        color: Colors.green,
                        child: Text(
                          'Calcular',
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '$_informacoes',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.green, fontSize: 25.0),
                  )
                ],
              )),
        ));
  }
}
