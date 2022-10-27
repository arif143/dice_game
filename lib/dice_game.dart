import 'dart:math';
import 'package:dice_game/styles.dart';
import 'package:flutter/material.dart';

class DiceGame extends StatefulWidget {
  final double gravity = 9.8;
  const DiceGame({Key? key}) : super(key: key);

  @override
  State<DiceGame> createState() => _DiceGameState();
}

class _DiceGameState extends State<DiceGame> {
  final _random = Random.secure();
  int _score=0, _highestScore=0, _sum=0, _index1=0, _index2=0;
  bool _isGameOver=false;
  final _diceList=[
    'pictures/d1.png',
    'pictures/d2.png',
    'pictures/d3.png',
    'pictures/d4.png',
    'pictures/d5.png',
    'pictures/d6.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dice Game'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Score:$_score',style: myTextStyle,),
            Text('Highest Score:$_highestScore',style: myTextStyle,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(_diceList[_index1],width: 100,height: 100,),
                SizedBox(width: 10,),
                Image.asset(_diceList[_index2],width: 100,height: 100,),
              ],
            ),
            Text('Dice Sum:$_sum',style: myTextStyle,),
            if(_isGameOver) Text('Game Over!!!',style: myTextStyle.copyWith(color: Colors.red, fontSize: 35),),
            if(!_isGameOver)ElevatedButton(
                child: Text('Roll'),
              onPressed: _rollTheDice,
            ),
            if(_isGameOver) ElevatedButton(
              child: Text('Reset'),
              onPressed: _reset,
            ),
          ],
        ),
      ),
    );
  }

  void _rollTheDice() {
    setState(() {
      _index1=_random.nextInt(6);
      _index2=_random.nextInt(6);
      _sum = (_index1+_index2)+2;
      _score = (_score+_sum);
      _highestScore = _score;
      if(_sum == 7){
       _isGameOver = true;
      }else{
        _isGameOver = false;
      }
    });
  }

  void _reset() {
    setState(() {
      _score = 0;
      _sum = 0;
      _isGameOver = false;
    });
  }
}