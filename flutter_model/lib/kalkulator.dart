import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  double result = 0.0;

  void calculate(String operator) {
    double num1 = double.tryParse(num1Controller.text) ?? 0.0;
    double num2 = double.tryParse(num2Controller.text) ?? 0.0;

    setState(() {
      if (operator == '+') {
        result = num1 + num2;
      } else if (operator == '-') {
        result = num1 - num2;
      } else if (operator == '*') {
        result = num1 * num2;
      } else if (operator == '/') {
        result = num1 / num2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Kalkulator"),
        backgroundColor: const Color.fromARGB(255, 60, 196, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              decoration: InputDecoration(labelText: 'Angka 1'),
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: num2Controller,
              decoration: InputDecoration(labelText: 'Angka 2'),
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: ElevatedButton(
                    onPressed: () => calculate('+'),
                    child: Text('+'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () => calculate('-'),
                    child: Text('-'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () => calculate('*'),
                    child: Text('*'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () => calculate('/'),
                    child: Text('/'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Center(
                child: Text(
                  'Hasil: $result',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
