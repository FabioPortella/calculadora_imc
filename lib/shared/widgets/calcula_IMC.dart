// ignore_for_file: file_names

class IMC {
  static double calculaIMC(peso, altura) {
    double imc = peso / (altura * altura);
    return imc;
  }

  static String classificacaoIMC(peso, altura) {
    double imc = calculaIMC(peso, altura);
    String classificacao = "";
    switch (imc) {
      case (< 16):
        classificacao = "Magreza grave";
        break;
      case (< 17):
        classificacao = "Magreza Moderada";
        break;
      case (< 18.5):
        classificacao = "Magreza leve";
        break;
      case (< 25):
        classificacao = "Saudável";
        break;
      case (< 30):
        classificacao = "Sobrepeso";
        break;
      case (< 35):
        classificacao = "Obesidade Grau I";
        break;
      case (< 40):
        classificacao = "Obesidade Grau II - Severa";
        break;
      case (>= 40):
        classificacao = "Obesidade Grau III - Mórbida";
        break;
      default:
        classificacao = "Altura ou peso informado são inválidos!";
    }
    return classificacao;
  }
}
