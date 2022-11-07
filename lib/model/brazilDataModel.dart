class BrazilStats {
  final String pais;
  final int casos;
  final int confirmados;
  final int mortes;
  final int recuperados;
  final String lastUpdate;
  BrazilStats(
      this.pais,
      this.casos,
      this.confirmados,
      this.mortes,
      this.recuperados,
      this.lastUpdate);

  factory BrazilStats.fromJSON(Map<dynamic, dynamic> json) {
    return BrazilStats(
        json["country"],
        json["cases"] ?? -1,
        json["confirmed"],
        json["deaths"],
        json["recovered"] ?? -1,
        json["updated_at"]);
  }
}

