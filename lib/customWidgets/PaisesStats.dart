import 'package:covidtracker/controller/flagSearch.dart';
import 'package:covidtracker/customWidgets/EstadoTile.dart';
import 'package:flutter/material.dart';

class PaisesStats extends StatelessWidget {
  final String nomePais;
  final int casos;
  final int confirmados;
  final int mortes;
  final int recuperados;
  final String lastUpdate;

  PaisesStats(
      this.nomePais,
      this.casos,
      this.confirmados,
      this.mortes,
      this.recuperados,
      this.lastUpdate);

  @override
  Widget build(BuildContext context) {
    final String _title = "Covid-19 Tracker";

    String dia = lastUpdate.substring(8,10);
    String mes = lastUpdate.substring(5,7);
    String ano = lastUpdate.substring(0,4);
    String hora = lastUpdate.substring(11,13);
    String horaFormatada = (int.parse(hora) - 3).toString() + lastUpdate.substring(13,19);
    String dataFormatada = "$dia/$mes/$ano - $horaFormatada";

    String code = FlagSearch().getCode(nomePais);

    return Scaffold(
        appBar: AppBar(title: Text(_title),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/countryFlags/png100px/$code.png'),
            SizedBox(height: 20,),
            Text("Última atualização: $dataFormatada", style: TextStyle(fontSize: 15),),
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 8),
                EstadoTile("Total de Casos", casos, Colors.blue.shade900),
                SizedBox(width: 5),
                EstadoTile("Mortes", mortes, Colors.red.shade900)
              ],
            ),
            Row(
              children: [
                SizedBox(width: 8),
                EstadoTile("Suspeitos", confirmados, Colors.yellow.shade900),
                SizedBox(width: 5),
                EstadoTile("Recusados", recuperados, Colors.green.shade900)
              ],
            ),
          ],
        )
    );
  }
}


