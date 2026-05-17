class Music {
  int? id;
  String titulo;
  String artista;
  String album;
  String genero;
  String humor;
  double duracao;
  int nota;
  bool favorita;

  Music({
    this.id,
    required this.titulo,
    required this.artista,
    required this.album,
    required this.genero,
    required this.humor,
    required this.duracao,
    required this.nota,
    required this.favorita,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'artista': artista,
      'album': album,
      'genero': genero,
      'humor': humor,
      'duracao': duracao,
      'nota': nota,
      'favorita': favorita ? 1 : 0,
    };
  }

  factory Music.fromMap(Map<String, dynamic> map) {
    return Music(
      id: map['id'],
      titulo: map['titulo'],
      artista: map['artista'],
      album: map['album'],
      genero: map['genero'],
      humor: map['humor'],
      duracao: map['duracao'],
      nota: map['nota'],
      favorita: map['favorita'] == 1,
    );
  }
}