import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _count = 0;
  String _message = 'Press + to start!';

  void increment() {
    setState(() {
      _count++;
      _message = 'Going up! 🚀';
    });
  }

  void decrement() {
    setState(() {
      if (_count > 0) {
        _count--;
      }
      _message = _count == 0 ? 'Cannot go lower!' : 'Going down! 🔽';
    });
  }

  void reset() {
    setState(() {
      _count = 0;
      _message = 'Reset! Fresh start 🔄';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Counter'),
        backgroundColor: Colors.green.shade700,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _message,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '$_count',
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: decrement,
                  child: const Text('-', style: TextStyle(fontSize: 24)),
                ),
                const SizedBox(width: 20),
                OutlinedButton(
                  onPressed: reset,
                  child: const Text('Reset'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: increment,
                  child: const Text('+', style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}