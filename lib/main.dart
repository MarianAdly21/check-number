import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const RandomNumber());
}

class RandomNumber extends StatefulWidget {
  const RandomNumber({super.key});

  @override
  State<RandomNumber> createState() => _RandomNumberState();
}

class _RandomNumberState extends State<RandomNumber> {
  late int randomNumber1;
  late int randomNumber2;
  String? x;

  @override
  void initState() {
    super.initState();
    getRandomNumber();
  }

  void getRandomNumber() {
    setState(() {
      randomNumber2 = Random().nextInt(100);
      randomNumber1 = Random().nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff8e76b8),
          title: const Text(
            "Number Test",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    if (randomNumber1 > randomNumber2) {
                      setState(() {
                        x = "Correct";
                      });
                    } else {
                      setState(() {
                        x = "NotCorrect";
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xff8e76b8),
                    ),
                    height: 90,
                    width: 155,
                    child: Center(
                      child: Text(
                        randomNumber1.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (randomNumber2 > randomNumber1) {
                      setState(() {
                        x = "Correct";
                      });
                    } else {
                      setState(() {
                        x = "NotCorrect";
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xff8e76b8),
                    ),
                    height: 90,
                    width: 155,
                    child: Center(
                      child: Text(
                        randomNumber2.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            x != null
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: x == "Correct" ? Colors.green : Colors.red,
                    ),
                    height: 90,
                    width: 155,
                    child: Center(
                      child: Text(
                        '$x',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 150,
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  getRandomNumber();
                  x = null;
                },
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
