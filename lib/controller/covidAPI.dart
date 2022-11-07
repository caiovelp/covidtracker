import 'package:covidtracker/customWidgets/PaisesStats.dart';
import 'package:covidtracker/model/PaisesDataList.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:covidtracker/model/brazilDataModel.dart';
import 'package:covidtracker/model/EstadosDataList.dart';

class CovidAPI {
  Future<BrazilStats> getBrazilCase() async {
    String url = 'https://covid19-brazil-api.now.sh/api/report/v1/brazil';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var mapResponseBody = jsonDecode(response.body);
      var json = Map.from(mapResponseBody["data"]);
      return BrazilStats.fromJSON(json);
    }
    else {
      throw Exception("Falha");
    }
  }

  Future<EstadosDataList> getEstadosData() async {
    String url = 'https://covid19-brazil-api.now.sh/api/report/v1';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var mapResponseBody = jsonDecode(response.body);
      var json = mapResponseBody["data"];
      return EstadosDataList.fromJson(json);
    }
    else {
      throw Exception("Falha");
    }
  }

  Future<EstadosDataList> getEstadosDataByDate(String data) async {
    var ano = data.substring(6,10);
    var mes = data.substring(3,5);
    var dia = data.substring(0,2);
    data = ano + mes + dia;

    String url = 'https://covid19-brazil-api.vercel.app/api/report/v1/brazil/$data';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var mapResponseBody = jsonDecode(response.body);
      var json = mapResponseBody["data"];
      return EstadosDataList.fromJson(json);
    }
    else {
      throw Exception("Falha");
    }
  }

  Future<PaisesDataList> getPaisesData() async {
    String url = 'https://covid19-brazil-api.vercel.app/api/report/v1/countries';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var mapResponseBody = jsonDecode(response.body);
      var json = mapResponseBody["data"];
      return PaisesDataList.fromJson(json);
    }
    else {
      throw Exception("Falha");
    }
  }

  Future<PaisesData> getPaisesDataByPais(String pais) async {
    String url = 'https://covid19-brazil-api.vercel.app/api/report/v1/$pais';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var mapResponseBody = jsonDecode(response.body);
      var json = mapResponseBody["data"];
      return PaisesData.fromJSON(json);
    }
    else {
      throw Exception("Falha");
    }
  }

}