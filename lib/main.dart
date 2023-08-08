import 'package:flutter/material.dart';
import 'package:flutter_provider_state_management/counter_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //  Make the multi provider widget if you the multiple providers in the page if you have  single provider then use the simple  provider
      //
      home: MultiProvider(providers: [
        // here you can add a list of change notifier providers where you can input the provider that you make with it's initial value
        ChangeNotifierProvider(
          create: (context) => CounterProvider(counter: 0),
        )
        // here you can the child which you removed before
      ], child: const MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //  make the reference of the provider you make
  late CounterProvider counterProvider;
  // int _counter = 0;

// make the function that will bee called on the event and inner call the  function's of the provider you make to apply any type of the change
  void _incrementCounter() {
    counterProvider.incrementCounter();
  }

  void _decrementCounter() {
    counterProvider.decrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    // Here you can initialize the provider using provider.of & make it's listenable false
    counterProvider = Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //  Consumer is used where you have to apply some change on the screen
            Consumer<CounterProvider>(
              builder: (context, value, child) {
                return Text(value.counter.toString());
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    //  here call the functions where you can add the provider functions
                    _incrementCounter();
                  },
                  child: Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    _decrementCounter();
                  },
                  child: Icon(Icons.delete),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
