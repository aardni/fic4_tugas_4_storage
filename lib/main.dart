import 'package:fic4_tugas_4_storage/counter_shared_preference.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CounterPage());
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;
  void _getDataCounter() async {
    _counter = await CounterSharedPreferences().getData();
    setState(() {});
  }

  void _increment() async {
    await CounterSharedPreferences().saveData(++_counter);
    _getDataCounter();
  }

  void _decrement() async {
    await CounterSharedPreferences().saveData(--_counter);
    _getDataCounter();
  }

  void _removeDataCounter() async {
    await CounterSharedPreferences().removeData();
    _getDataCounter();
  }

  @override
  void initState() {
    super.initState();
    _getDataCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FIC4 Shared Preferences"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$_counter',
                style: const TextStyle(fontSize: 80),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _increment();
                    },
                    child: const Text(
                      "+",
                      style: TextStyle(
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _decrement();
                    },
                    child: const Text(
                      "-",
                      style: TextStyle(
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  _removeDataCounter();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
