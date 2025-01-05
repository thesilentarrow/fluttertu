// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(
    child:MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

const names = [
  'Liam', 'Emma', 'Noah', 'Olivia', 'James',
  'Ava', 'Alexander', 'Isabella', 'Michael', 'Sophia',
  'Raj', 'Priya', 'Chen', 'Wei', 'Maria',
  'José', 'Yuki', 'Hiroshi', 'Aisha', 'Omar',
  'Lucas', 'Mia', 'Ethan', 'Charlotte', 'Daniel',
  'Sofia', 'Gabriel', 'Luna', 'Leo', 'Maya',
  'Luca', 'Elena', 'Marco', 'Ana', 'Pablo',
  'Nina', 'Kai', 'Zara', 'Adrian', 'Lily',
  'David', 'Sara', 'Thomas', 'Mila', 'Oscar',
  'Eva', 'Hugo', 'Clara', 'Felix', 'Nova'
];

final tickerProvider = StreamProvider((ref)=>
Stream.periodic(
  const Duration(
    seconds:1,
  ),
  (i)=> i+1,
)
);

final namesProvider = StreamProvider(
  (ref)=> ref.watch(tickerProvider.stream).map(
    (count) => names.getRange(0,count),
  ),
);

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final names = ref.watch(namesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auto"),
      ),
      body: names.when(
        data:(names){
          return ListView.builder(
            itemCount:names.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(names.elementAt(index)),
              );
            },
          );
        } ,
        error:(error, stackTrace)=> const Text('Reached the end of the list'),
        loading:()=> const Center(child:CircularProgressIndicator()),
      )
    );
  }
}