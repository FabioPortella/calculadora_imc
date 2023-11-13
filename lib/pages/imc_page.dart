import 'package:calculadora_imc/model/imc_model.dart';
import 'package:calculadora_imc/repositories/imc_repository.dart';
import 'package:calculadora_imc/shared/widgets/calcula_IMC.dart';
import 'package:calculadora_imc/shared/widgets/text_label.dart';
import 'package:flutter/material.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  late ImcRepository imcRepository;
  var _indiceIMC = const <ImcModel>[];
  var descricaoController = TextEditingController(text: "");
  double peso = 0;
  double altura = 0;

  @override
  void initState() {
    super.initState();
    obterIndiceIMC();
  }

  void obterIndiceIMC() async {
    imcRepository = await ImcRepository.carregar();
    _indiceIMC = imcRepository.obterDados();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Acompanhamento do IMC")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          peso = 0;
          altura = 0;
          showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  alignment: Alignment.centerLeft,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  title: const Text(
                    "Adicionar dados para calculo do IMC",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  content: StatefulBuilder(builder: (context, setState) {
                    return Wrap(
                      children: [
                        const TextLabel(texto: "Nome"),
                        TextField(
                          controller: descricaoController,
                        ),
                        TextLabel(
                            texto: "Peso ${peso.toStringAsFixed(2)} (Kg)"),
                        Slider(
                            value: peso,
                            min: 0,
                            max: 300,
                            onChanged: (value) {
                              setState(() {
                                peso = value;
                              });
                            }),
                        TextLabel(
                            texto: "Altura ${altura.toStringAsFixed(2)} mts"),
                        Slider(
                            value: altura,
                            min: 0,
                            max: 3,
                            onChanged: (value) {
                              setState(() {
                                altura = value;
                              });
                            }),
                      ],
                    );
                  }),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancelar")),
                    TextButton(
                        onPressed: () async {
                          if (peso == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "O peso precisa ser maior que 0, informe um valor")));
                            return;
                          }
                          if (altura == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        "A altura precisa ser maior que 0, informe um valor")));
                            return;
                          }
                          await imcRepository.salvar(ImcModel.criar(
                              descricaoController.text,
                              DateTime.now(),
                              peso,
                              altura,
                              IMC.calculaIMC(peso, altura),
                              IMC.classificacaoIMC(peso, altura)));
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);

                          obterIndiceIMC();
                          setState(() {});
                        },
                        child: const Text("Salvar")),
                  ],
                );
              });
        },
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _indiceIMC.length,
                itemBuilder: (BuildContext bc, int index) {
                  var indiceIMC = _indiceIMC[index];
                  return Dismissible(
                    onDismissed: (DismissDirection dismissDirection) async {
                      await imcRepository.excluir(indiceIMC);
                      obterIndiceIMC();
                    },
                    key: Key(indiceIMC.descricao),
                    child: ListTile(
                      //leading: const Text(),
                      title: Text(
                          "${indiceIMC.descricao}\nIndice de IMC ${indiceIMC.imc.toStringAsFixed(2)} \n - ${indiceIMC.classificacaoIMC}"),
                      subtitle: Text(
                          "Peso: ${indiceIMC.peso.toStringAsFixed(2)}  Altura: ${indiceIMC.altura.toStringAsFixed(2)}"),
                      trailing: Text(
                          "${indiceIMC.data?.day}/${indiceIMC.data?.month}/${indiceIMC.data?.year}"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
