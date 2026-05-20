import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  final int total;

  const StatisticsPage({
    super.key,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title:
        const Text(
          "📊 Estatísticas",
        ),
      ),

      body: Padding(

        padding:
        const EdgeInsets.all(
            16),

        child: Column(

          children: [

            Card(
              child: ListTile(

                leading:
                const Icon(
                  Icons.music_note,
                ),

                title:
                const Text(
                  "Total de músicas",
                ),

                trailing:
                Text(
                  "$total",
                  style:
                  const TextStyle(
                    fontSize:22,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height:20,
            ),

            Card(
              child: ListTile(

                leading:
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),

                title:
                const Text(
                  "Favoritas",
                ),

                trailing:
                const Text(
                  "0",
                  style:
                  TextStyle(
                    fontSize:22,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height:20,
            ),

            Card(
              child: ListTile(

                leading:
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),

                title:
                const Text(
                  "Média das notas",
                ),

                trailing:
                const Text(
                  "5",
                  style:
                  TextStyle(
                    fontSize:22,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}