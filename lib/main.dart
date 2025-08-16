import 'package:flutter/material.dart';

void main() => runApp(EchoScape());

class EchoScape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EchoScape',
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Offset _playerPosition = Offset(200, 400);
  List<Offset> _echoes = [];

  void _spawnEcho(TapUpDetails details) {
    setState(() {
      _echoes.add(details.localPosition);
    });
    // No sound is played
  }

  void _movePlayer(DragUpdateDetails details) {
    setState(() {
      _playerPosition += details.delta;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: _spawnEcho,
      onPanUpdate: _movePlayer,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            ..._echoes.map((pos) => Positioned(
              left: pos.dx - 20,
              top: pos.dy - 20,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue.withOpacity(0.5),
                ),
              ),
            )),
            Positioned(
              left: _playerPosition.dx - 25,
              top: _playerPosition.dy - 25,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
