import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: HamsterGacha()));

class HamsterGacha extends StatefulWidget {
  const HamsterGacha({super.key});

  @override
  State<HamsterGacha> createState() => _HamsterGachaState();
}

class _HamsterGachaState extends State<HamsterGacha> {
  int n = 0, e = 0;
  bool loading = false;
  final emojis = ['🐹', '💨', '🐹', '✨'];
  final images = [
    'https://kmc2400.github.io/hamster-images/acidfern-_ASImGUewVM-unsplash.jpg',
    'https://kmc2400.github.io/hamster-images/adela-monczkova-IvJa_c8THWg-unsplash.jpg',
    'https://kmc2400.github.io/hamster-images/alex-konokh-6MKJbkZ0qNY-unsplash.jpg',
  ];

  Future<void> gacha() async {
    setState(() => loading = true);
    for (int i = 0; i < 10; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() => e = (e + 1) % emojis.length);
    }
    setState(() {
      n = Random().nextInt(images.length);
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('🐹 Hamster Gacha')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: loading
                ? Center(
                    child: Text(
                      emojis[e],
                      style: const TextStyle(fontSize: 100),
                    ),
                  )
                : Image.network(images[n], fit: BoxFit.cover),
          ),
          const SizedBox(height: 30),
          const Text('🎰', style: TextStyle(fontSize: 72)),
          ElevatedButton(
            onPressed: loading ? null : gacha,
            child: const Text('ガチャを回す！'),
          ),
        ],
      ),
    ),
  );
}