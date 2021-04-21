import 'package:flutter/material.dart';

///"Questao" é um widget sem estado responsável por desenhar a pergunta
///na tela através de um parâmetro do tipo "String";
class Questao extends StatelessWidget {
  final String texto;

  Questao(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 24,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
