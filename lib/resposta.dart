import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String? texto;
  final void Function() quandoSelecionado;

  Resposta(this.texto, this.quandoSelecionado);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(221, 131, 49, 160)),
          onPressed: quandoSelecionado,
          child: Text("${texto}")),
    );
  }
}
