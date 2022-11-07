// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:covidtracker/controller/covidAPI.dart';
import 'package:covidtracker/customWidgets/EstadosStats.dart';
import 'package:covidtracker/model/PaisesDataList.dart';
import 'package:covidtracker/pages/GlobalPage/PaisesPageSearch.dart';
import 'package:flutter/material.dart';

import '../../customWidgets/PaisesStats.dart';
import '../../model/EstadosDataList.dart';

class PaisesPage extends StatefulWidget {
  const PaisesPage({Key? key}) : super(key: key);

  @override
  State<PaisesPage> createState() => _PaisesPageState();
}

class _PaisesPageState extends State<PaisesPage> {
  final String _title = "Covid-19 Tracker";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title),),
      body: PaisStatefulWidget(),
    );
  }
}

class PaisStatefulWidget extends StatefulWidget {
  const PaisStatefulWidget({Key? key}) : super(key: key);

  @override
  State<PaisStatefulWidget> createState() => _PaisStatefulWidget();
}

class _PaisStatefulWidget extends State<PaisStatefulWidget> {
  TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final ScrollController _firstController = ScrollController();

    return Container(
      width: width,
      height: height,
      child: FutureBuilder<PaisesDataList>(
        future: CovidAPI().getPaisesData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scrollbar(
              thumbVisibility: true,
              controller: _firstController,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8),
                      child: TextField(
                        onSubmitted: (String value) {
                          Navigator.of(context).push(MaterialPageRoute
                            (builder: (context) => PaisesPageSearch(pais: value,)));
                        },
                        controller: editingController,
                        decoration: InputDecoration(
                          labelText: "Busca",
                          hintText: "Busca",
                          prefixIcon: Icon(Icons.search_rounded),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all((Radius.circular(25))))
                        ),
                      )),
                  Expanded(
                      child: ListView.builder(
                        controller: _firstController,
                        padding: EdgeInsets.symmetric(
                            horizontal: width * 0.02, vertical: height * 0.02),
                        itemCount: snapshot.data!.paises.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              trailing: Icon(Icons.play_arrow, size: height * 0.02),
                              title: Text(snapshot.data!.paises[index].nomePais),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PaisesStats(
                                            snapshot.data!.paises[index].nomePais,
                                            snapshot.data!.paises[index].casos,
                                            snapshot.data!.paises[index].confirmados,
                                            snapshot.data!.paises[index].mortes,
                                            snapshot.data!.paises[index].recuperados,
                                            snapshot.data!.paises[index].lastUpdate)
                                    )
                                );
                              },
                            ),
                          );
                        },
                      ),)
                ],
              )

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

