import 'dart:convert';
import 'package:app_web_papi/models/pessoa.model.dart';
import 'package:http/http.dart' as http;

class PessoaRepository {
  var url =
      'https://servicodados.ibge.gov.br/api/v1/localidades/distritos?orderBy=nome';

  Future<List<Pessoa>> getAll() async {
    final response = await http.get(url);
    print(response);
    if (response.statusCode == 200) {
      List<Pessoa> data = (json.decode(response.body) as List)
          .map((i) => Pessoa.fromJson(i))
          .toList();

      return data;
    } else {
      throw Exception("Erro de conexão com o servidor!");
    }
  }

  Future<bool> create(Pessoa pessoa) async {}

  Future<bool> edit(Pessoa professor) async {
    print('do nothing');
  }

  Future<bool> delete(int id) async {
    print('do nothing');
  }
}
