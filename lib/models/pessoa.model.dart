class Pessoa {
  int id;
  String nome_distrito;
  String nome_municipio;
  String microrregiao;
  String mesorregiao;
  String regiao;
  String uf_sigla;
  String uf;

  Pessoa(
      {this.id,
      this.nome_distrito,
      this.nome_municipio,
      this.microrregiao,
      this.mesorregiao,
      this.regiao,
      this.uf_sigla,
      this.uf});

  Pessoa.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome_distrito = json['nome'];
    nome_municipio = json['municipio']['nome'];
    microrregiao = json['municipio']['microrregiao']['nome'];
    mesorregiao = json['municipio']['microrregiao']['mesorregiao']['nome'];
    regiao = json['municipio']['microrregiao']['mesorregiao']['UF']['regiao']
        ['nome'];
    uf_sigla = json['municipio']['microrregiao']['mesorregiao']['UF']['sigla'];
    uf = json['municipio']['microrregiao']['mesorregiao']['UF']['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome_distrito;
    data['cep'] = this.nome_municipio;
    data['logradouro'] = this.microrregiao;
    data['complemento'] = this.mesorregiao;
    data['bairro'] = this.regiao;
    data['localidade'] = this.uf_sigla;
    data['uf'] = this.uf;
    return data;
  }
}
