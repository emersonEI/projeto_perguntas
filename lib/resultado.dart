import 'package:flutter/material.dart';

///"Resultado" é um widget sem estado que exibe uma mensagem ao usuário
///dependendo da pontuação adquirida nas respostas e desenha um botão de texto
///que ao selecionar reinicia o questionário através de comunicação indireta
///com o componente pai;
class Resultado extends StatelessWidget {
  final int pontuacao;
  ///"quandoReiniciarQuestionario" é a função passada como parâmetro no
  ///construtor de "Resultado", o qual recebe o método "_reiniciarQuestionario"
  ///como parâmetro que "reseta" o estado de "PerguntaApp"
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return "Parabéns!";
    } else if (pontuacao < 12) {
      return "Você é bom!";
    } else if (pontuacao < 16) {
      return "Impressionante!";
    } else {
      return "Nível Jedi!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          child: Text(
            "Reiniciar?",
            style: TextStyle(fontSize: 18),
          ),
          style: TextButton.styleFrom(
            primary: Colors.green,
          ),
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}
