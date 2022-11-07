// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:covidtracker/controller/covidAPI.dart';
import 'package:covidtracker/customWidgets/PaisesStats.dart';
import 'package:covidtracker/model/PaisesDataList.dart';
import 'package:flutter/material.dart';

import '../../controller/flagSearch.dart';
import '../../customWidgets/brazilTile.dart';

class PaisesPageSearch extends StatefulWidget {
  String? pais;

  PaisesPageSearch({this.pais});

  @override
  State<PaisesPageSearch> createState() => _PaisesPageSearch(pais);
}

class _PaisesPageSearch extends State<PaisesPageSearch> {
  String? pais;
  final String _title = "Covid-19 Tracker";

  _PaisesPageSearch(this.pais);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text(_title),),
      body: Container(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<PaisesData>(
              future: CovidAPI().getPaisesDataByPais(pais!),
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
                  String code = FlagSearch().getCode(pais!);

                  return Column(
                    children: [
                      Image.asset('images/countryFlags/png100px/$code.png'),
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
      )
    );

  }
}
