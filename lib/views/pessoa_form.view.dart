import 'package:app_web_papi/controllers/pessoa.controller.dart';
import 'package:app_web_papi/models/pessoa.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PessoaFormView extends StatefulWidget {
  final Pessoa pessoa;

  PessoaFormView({this.pessoa});

  @override
  _PessoaFormViewState createState() => _PessoaFormViewState();
}

class _PessoaFormViewState extends State<PessoaFormView> {
  final _tId = TextEditingController();
  final _tNome = TextEditingController();
  final _tCep = TextEditingController();
  final _tlogradouro = TextEditingController();
  final _tcomplemento = TextEditingController();
  final _tbairro = TextEditingController();
  final _tlocalidade = TextEditingController();
  final _tuf = TextEditingController();

  var _formKey = GlobalKey<FormState>();

  bool _isEdited = false;
  Pessoa _pessoa;

  @override
  void initState() {
    super.initState();

    if (widget.pessoa == null) {
      _pessoa = Pessoa();
      _isEdited = false;
    } else {
      _pessoa = widget.pessoa;
      _isEdited = true;
      _tId.text = _pessoa.id.toString();
      _tNome.text = _pessoa.nome_distrito;
      _tCep.text = _pessoa.nome_municipio;
      _tlogradouro.text = _pessoa.microrregiao;
      _tcomplemento.text = _pessoa.mesorregiao;
      _tbairro.text = _pessoa.regiao;
      _tlocalidade.text = _pessoa.uf_sigla;
      _tuf.text = _pessoa.uf;
    }
  }

  // PROCEDIMENTO PARA VALIDAR OS CAMPOS
  _validate(String text, String field) {
    if (text.isEmpty) {
      return "Digite $field";
    }
    return null;
  }

  // Widget EditText
  _editText(
      String field, TextEditingController controller, TextInputType type) {
    return TextFormField(
      enabled: false,
      controller: controller,
      validator: (s) => _validate(s, field),
      keyboardType: type,
      decoration: InputDecoration(
        labelText: field,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<PessoaController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Mais Informaçoes dos Distritos"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _editText("Distrito", _tNome, TextInputType.text),
                _editText("Municipio", _tCep, TextInputType.text),
                _editText("Microrregiao", _tlogradouro, TextInputType.text),
                _editText("Mesorregiao", _tcomplemento, TextInputType.text),
                _editText("Regiao", _tbairro, TextInputType.text),
                _editText("Sigla", _tlocalidade, TextInputType.text),
                _editText("UF", _tuf, TextInputType.text),
                Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 20),
                  height: 45,
                ),
                if (_isEdited)
                  Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 5),
                    height: 45,
                  ),
              ],
            ),
          )),
    );
  }
}
