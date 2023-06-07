import 'package:flutter/material.dart';

class Medicamento extends StatelessWidget {
  const Medicamento({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text(
              'Se preocupe menos \nViva com saúde',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Dose diária',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Text(
              '0',
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ));
  }
}
