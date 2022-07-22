import 'dart:math';

class Game {
  static int score = 0;
  static List<String> choices = [
    'Rock',
    'Paper',
    'Scissor',
  ];
 static  String? randomChoice(){
    Random random = new Random();
    int indexRandom = random.nextInt(3);
    return choices[indexRandom];
  }
}

class Choice {
  Choice({required this.type});
  String? type = '';
  static var gameRule = {
    "Rock": {
      "Rock": "It's a Draw",
      "Paper": "You Lose",
      "Scissor": "You Win",
    },
    "Paper": {
      "Rock": "You Win",
      "Paper": "It's a Draw",
      "Scissor": "You Loss",
    },
    "Scissor": {
      "Rock": "You Loss",
      "Paper": "You Win",
      "Scissor": "It's a Draw",
    }
  };
}
