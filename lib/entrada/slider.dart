import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _sliderValue = 20.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Olá Flutter')),
        body: Center(
          child: Column(
            children: [
              Text("Slider (Valor: ${_sliderValue.round()}):"),
              Slider(
                value: _sliderValue,
                min: 0,
                max: 100,
                divisions: 100,
                label: _sliderValue.round().toString(),
                onChanged: (double val) => setState(() => _sliderValue = val),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
