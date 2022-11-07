class PaisesDataList {
  List<PaisesData> paises;

  PaisesDataList(this.paises);

  factory PaisesDataList.fromJson(List<dynamic> parsedJson) {
    List<PaisesData> paisesList = List<PaisesData>.empty();
    paisesList = parsedJson.map((i) => PaisesData.fromJSON(i)).toList();
    return new PaisesDataList(paisesList);
  }
}

class PaisesData {
  final String nomePais;
  final int casos;
  final int confirmados;
  final int mortes;
  final int recuperados;
  final String lastUpdate;
  PaisesData(
      this.nomePais,
      this.casos,
      this.confirmados,
      this.mortes,
      this.recuperados,
      this.lastUpdate);

  factory PaisesData.fromJSON(Map<dynamic, dynamic> json) {
    return PaisesData(
        json["country"],
        json["cases"] ?? -1,
        json["confirmed"],
        json["deaths"],
        json["recovered"] ?? -1,
        json["updated_at"]);
  }
}

class PaisesDataSuporte {
  final int casos;
  final int confirmados;
  final int mortes;
  final int recuperados;
  final String lastUpdate;
  PaisesDataSuporte(
      this.casos,
      this.confirmados,
      this.mortes,
      this.recuperados,
      this.lastUpdate);
}

