import 'package:alcool_ou_gasolina/page2.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if ((precoAlcool! / precoGasolina!) >= 0.7) {
      setState(() {
        _textoResultado = "Melhor abastecer com gasolina.";
      });
    } else {
      setState(() {
        _textoResultado = "Melhor abastecer com álcool.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina?"),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Image.asset("images/logo.png"),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Saiba qual a melhor opção para abastecimento do seu carro",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Preço Alcool, ex: 1.59",
                  ),
                  keyboardType: TextInputType.number,
                  controller: _controllerAlcool,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Preço Gasolina, ex: 3.59",
                  ),
                  keyboardType: TextInputType.number,
                  controller: _controllerGasolina,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      fixedSize: Size(220.0, 50.0),
                    ),
                    onPressed: _calcular,
                    child: Text(
                      "Calcular",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      fixedSize: Size(220.0, 50.0),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Page2()));
                    },
                    child: Text(
                      "Nova Tela",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                Text(_textoResultado)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
