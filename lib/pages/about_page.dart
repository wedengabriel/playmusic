import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title:
        const Text(
          "Sobre",
        ),
      ),

      body: Center(

        child: Padding(

          padding:
          const EdgeInsets.all(
              20),

          child: Column(

            mainAxisAlignment:
            MainAxisAlignment.center,

            children: [

              Icon(
                Icons.music_note,
                size:80,
              ),

              SizedBox(
                height:20,
              ),

              Text(
                "PlayMusic",
                style:
                TextStyle(
                  fontSize:28,
                  fontWeight:
                  FontWeight.bold,
                ),
              ),

              SizedBox(
                height:10,
              ),

              Text(
                "Sistema para gerenciamento de músicas",
                textAlign:
                TextAlign.center,
              ),

              SizedBox(
                height:30,
              ),

              Text(
                "Desyree N. Garcia Batista",
              ),

              Text(
                "RU: 986134",
              ),

              Text(
                "Análise e Desenvolvimento de Sistemas",
              ),

              Text(
                "UNINTER • 2026",
              ),
            ],
          ),
        ),
      ),
    );
  }
}