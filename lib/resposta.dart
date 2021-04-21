import 'package:flutter/material.dart';

////"Resposta" é um componente sem estado responsável por desenhar os botões
///de resposta para cada pergunta na tela e realizar a comunicação indireta
///com o componente pai "PerguntaApp" para que atualize o estado do aplicativo
///com a próxima pergunta ou com o resultado;
class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecioando;

  ///No construtor de "Resposta" além da "String" com a resposta que será
  ///exibida no botão há também uma função. A função passada é "_responder", a
  ///qual faz a chamada indireta para alterar o estado do app. Devido o retorno
  ///do parâmetro "Function()" precisar ser um "void" sem parâmetros,
  ///"_responder" é passado em "Questionário" através de uma "arrow function"
  ///(() => 'função');
  Resposta(this.texto, this.quandoSelecioando);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          primary: Colors.green,
        ),
        child: Text(texto),
        onPressed: quandoSelecioando,
      ),
    );
  }
}
