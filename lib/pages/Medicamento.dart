import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:telahome/pages/MedicamentoAdd.dart';

class Medicamento extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    List<DateTime> dates = [];

    // Adicionar os dias anteriores ao dia atual
    for (int i = -10; i <= 0; i++) {
      DateTime date = now.add(Duration(days: i));
      dates.add(date);
    }

    // Adicionar os dias posteriores ao dia atual
    for (int i = 1; i <= 10; i++) {
      DateTime date = now.add(Duration(days: i));
      dates.add(date);
    }

    // Encontrar o índice da data atual
    int currentIndex = dates.indexWhere((date) => isSameDay(date, now));

    // Role para a data atual
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _scrollController.animateTo(
        currentIndex *
            58.0, // Largura do container de data (50) + margem direita (8)
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 16, top: 40, bottom: 8),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // Implemente aqui a ação ao pressionar o ícone de voltar
                  },
                  child: Container(
                    width: 20,
                    height: 40,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 24,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "Medicamentos",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            child: Row(
              children: [
                for (var date in dates) _buildDateContainer(date, now),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MedicamentoAdd()),
          );
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildDateContainer(DateTime date, DateTime now) {
    bool isToday = isSameDay(date, now);
    bool isBeforeToday = date.isBefore(now);

    return Container(
      width: 50,
      height: 65,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isToday ? Colors.green : Color(0xff9dcf88),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat('EEE', 'pt_BR').format(date).toUpperCase(),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 4),
          Text(
            DateFormat('d', 'pt_BR').format(date),
            style: TextStyle(
              fontSize: isToday ? 18 : 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}

void main() async {
  // Inicializar dados de formatação de data e hora
  await initializeDateFormatting();

  runApp(MaterialApp(
    home: Medicamento(),
  ));
}
