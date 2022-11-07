// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:covidtracker/pages/GlobalPage/GeralPage.dart';
import 'package:covidtracker/pages/GlobalPage/PaisesPage.dart';
import 'package:covidtracker/pages/brazilPage/brazilFilterPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final String _title = "Covid-19 Tracker";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title),),
      body: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BrazilCard(),
        PaisesCard(),
        SearchCard()
      ],
    );
  }
}

class BrazilCard extends StatelessWidget {
  const BrazilCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => BrazilFilterPage()));
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
                  Text("Brasil", style: (TextStyle(fontSize: 30)),),
                  Image.asset('images/countryFlags/png100px/br.png')
                ],
              ),
            ),
          ),
        ),
    );
  }
}

class PaisesCard extends StatelessWidget {
  const PaisesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PaisesGeralPage()));
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
                Text("Todos os países", style: (TextStyle(fontSize: 30)),),
                Icon(Icons.public_rounded, size: 80, color: Colors.white,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchCard extends StatelessWidget {
  const SearchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PaisesPage()));
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
                Text("Consultar por país", style: (TextStyle(fontSize: 30)),),
                Icon(Icons.search_rounded, size: 80, color: Colors.white,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}




