import 'package:flutter/material.dart';

class Agua extends StatefulWidget {
  @override
  State<Agua> createState() => _AguaState();
}

class _AguaState extends State<Agua> {
  bool messageVisible = false;
  double sWidth = 0;
  double sHeight = 0;
  int weight = 0;
  double idealIntake = 0;
  int goal = 0;

  @override
  void initState() {
    super.initState();
    // Inicialização dos valores iniciais
    weight = 70; // Exemplo de peso
    goal = 2000; // Exemplo de meta de ingestão de água
    idealIntake = (weight * 0.033 * 1000); // Cálculo da ingestão ideal
  }

  @override
  Widget build(BuildContext context) {
    sWidth = MediaQuery.of(context).size.width;
    sHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(000),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: sHeight * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: sWidth * 0.7,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Color(0xff4FA8C5),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Title',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: sHeight * 0.01),
            WaterContainer(weight, goal),
            SizedBox(height: sHeight * 0.01),
            Align(
              alignment: Alignment.center,
              child: Text(
                'You Drank',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: sHeight * 0.01),
            Container(
              height: sHeight * 0.336,
              child: ListScreenWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class WaterContainer extends StatelessWidget {
  final int weight;
  final int goal;

  WaterContainer(this.weight, this.goal);

  @override
  Widget build(BuildContext context) {
    double idealIntake = (weight * 0.033 * 1000); // Cálculo da ingestão ideal
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Water Intake Goal',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '$goal ml',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Ideal Intake',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          '${idealIntake.toStringAsFixed(0)} ml',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class ListScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.local_drink),
          title: Text('Water 1'),
        ),
        ListTile(
          leading: Icon(Icons.local_drink),
          title: Text('Water 2'),
        ),
        ListTile(
          leading: Icon(Icons.local_drink),
          title: Text('Water 3'),
        ),
      ],
    );
  }
}
