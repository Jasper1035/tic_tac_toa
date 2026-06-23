import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> displaySign = ['', '', '', '', '', '', '', '', ''];

  bool xTurn = true; // the first player is x

  void tapped(int index) {
    setState(() {
      if (xTurn && displaySign[index] == '') {
        displaySign[index] = 'x';
        filledBox += 1;
      } else if (!xTurn && displaySign[index] == '') {
        displaySign[index] = 'o';
        filledBox += 1;
      }

      xTurn = !xTurn;
      checkwinner();
    });
  }

  void checkwinner() {
    if (displaySign[0] == displaySign[1] &&
        displaySign[0] == displaySign[2] &&
        displaySign[0] != '') {
      showwinDialog(displaySign[0]);
    } else if (displaySign[3] == displaySign[4] &&
        displaySign[3] == displaySign[5] &&
        displaySign[3] != '') {
      showwinDialog(displaySign[4]);
    } else if (displaySign[6] == displaySign[7] &&
        displaySign[6] == displaySign[8] &&
        displaySign[6] != '') {
      showwinDialog(displaySign[8]);
    } else if (displaySign[0] == displaySign[3] &&
        displaySign[0] == displaySign[6] &&
        displaySign[0] != '') {
      showwinDialog(displaySign[6]);
    } else if (displaySign[1] == displaySign[4] &&
        displaySign[1] == displaySign[7] &&
        displaySign[1] != '') {
      showwinDialog(displaySign[7]);
    } else if (displaySign[2] == displaySign[5] &&
        displaySign[2] == displaySign[8] &&
        displaySign[2] != '') {
      showwinDialog(displaySign[5]);
    }

    if (displaySign[0] == displaySign[4] &&
        displaySign[0] == displaySign[8] &&
        displaySign[0] != '') {
      showwinDialog(displaySign[4]);
    } else if (displaySign[2] == displaySign[4] &&
        displaySign[2] == displaySign[6] &&
        displaySign[2] != '') {
      showwinDialog(displaySign[6]);
    } else if (filledBox == 9) {
      showDrawDialog();
    }
  }

  void showwinDialog(String winner) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          actions: [
            IconButton(
              onPressed: () {
                clearBoard();
                Navigator.pop(context);
              },
              icon: Icon(Icons.restart_alt_rounded, size: 50),
            ),
          ],
          title: Text('Winner is $winner'),
        );
      },
    );

    if (winner == 'o') {
      scoreo += 1;
    } else {
      scorex += 1;
    }
  }

  void showDrawDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          actions: [
            IconButton(
              onPressed: () {
                clearBoard();
                Navigator.pop(context);
              },
              icon: Icon(Icons.restart_alt_rounded, size: 50),
            ),
          ],
          title: Text('Match is Draw'),
        );
      },
    );
  }

  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displaySign[i] = '';
      }
    });
    filledBox = 0;
  }

  int filledBox = 0;
  int scorex = 0;
  int scoreo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 15),
                      Text(
                        'Score Board',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Player x',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                scorex.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'player o',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                scoreo.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 198, 197, 197),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          displaySign[index],
                          style: TextStyle(color: Colors.white, fontSize: 45),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
