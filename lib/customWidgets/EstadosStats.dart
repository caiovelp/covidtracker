import 'package:covidtracker/customWidgets/EstadoTile.dart';
import 'package:flutter/material.dart';

class EstadosStats extends StatelessWidget {
  final int uid;
  final String nomeEstado;
  final String ufEstado;
  final int casos;
  final int mortes;
  final int suspeitos;
  final int recusados;
  final bool transmissao;
  final String comentarios;
  final String lastUpdate;

  EstadosStats(
        this.uid,
        this.nomeEstado,
        this.ufEstado,
        this.casos,
        this.mortes,
        this.suspeitos,
        this.recusados,
        this.transmissao,
        this.comentarios,
        this.lastUpdate,);

  @override
  Widget build(BuildContext context) {
    final String _title = "Covid-19 Tracker";

    String dia = lastUpdate.substring(8,10);
    String mes = lastUpdate.substring(5,7);
    String ano = lastUpdate.substring(0,4);
    String hora = lastUpdate.substring(11,19);
    String dataFormatada = "$dia/$mes/$ano - $hora";

    return Scaffold(
      appBar: AppBar(title: Text(_title),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/estados/$ufEstado.png', scale: 3,),
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
                EstadoTile("Suspeitos", suspeitos, Colors.yellow.shade900),
                SizedBox(width: 5),
                EstadoTile("Recusados", recusados, Colors.green.shade900)
              ],
            ),
          ],
        )
      );
  }
}


