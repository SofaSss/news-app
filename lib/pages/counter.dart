import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/auth_bloc/auth_bloc.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;

  void incrementCount() {
    setState(() {
      counter++;
    });
  }

  void decrementCount() {
    if(counter > 0 ){
      setState(() {
        counter--;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              '$counter User id: ${BlocProvider.of<AuthBloc>(context).state.user?.id}',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: decrementCount,
                  child: const Icon(Icons.keyboard_arrow_left),
                ),
                const SizedBox(width: 100, height: 75,),
                FloatingActionButton(
                  onPressed: incrementCount,
                  child: const Icon(Icons.keyboard_arrow_right),
                ),
              ],
            ),
          ],
        ),
      ),





    );
  }
}
