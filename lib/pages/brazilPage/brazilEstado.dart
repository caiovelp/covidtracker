// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:covidtracker/controller/covidAPI.dart';
import 'package:covidtracker/customWidgets/EstadosStats.dart';
import 'package:flutter/material.dart';

import '../../model/EstadosDataList.dart';

class BrazilEstadosPage extends StatefulWidget {
  const BrazilEstadosPage({Key? key}) : super(key: key);

  @override
  State<BrazilEstadosPage> createState() => _BrazilEstadosPageState();
}

class _BrazilEstadosPageState extends State<BrazilEstadosPage> {
  final String _title = "Covid-19 Tracker";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title),),
      body: BrazilEstadoStatefulWidget(),
    );
  }
}

class BrazilEstadoStatefulWidget extends StatefulWidget {
  const BrazilEstadoStatefulWidget({Key? key}) : super(key: key);

  @override
  State<BrazilEstadoStatefulWidget> createState() => _BrazilEstadoStatefulWidgetState();
}

class _BrazilEstadoStatefulWidgetState extends State<BrazilEstadoStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final ScrollController _firstController = ScrollController();

    return Container(
      width: width,
      height: height,
      child: FutureBuilder<EstadosDataList>(
        future: CovidAPI().getEstadosData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scrollbar(
              thumbVisibility: true,
              controller: _firstController,
              child: ListView.builder(
                controller: _firstController,
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02, vertical: height * 0.02),
                itemCount: snapshot.data!.estados.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      trailing: Icon(Icons.play_arrow, size: height * 0.02),
                      title: Text(snapshot.data!.estados[index].nomeEstado
                          + " (" + snapshot.data!.estados[index].ufEstado + ")"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EstadosStats(
                                    snapshot.data!.estados[index].uid,
                                    snapshot.data!.estados[index].nomeEstado,
                                    snapshot.data!.estados[index].ufEstado,
                                    snapshot.data!.estados[index].casos,
                                    snapshot.data!.estados[index].mortes,
                                    snapshot.data!.estados[index].suspeitos,
                                    snapshot.data!.estados[index].recusados,
                                    snapshot.data!.estados[index].transmissao,
                                    snapshot.data!.estados[index].comentarios,
                                    snapshot.data!.estados[index].lastUpdate)
                            )
                        );
                      },
                    ),
                  );
                },
              ),
            );
          }
          else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

