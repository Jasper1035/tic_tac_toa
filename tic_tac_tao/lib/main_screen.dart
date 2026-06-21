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
      if (xTurn) {
        displaySign[index] = 'x';
      } else {
        displaySign[index] = 'o';
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
    }
  }

  void showwinDialog(String winner) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(title: Text('Winner is $winner'));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: GridView.builder(
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
    );
  }
}
