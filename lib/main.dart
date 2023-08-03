import 'package:flutter/material.dart';
import './questao.dart';
import 'resposta.dart';

main() {
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;

  final List<Map<String, Object>> _respostas = const [
    {
      "texto": "Seram 10 perguntinhas, você topa esse desafio?",
      "respostas": ["Sim", "Sim", "Sim", "Sim"],
    },
    {
      "texto": "1 - Qual é o maior planeta do sistema solar?",
      "respostas": ["Júpiter", "Saturno", "Netuno", "Urano"],
    },
    {
      "texto":
          "2 - Quais são os dois planetas do sistema solar que não possuem luas?",
      "respostas": [
        "Mercúrio e Vênus",
        "Marte e Júpiter",
        "Saturno e Netuno",
        "Urano e Plutão"
      ],
    },
    {
      "texto": "3 - Qual é o planeta conhecido por ser o 'gêmeo' da Terra?",
      "respostas": ["Vênus", "Marte", "Netuno", "Júpiter"],
    },
    {
      "texto": "4 - Quem foi o primeiro ser humano a caminhar na Lua?",
      "respostas": [
        "Neil Armstrong",
        "Buzz Aldrin",
        "Alan Shepard",
        "John Glenn"
      ],
    },
    {
      "texto": "5 - Qual é o planeta mais próximo do Sol?",
      "respostas": ["Vênus", "Terra", "Marte", "Mercúrio"],
    },
    {
      "texto": "6 - Qual é a maior lua do sistema solar?",
      "respostas": ["Ganimedes", "Lua (da Terra)", "Titã", "Europa"],
    },
    {
      "texto": "7 - Qual é o planeta conhecido por seus anéis brilhantes?",
      "respostas": ["Saturno", "Urano", "Júpiter", "Netuno"],
    },
    {
      "texto": "8 - Qual é a estrela central do sistema solar?",
      "respostas": ["Vênus", "Júpiter", "Sol", "Saturno"],
    },
    {
      "texto":
          "9 - Quantos planetas anões foram oficialmente reconhecidos no sistema solar?",
      "respostas": ["1", "3", "5", "8"],
    },
    {
      "texto":
          "10 - Qual é o planeta que possui a Grande Mancha Vermelha, uma tempestade gigante?",
      "respostas": ["Vênus", "Marte", "Júpiter", "Saturno"],
    },
  ];

  void reiniciarPerguntas() {
    setState(() {
      _perguntaSelecionada = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _respostas.length;
  }

  void _responder() {
    setState(() {
      if (temPerguntaSelecionada) {
        _perguntaSelecionada++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> novasRespostas = temPerguntaSelecionada
        ? (_respostas[_perguntaSelecionada]["respostas"] as List).cast<String>()
        : [];

    // for (String resposta
    //     in respostas[_perguntaSelecionada].cast()["respostas"]) {
    //   novasRespostas.add(Resposta(resposta, _responder));
    // }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Perguntas"),
          ),
          body: temPerguntaSelecionada
              ? Column(
                  children: [
                    Questao(
                        _respostas[_perguntaSelecionada]["texto"].toString()),
                    ...novasRespostas
                        .map((t) => Resposta(t, _responder))
                        .toList()
                  ],
                )
              : Column(
                  children: [
                    Center(
                      child: Text(
                        "Parabens!",
                        style: TextStyle(
                            fontSize: 28,
                            color: Color.fromRGBO(91, 22, 126, 1)),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: reiniciarPerguntas,
                        child: Text("Reinicia"),
                      ),
                    )
                  ],
                )),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
