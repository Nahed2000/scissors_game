import 'package:flutter/material.dart';
import 'package:scissors_game/screen/game_screen.dart';
import 'package:scissors_game/utils/game.dart';
import 'package:scissors_game/widget/game_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double btnWidth = MediaQuery.of(context).size.width / 2 - 40;
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
                    style: TextStyle(
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
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: MediaQuery.of(context).size.width / 2 -
                          btnWidth / 2 -
                          20,
                      child: Hero(
                        tag: "Rock",
                        child: gameButton(
                          image: 'assets/rock_btn.png',
                          imageWidth: btnWidth,
                          onTap: () {
                            print('Tou choice Rock!');
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    GameScreen(Choice(type: 'Rock')),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: btnWidth,
                      left: MediaQuery.of(context).size.width / 2 -
                          btnWidth -
                          40,
                      child: Hero(
                        tag: "Paper",
                        child: gameButton(
                          image: 'assets/paper_btn.png',
                          imageWidth: btnWidth,
                          onTap: () {
                            print('Tou choice Paper!');
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    GameScreen(Choice(type: 'Paper')),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: btnWidth,
                      right:
                          MediaQuery.of(context).size.width / 2 - btnWidth - 40,
                      child: Hero(
                        tag: 'Scissor',
                        child: gameButton(
                          image: 'assets/scisor_btn.png',
                          imageWidth: btnWidth,
                          onTap: () {
                            print('Tou choice Scisor!');
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => GameScreen(Choice(type: 'Scissor')),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
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
