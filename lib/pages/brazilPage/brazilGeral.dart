// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructor, prefer_const_constructors

import 'package:covidtracker/customWidgets/brazilTile.dart';
import 'package:covidtracker/model/brazilDataModel.dart';
import 'package:flutter/material.dart';
import 'package:covidtracker/controller/covidAPI.dart';

class BrazilGeralPage extends StatefulWidget {
  const BrazilGeralPage({Key? key}) : super(key: key);

  @override
  State<BrazilGeralPage> createState() => _BrazilGeralPageState();
}

class _BrazilGeralPageState extends State<BrazilGeralPage> {
  final String _title = "Covid-19 Tracker";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title),),
      body: _BrazilGeralStatefulWidget(),
    );
  }
}

class _BrazilGeralStatefulWidget extends StatefulWidget {
  const _BrazilGeralStatefulWidget({Key? key}) : super(key: key);

  @override
  State<_BrazilGeralStatefulWidget> createState() => _BrazilGeralStatefulWidgetState();
}

class _BrazilGeralStatefulWidgetState extends State<_BrazilGeralStatefulWidget> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<BrazilStats>(
            future: CovidAPI().getBrazilCase(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              else {
                String dia = snapshot.data!.lastUpdate.substring(8,10);
                String mes = snapshot.data!.lastUpdate.substring(5,7);
                String ano = snapshot.data!.lastUpdate.substring(0,4);
                String hora = snapshot.data!.lastUpdate.substring(11,13);
                String horaFormatada = (int.parse(hora) - 3).toString() + snapshot.data!.lastUpdate.substring(13,19);
                String dataFormatada = "$dia/$mes/$ano - $horaFormatada";
                return Column(
                  children: [
                    Image.asset('images/countryFlags/png100px/br.png'),
                    SizedBox(height: 20,),
                    Text("Última atualização: $dataFormatada", style: TextStyle(fontSize: 15),),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 8),
                        BrazilTile(
                            "Total de Casos",
                            snapshot.data!.casos,
                            Colors.blue.shade900,
                        ),
                        SizedBox(width: 5),
                        BrazilTile(
                            "Mortes",
                            snapshot.data!.mortes,
                            Colors.red.shade900,
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 8),
                        BrazilTile(
                          "Casos confirmados",
                          snapshot.data!.confirmados,
                          Colors.yellow.shade900,
                        ),
                        SizedBox(width: 5),
                        BrazilTile(
                          "Recuperados",
                          snapshot.data!.recuperados,
                          Colors.green.shade900,
                        )
                      ],
                    )
                  ],
                );
              }
            },
          )
        ],
      ),
    );
  }
}



