import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

///"Questionario" é um widget sem estado que recebe parâmetros em seu 
///construtor que indicam qual pergunta deve ser exibida na tela e quais 
///são as opções de respota;
class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) quandoResponder;

  ///Note que o construtor recebe como parâmetro uma função sem retorno com
  ///um único parâmetro do tipo inteiro. "quandoResponder" recebe do arquivo
  ///main o método "_responder" que é responsável por mudar o estado 
  ///(redesenhar a tela) da aplicação quando o usuário seleciona uma reposta
  ///e totalizar a pontuação do mesmo de acordo com cada resposta;
  Questionario({
    @required this.perguntaSelecionada,
    @required this.perguntas,
    @required this.quandoResponder,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]["respostas"]
        : null;

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]["texto"]),
        ...respostas.map((resp) {
          return Resposta(
            resp["texto"],
            () => quandoResponder(resp["pontuacao"]),
          );
        }).toList(),
      ],
    );
  }
}
