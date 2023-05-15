import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/internet_bloc/internet_bloc.dart';
import '../logic/internet_bloc/internet_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('connection state'),
        ),
        body: Center(
          child: BlocBuilder<InternetBloc, InternetState>(
            builder: (context, state) {
              if (state is InternetGainedState) {
                return const Text('Connected');
              } else if (state is InternetLostState) {
                return const Text('Not Connected');
              } else {
                return const Text('Loading...');
              }
            },
          ),
        ));
  }
}
