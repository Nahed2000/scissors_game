import 'package:flutter/material.dart';
import 'package:scissors_game/screen/home_screen.dart';

import '../utils/game.dart';
import '../widget/game_button.dart';

class GameScreen extends StatefulWidget {
  GameScreen(this.gameChoice, {Key? key}) : super(key: key);

  Choice gameChoice;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width / 2 - 40;

    String? robotoChois = Game.randomChoice();
    String? robotoChoisPath = "";
    switch (robotoChois) {
      case "Rock":
        robotoChoisPath = 'assets/rock_btn.png';
        break;
      case "Paper":
        robotoChoisPath = 'assets/paper_btn.png';
        break;
      case "Scissor":
        robotoChoisPath = 'assets/scisor_btn.png';
        break;
    }

    String? playerChoice;
    switch (widget.gameChoice.type) {
      case "Rock":
        playerChoice = 'assets/rock_btn.png';
        break;
      case "Paper":
        playerChoice = 'assets/paper_btn.png';
        break;
      case "Scissor":
        playerChoice = 'assets/scisor_btn.png';
        break;
    }
    if (Choice.gameRule[widget.gameChoice.type]![robotoChois] == 'You Win') {
      setState(() {
        Game.score++;
      });
    }

    return Scaffold(
      backgroundColor: const Color(0xff060a47),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'SCORE',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    '${Game.score}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Hero(
                        tag: "${widget.gameChoice.type}",
                        child: gameButton(
                          image: playerChoice!,
                          imageWidth: btnWidth,
                          onTap: () {},
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    const Text(
                      'VS',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                        child: gameButton(
                            image: robotoChoisPath,
                            imageWidth: btnWidth,
                            onTap: () {}))
                  ],
                ),
              ),
            ),
            Text(
              "${Choice.gameRule[widget.gameChoice.type]![robotoChois]}",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  wordSpacing: 2),
            ),
            Container(
                width: double.infinity,
                child: RawMaterialButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  shape: const StadiumBorder(
                      side: BorderSide(color: Colors.white, width: 5)),
                  child: const Text(
                    'Play Again',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                )),
            Container(
                width: double.infinity,
                child: RawMaterialButton(
                  onPressed: () {},
                  padding: const EdgeInsets.all(16),
                  shape: const StadiumBorder(
                      side: BorderSide(color: Colors.white, width: 5)),
                  child: const Text(
                    'RESULT',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
