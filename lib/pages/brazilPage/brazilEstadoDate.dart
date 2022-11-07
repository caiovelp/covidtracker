// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:covidtracker/controller/covidAPI.dart';
import 'package:flutter/material.dart';

import '../../customWidgets/EstadosStats.dart';
import '../../model/EstadosDataList.dart';

class BrazilEstadosPageDate extends StatefulWidget {
  String? date;

  BrazilEstadosPageDate({this.date});

  @override
  State<BrazilEstadosPageDate> createState() => _BrazilEstadosPageDateState(date);
}

class _BrazilEstadosPageDateState extends State<BrazilEstadosPageDate> {
  String? date;
  final String _title = "Covid-19 Tracker";

  _BrazilEstadosPageDateState(this.date);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final ScrollController _firstController = ScrollController();

    return Scaffold(
      appBar: AppBar(title: Text(_title),),
      body: Container(width: width,
        height: height,
        child: FutureBuilder<EstadosDataList>(
          future: CovidAPI().getEstadosDataByDate(date!),
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
            else if(snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
