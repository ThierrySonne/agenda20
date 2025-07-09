class Personagem {
  int _id;
  String _nome;
  String _classe;
  String _nivel;
  String _campanha;
  String _imagem;

  Personagem(this._id,this._nome,this._classe,this._nivel,this._campanha,this._imagem);


  Map<String, dynamic> toMap(){
    return{
      'nome' : _nome,
      'classe' : _classe,
      'nivel' : _nivel,
      'campanha' : _campanha,
      'imagem' : _imagem,
    };
  }

  int get id{
    return this._id;
  }

  String get nome{
    return this._nome;
  }

  String get classe{
    return this._classe;
  }

  String get nivel{
    return this._nivel;
  }

  String get campanha{
    return this._campanha;
  }

  String get imagem{
    return this._imagem;
  }

  @Override
  String toString() {
    return 'Personagem(id: $id, nome: $nome, classe: $classe}';
}
