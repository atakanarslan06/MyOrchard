import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meyvebahcem/Bitkiler/bitki_bloc.dart';
import 'package:meyvebahcem/Bitkiler/bloc_status.dart';

import '../../Bitkiler/bitki_state.dart';

class BitkilerSayfa extends StatefulWidget {
  const BitkilerSayfa({Key? key}) : super(key: key);

  @override
  State<BitkilerSayfa> createState() => _BitkilerSayfaState();
}

class _BitkilerSayfaState extends State<BitkilerSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BitkiBloc, BitkiState>(builder: (context, state) {
        if (state.appStatus == SubmissionLoading()) {
          return CircularProgressIndicator();
        } else {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Icon(Icons.abc),
                        Text("aaaa"),
                      ],
                    ),
                  );
                }),
          );
        }
      }),
    );
  }
}
