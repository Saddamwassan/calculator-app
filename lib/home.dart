import 'package:calculator/components/SmartButton.dart';
import 'package:calculator/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userInput = '';
  var answer = '';
  var newanswer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Opacity(
                        opacity: 0.8,
                        child: Text(
                          userInput.toString(),
                          style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      answer.toString(),
                      style: TextStyle(fontSize: 29, color: Colors.white),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    // Text(
                    //   "CAlculator",
                    //   style: mytext,
                    // ),
                    Row(
                      children: [
                        SmartBotton(
                            title: 'AC',
                            onpress: () {
                              userInput = '';
                              answer = '';
                              setState(() {});
                            }),
                        SmartBotton(
                            title: 'ev',
                            onpress: () {
                              userInput += '';
                              setState(() {});
                            }),
                        SmartBotton(
                            title: '%',
                            onpress: () {
                              answer += '%';
                              setState(() {});
                            }),
                        SmartBotton(
                            title: '/',
                            color: Colors.orange,
                            onpress: () {
                              answer += '/';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        SmartBotton(
                            title: '7',
                            onpress: () {
                              answer += '7';
                              setState(() {});
                            }),
                        SmartBotton(
                            title: '8',
                            onpress: () {
                              answer += '8';
                              setState(() {});
                            }),
                        SmartBotton(
                            title: '9',
                            onpress: () {
                              answer += '9';
                              setState(() {});
                            }),
                        SmartBotton(
                            title: 'x',
                            color: Colors.orange,
                            onpress: () {
                              answer += 'x';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        SmartBotton(
                            title: '4',
                            onpress: () {
                              answer += '4';
                              setState(() {});
                            }),
                        SmartBotton(
                            title: '5',
                            onpress: () {
                              answer += '5';
                              setState(() {});
                            }),
                        SmartBotton(
                            title: '6',
                            onpress: () {
                              answer += '6';
                              setState(() {});
                            }),
                        SmartBotton(
                            title: '-',
                            color: Colors.orange,
                            onpress: () {
                              answer += '-';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        SmartBotton(
                            title: '1',
                            onpress: () {
                              answer += '1';
                              setState(() {});
                            }),
                        SmartBotton(
                            title: '2',
                            onpress: () {
                              answer += '2';
                              setState(() {});
                            }),
                        SmartBotton(
                            title: '3',
                            onpress: () {
                              answer += '3';
                              setState(() {});
                            }),
                        SmartBotton(
                            title: '+',
                            color: Colors.orange,
                            onpress: () {
                              answer += '+';
                              setState(() {});
                            }),
                      ],
                    ),
                    Row(
                      children: [
                        SmartBotton(
                            title: '0',
                            onpress: () {
                              answer += '0';
                              setState(() {});
                            }),
                        SmartBotton(
                            title: '.',
                            onpress: () {
                              answer += '.';
                              setState(() {});
                            }),
                        SmartBotton(
                            title: 'DEL',
                            onpress: () {
                              answer = answer.substring(0, answer.length - 1);
                              setState(() {});
                            }),
                        SmartBotton(
                            title: '=',
                            color: Colors.orange,
                            onpress: () {
                              morepress();

                              setState(() {});
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void morepress() {
    String finaluserInput = '';
    finaluserInput = answer.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finaluserInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userInput = answer;
    answer = eval.toString();
  }
}
