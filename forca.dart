import 'dart:io';

import 'dart:math';

acertou() {}
main() {
  int i;
  int letras;
  bool jogo = true;
  bool jogando;
  bool acerto = false;
  int tentativas;

  List<String> nomes = ["arroz", "feijao", "carne"];
  int sortear = new Random().nextInt(3);
  String palavra = nomes[sortear];

  while (jogo == true) {
    jogando = true;
    tentativas = 6;
    var secreta = new List.filled(palavra.length, "_");

    print("Bem-Vindo a Forca, vamos jogar.");
    print("");

    while (jogando == true) {
      print("Quantidade de tentativas erradas: $tentativas");
      print("");
      print("Palavra Secreta = $secreta");
      print("");
      print("Digite uma letra: ");
      String? chute = stdin.readLineSync();
      print("\x1B[2J\x1B[0;0H");

      for (i = 0; i < palavra.length - 1; i++) {
        if (palavra[i] == chute) {
          secreta[i] = palavra[i];
          acerto = true;
        }
      }

      if (acerto == false) {
        tentativas--;
      }

      acerto = false;
      letras = 0;
      for (i = 0; i < palavra.length - 1; i++) {
        if (secreta[i] == palavra[i]) {
          letras++;
        }
        if (letras == palavra.length) {
          jogando = false;
          print("Voce venceu :)");
          print("");
          print("Quer tentar novamente:");
          String? chute = stdin.readLineSync();
          print("\x1B[2J\x1B[0;0H");
          if (chute == "nao") jogo = false;
        }
      }

      if (tentativas == 0) {
        jogando = false;
        print("Voce perdeu :(");
        print("");
        print("Quer tentar novamente:");
        String? chute = stdin.readLineSync();
        print("\x1B[2J\x1B[0;0H");
        if (chute == "nao") jogo = false;
      }
    }
  }
}
