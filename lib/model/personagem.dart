class Personagem {
  int _id;
  String _nome;
  String _classe;
  int _nivel;
  String _campanha;

  Personagem(this._id,this._nome,this._classe,this._nivel,this._campanha);

  int get id{
    return this._id;
  }

  String get nome{
    return this._nome;
  }

  String get classe{
    return this._classe;
  }

  int get nivel{
    return this._nivel;
  }

  String get campanha{
    return this._campanha;
  }
}