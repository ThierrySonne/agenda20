class Personagem {
  int _id;
  String _nome;
  String _classe;
  String _nivel;
  String _campanha;
  String _imagem;

  Personagem(this._id,this._nome,this._classe,this._nivel,this._campanha,this._imagem);

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

}