class EstadosDataList {
  List<EstadosData> estados;

  EstadosDataList(this.estados);

  factory EstadosDataList.fromJson(List<dynamic> parsedJson) {
    List<EstadosData> estadosList = List<EstadosData>.empty();
    estadosList = parsedJson.map((i) => EstadosData.fromJSON(i)).toList();
    return new EstadosDataList(estadosList);
  }
}

class EstadosData {
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
  EstadosData(
      this.uid,
      this.nomeEstado,
      this.ufEstado,
      this.casos,
      this.mortes,
      this.suspeitos,
      this.recusados,
      this.transmissao,
      this.comentarios,
      this.lastUpdate);

  factory EstadosData.fromJSON(Map<dynamic, dynamic> json) {
    return EstadosData(
        json["uid"],
        json["state"],
        json["uf"],
        json["cases"],
        json["deaths"],
        json["suspects"],
        json["refuses"],
        json["broadcast"] ?? false,
        json["comments"] ?? "None",
        json["datetime"]);
  }
}

