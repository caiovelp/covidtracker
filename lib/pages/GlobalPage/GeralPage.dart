import 'package:covidtracker/controller/covidAPI.dart';
import 'package:covidtracker/model/PaisesDataList.dart';
import 'package:flutter/material.dart';

import '../../customWidgets/brazilTile.dart';

class PaisesGeralPage extends StatefulWidget {
  const PaisesGeralPage({Key? key}) : super(key: key);

  @override
  State<PaisesGeralPage> createState() => _PaisesGeralPageState();
}

class _PaisesGeralPageState extends State<PaisesGeralPage> {
  final String _title = "Covid-19 Tracker";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title),),
      body: PaisesGeralStatefulWidget(),
    );
  }
}

class PaisesGeralStatefulWidget extends StatefulWidget {
  const PaisesGeralStatefulWidget({Key? key}) : super(key: key);

  @override
  State<PaisesGeralStatefulWidget> createState() => _PaisesGeralStatefulWidgetState();
}

class _PaisesGeralStatefulWidgetState extends State<PaisesGeralStatefulWidget> {
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
          FutureBuilder<PaisesDataList>(
            future: CovidAPI().getPaisesData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var globalData = getData(snapshot.data!.paises);
                String dia = globalData.lastUpdate.substring(8,10);
                String mes = globalData.lastUpdate.substring(5,7);
                String ano = globalData.lastUpdate.substring(0,4);
                String hora = globalData.lastUpdate.substring(11,19);
                String dataFormatada = "$dia/$mes/$ano - $hora";

                return Column(
                  children: [
                    Icon(Icons.public_rounded, size: 100),
                    SizedBox(height: 20,),
                    Text("Última atualização: $dataFormatada", style: TextStyle(fontSize: 15),),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 8),
                        BrazilTile(
                          "Total de Casos",
                          globalData.casos,
                          Colors.blue.shade900,
                        ),
                        SizedBox(width: 5),
                        BrazilTile(
                          "Mortes",
                          globalData.mortes,
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
                          globalData.confirmados,
                          Colors.yellow.shade900,
                        ),
                        SizedBox(width: 5),
                        BrazilTile(
                          "Recuperados",
                          globalData.recuperados,
                          Colors.green.shade900,
                        )
                      ],
                    )
                  ],
                );
              }
              else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              else {
                return const CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }
}

PaisesDataSuporte getData(List<PaisesData> list) {
  int i = 0;

  int casosTotais = 0;
  int confirmadosTotais = 0;
  int mortesTotais = 0;
  int recuperadosTotais = 0;

  String lastUpdate = DateTime.now().toString();
  while (i < list.length) {
    casosTotais += list[i].casos;
    confirmadosTotais += list[i].confirmados;
    mortesTotais += list[i].mortes;
    recuperadosTotais += list[i].recuperados;
    i++;
  }

  return PaisesDataSuporte(
      casosTotais,
      confirmadosTotais,
      mortesTotais,
      recuperadosTotais,
      lastUpdate);
}

