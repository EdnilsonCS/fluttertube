void main() {
  Map<String, dynamic> json = {
    'publicacao': 'Teste para mobile',
    'ano': 2019,
    'usuario': {'nome': 'Ednilson', 'idade': 23},
    'horario': [
      {'diaSemana': 'segunda'},
      {'diaSemana': 'terca'}
    ],
    'dia': 29
  };

  final post = Post.fromJson(json);

  print('Publicação: ${post.publicacao}'
      ' Ano: ${post.ano}'
      ' Dia: ${post.dia}'
      ' Usuário: ${post.usuario.nome}'
      ' Idade: ${post.usuario.idade}'       
        ' ${post.horario.map((m)=>m.diaSemana).toString()}'
       );
  
  ;
}

class Horario{
  String diaSemana;
  
  Horario(this.diaSemana);
  factory Horario.fromJson(Map<String, dynamic> json) => Horario(json['diaSemana']);
}

class Post {
  String publicacao;
  int ano;
  int dia;
  Usuario usuario;
  List<Horario> horario;

  Post(this.publicacao, this.ano, this.usuario, this.dia, this.horario);
  factory Post.fromJson(Map<String, dynamic> json) => Post(json['publicacao'],
      json['ano'], Usuario.fromJson(json['usuario']), json['dia'], json['horario'].map<Horario>((m)=> Horario.fromJson(m)).toList());
}

class Usuario {
  String nome;
  int idade;
  Usuario(this.nome, this.idade);
  factory Usuario.fromJson(Map<String, dynamic> json) =>
      json != null ? Usuario(json['nome'], json['idade']) : Usuario(null, null);
}
