import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

///"PerguntaApp" é um componente com estado que desenha um questionário
///na tela com perguntas e respostas, que ao serem selecionadas pelo usuário
///totalizam uma pontuação que afeta a mensagem final de resposta ao usuário
class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class _PerguntaAppState extends State<PerguntaApp> {
  ///"_perguntaSelecionada" indica qual a pergunta da lista deve ser acessada;
  ///"_pontuacaoTotal" indica quantos pontos o usuário ganhou na totalização
  ///das respostas;
  ///"_pergutas" é uma lista de Maps que possue em seus valores as Strings
  ///das perguntas, respostas e inteiros da pontuação dada por cada pergunta;
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final _perguntas = const [
    {
      "texto": "Qual é a sua cor favorita?",
      "respostas": [
        {"texto": "Preto", "pontuacao": 10},
        {"texto": "Vermelho", "pontuacao": 5},
        {"texto": "Verde", "pontuacao": 3},
        {"texto": "Branco", "pontuacao": 1},
      ],
    },
    {
      "texto": "Qual é o seu animal favorito?",
      "respostas": [
        {"texto": "Coelho", "pontuacao": 10},
        {"texto": "Cobra", "pontuacao": 5},
        {"texto": "Elefante", "pontuacao": 3},
        {"texto": "Leão", "pontuacao": 1},
      ],
    },
    {
      "texto": "Qual é o seu campeão favorito?",
      "respostas": [
        {"texto": "Lucian", "pontuacao": 10},
        {"texto": "Azir", "pontuacao": 5},
        {"texto": "Nautilus", "pontuacao": 3},
        {"texto": "Kassadin", "pontuacao": 1},
      ],
    }
  ];

  ///"_responder" altera o estado da aplicação sempre a resposta de uma
  ///pergunta é selecionada. É chamado por comunicação indireta;
  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  ///"_reiniciarQuestionario" redefine o estado da aplicação para o estado
  ///inicial de suas variáveis "_perguntaSelecionada" e "_pontuacaoTotal"
  ///redesenhando a tela. É chamado por comunicação indireta;
  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  ///Verifica se no índice indicado por "_perguntadaSelecionada"
  ///há uma pergunta na lista de perguntas("_perguntas");
  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  ///O método build do estado("PerguntaAppState") de "PerguntaApp" no topo da
  ///hierarquia de sua árvore de widgets um "Scaffold" composto por uma "AppBar"
  ///e dois widgets criados nos arquivos "questionario.dart" e "resultado.dart",
  ///respectivamente. Estes são responsaveis por desenhar o restante da tela;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text("Perguntas"),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntaSelecionada: _perguntaSelecionada,
                perguntas: _perguntas,
                quandoResponder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}
