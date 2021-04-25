import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() quandoSelecioando;

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
