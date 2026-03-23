import 'dart:async';
import 'package:flutter/material.dart';

class LifecycleScreen extends StatefulWidget {
  const LifecycleScreen({super.key});

  @override
  State<LifecycleScreen> createState() => _LifecycleScreenState();
}

class _LifecycleScreenState extends State<LifecycleScreen> {
  late Timer _timer;
  int _seconds = 0;
  int _rebuilds = 0;

  @override
  void initState() {
    super.initState();
    print('🟢 initState() => widget is born!');

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _seconds++;
      });
      print('⏱ tick... seconds: $_seconds');
    });
  }

  @override
  Widget build(BuildContext context) {
    _rebuilds++;
    print('🟡 build() => rebuild #$_rebuilds');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lifecycle Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Widget alive for:',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '$_seconds seconds',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'build() called: $_rebuilds times',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    print('🔴 dispose() => widget destroyed!');
    super.dispose();
  }
}