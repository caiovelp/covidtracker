// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:covidtracker/pages/brazilPage/brazilEstado.dart';
import 'package:covidtracker/pages/brazilPage/brazilEstadoDate.dart';
import 'package:covidtracker/pages/brazilPage/brazilGeral.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BrazilFilterPage extends StatefulWidget {
  const BrazilFilterPage({Key? key}) : super(key: key);

  @override
  State<BrazilFilterPage> createState() => _BrazilFilterPageState();
}

class _BrazilFilterPageState extends State<BrazilFilterPage> {
  final String _title = "Covid-19 Tracker";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title),),
      body: _BrazilFilterPageStatefulWidget()
    );
  }
}

class _BrazilFilterPageStatefulWidget extends StatefulWidget {
  const _BrazilFilterPageStatefulWidget({Key? key}) : super(key: key);

  @override
  State<_BrazilFilterPageStatefulWidget> createState() => _BrazilFilterPageStatefulWidgetState();
}

class _BrazilFilterPageStatefulWidgetState extends State<_BrazilFilterPageStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GeralCard(),
        EstadoCard(),
        DataCard()
      ],
    );
  }
}


class GeralCard extends StatelessWidget {
  const GeralCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BrazilGeralPage()));
      },
      child: Center(
        child: Card(
          elevation: 0,
          color: Colors.cyan.shade900,
          child: SizedBox(
            width: 350,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Geral", style: (TextStyle(fontSize: 30)),),
                Icon(Icons.flag_rounded, size: 80, color: Colors.white,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EstadoCard extends StatelessWidget {
  const EstadoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => BrazilEstadosPage()));
      },
      child: Center(
        child: Card(
          elevation: 0,
          color: Colors.cyan.shade900,
          child: SizedBox(
            width: 350,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Estado", style: (TextStyle(fontSize: 30)),),
                Icon(Icons.list_rounded, size: 80, color: Colors.white,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DataCard extends StatelessWidget {
  const DataCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.cyan.shade900,
      child: SizedBox(
        width: 350,
        height: 100,
        child: TextField(
          keyboardType: TextInputType.datetime,
          decoration: InputDecoration(labelText: "Digite uma data XX/XX/XXXX"),
          maxLength: 10,
          maxLengthEnforcement: MaxLengthEnforcement.none,
          style: TextStyle(fontSize: 25),
          onSubmitted: (String texto) => {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BrazilEstadosPageDate(date: texto)
            ))
          },
        ),
      ),
    );
  }
}

