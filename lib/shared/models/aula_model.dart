class AulaModel {
  final int id;
  final String diaSemana;
  final String horario;
  final String nomeProfessor;
  final String titulo;
  final int vagas;

  AulaModel({
    required this.id,
    required this.diaSemana,
    required this.horario,
    required this.nomeProfessor,
    required this.titulo,
    required this.vagas,
  });

  factory AulaModel.fromJson(Map<String, dynamic> json) {
    return AulaModel(
      id: json['id'],
      diaSemana: json['dia_semana'],
      horario: json['horario'],
      nomeProfessor: json['nome_professor'],
      titulo: json['titulo'],
      vagas: json['vagas'],
    );
  }
}