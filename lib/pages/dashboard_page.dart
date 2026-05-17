import 'package:flutter/material.dart';
import 'statistics_page.dart';
import '../database/app_database.dart';
import 'music_form_page.dart';
import 'about_page.dart';

class DashboardPage extends StatefulWidget {

  final bool temaEscuro;
  final Function alternarTema;

  const DashboardPage({
    super.key,
    required this.temaEscuro,
    required this.alternarTema,
  });

  @override
  State<DashboardPage> createState() =>
      _DashboardPageState();
}

class _DashboardPageState
    extends State<DashboardPage> {

  List musicas = [];

  List todasMusicas = [];
  String pesquisa = "";

  carregar() async {

    final lista =
    await AppDatabase.listarMusicas();

    setState(() {

      todasMusicas = lista;

      musicas = lista;

    });
  }

  @override
  void initState() {
    super.initState();

    carregar();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

      title: const Text(
        "🎵 PlayMusic",
      ),

      actions:[

        IconButton(
          icon: const Icon(
            Icons.bar_chart,
          ),

          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return StatisticsPage(
                    total: musicas.length,
                  );
                },
              ),
            );
          },
        ),

        IconButton(

          icon:
          const Icon(
            Icons.info,
          ),

          onPressed:(){

            Navigator.push(

              context,

              MaterialPageRoute(

                builder:(_){

                  return const
                  AboutPage();

                },
              ),
            );
          },
        ),
      ],
      ),

      body: Padding(

        padding:
        const EdgeInsets.all(16),

        child: Column(
          children: [

            Row(
              children: [

                Expanded(
                  child: Card(
                    child: Padding(
                      padding:
                      EdgeInsets.all(
                          16),

                      child: Column(
                        children: [

                          Icon(
                            Icons.music_note,
                          ),

                          Text(
                            "${musicas.length}",
                            style:
                            TextStyle(
                              fontSize:22,
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),

                          Text(
                              "Músicas"
                          )
                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),

            SizedBox(height:20),

            TextField(

              decoration: InputDecoration(

                hintText: "Buscar música",

                prefixIcon:
                const Icon(
                  Icons.search,
                ),

                border:
                OutlineInputBorder(

                  borderRadius:
                  BorderRadius.circular(
                      12),

                ),
              ),

              onChanged:(texto){

                setState(() {

                  pesquisa =
                  texto.toLowerCase();

                  musicas =
                  todasMusicas.where(
                          (musica){

                        return musica[
                        'titulo']

                            .toString()

                            .toLowerCase()

                            .contains(
                            pesquisa);

                      }

                  ).toList();

                });

              },
            ),

            const SizedBox(
              height:20,
            ),

            Expanded(

              child:

              musicas.isEmpty

                  ? Center(
                child: Text(
                  "Nenhuma música cadastrada",
                ),
              )

                  : ListView.builder(

                itemCount:
                musicas.length,

                itemBuilder:
                    (_,i){

                  return Card(

                    child:
                    ListTile(

                      onTap: () async {

                        await Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (_) {

                              return MusicFormPage(
                                musica: musicas[i],
                              );

                            },
                          ),
                        );

                        carregar();
                      },

                      leading:
                      Icon(
                        Icons.album,
                      ),

                      title:
                      Text(
                        musicas[i]
                        ['titulo'],
                      ),

                      subtitle: Text(
                        musicas[i]['artista'],
                      ),

                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),

                        onPressed: () async {

                          await AppDatabase.excluirMusica(
                            musicas[i]['id'],
                          );

                          carregar();
                        },
                      ),

                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),

      floatingActionButton:
      FloatingActionButton(

        onPressed: () async {

          final salvou =
          await Navigator.push(

            context,

            MaterialPageRoute(
              builder:(_){

                return const
                MusicFormPage();

              },
            ),
          );

          if(salvou==true){
            carregar();
          }
        },

        child:
        const Icon(
          Icons.add,
        ),
      ),
    );
  }
}