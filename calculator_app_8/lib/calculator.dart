import 'package:calculator_app_8/components/app.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
// ignore: depend_on_referenced_packages
//import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Text(
                    userInput.toString(),
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Text(
                    answer.toString(),
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: [
                        App(
                          title: 'AC',
                          onpress: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        App(
                          title: 'x',
                          onpress: () {
                            if (userInput.isNotEmpty) {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                              setState(() {});
                            }
                          },
                        ),
                        App(
                          title: '%',
                          onpress: () {
                            userInput = userInput + '%';
                            setState(() {});
                          },
                        ),
                        App(
                          title: '/',
                          color: Colors.orangeAccent,
                          onpress: () {
                            userInput = userInput + '/';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        App(
                          title: '7',
                          onpress: () {
                            userInput = userInput + '7';
                            setState(() {});
                          },
                        ),
                        App(
                          title: '8',
                          onpress: () {
                            userInput = userInput + '8';
                            setState(() {});
                          },
                        ),
                        App(
                          title: '0',
                          onpress: () {
                            userInput = userInput + '0';
                            setState(() {});
                          },
                        ),
                        App(
                          title: '*',
                          color: Colors.orangeAccent,
                          onpress: () {
                            userInput = userInput + '*';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        App(
                          title: '4',
                          onpress: () {
                            userInput = userInput + '4';
                            setState(() {});
                          },
                        ),
                        App(
                          title: '5',
                          onpress: () {
                            userInput = userInput + '5';
                            setState(() {});
                          },
                        ),
                        App(
                          title: '6',
                          onpress: () {
                            userInput = userInput + '6';
                            setState(() {});
                          },
                        ),
                        App(
                          title: '-',
                          color: Colors.orangeAccent,
                          onpress: () {
                            userInput = userInput + '-';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        App(
                          title: '1',
                          onpress: () {
                            userInput = userInput + '1';
                            setState(() {});
                          },
                        ),
                        App(
                          title: '2',
                          onpress: () {
                            userInput = userInput + '2';
                            setState(() {});
                          },
                        ),
                        App(
                          title: '3',
                          onpress: () {
                            userInput = userInput + '3';
                            setState(() {});
                          },
                        ),
                        App(
                          title: '+',
                          color: Colors.orangeAccent,
                          onpress: () {
                            userInput = userInput + '+';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        App(
                          title: '0',
                          onpress: () {
                            userInput = userInput + '0';
                            setState(() {});
                          },
                        ),
                        App(
                          title: '.',
                          onpress: () {
                            userInput = userInput + '.';
                            setState(() {});
                          },
                        ),
                        App(
                          title: 'DEL',
                          onpress: () {
                            if (userInput.isNotEmpty) {
                              userInput =
                                  userInput.substring(0, userInput.length - 1);
                            }
                            setState(() {});
                          },
                        ),
                        App(
                          title: '=',
                          color: Colors.orangeAccent,
                          onpress: () {
                            equalPress();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void equalPress() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
