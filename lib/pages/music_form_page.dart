import 'package:flutter/material.dart';
import '../database/app_database.dart';
import '../models/music.dart';

class MusicFormPage extends StatefulWidget {
  final Map? musica;

  const MusicFormPage({
    super.key,
    this.musica,
  });

  @override
  State<MusicFormPage> createState() =>
      _MusicFormPageState();
}

class _MusicFormPageState
    extends State<MusicFormPage> {

  final titulo = TextEditingController();
  final artista = TextEditingController();
  final album = TextEditingController();

  @override
  void initState() {
    super.initState();

    if(widget.musica != null){

      titulo.text =
      widget.musica!['titulo'];

      artista.text =
      widget.musica!['artista'];

      album.text =
      widget.musica!['album'];

    }
  }

  salvar() async {

    final musica = Music(
      titulo: titulo.text,
      artista: artista.text,
      album: album.text,
      genero: "Pop",
      humor: "Animada",
      duracao: 3.5,
      nota: 5,
      favorita: false,
    );

    if(widget.musica == null){

      await AppDatabase
          .inserirMusica(
        musica.toMap(),
      );

    }else{

      musica.id =
      widget.musica!['id'];

      await AppDatabase
          .atualizarMusica(
        musica.toMap(),
      );

    }

    Navigator.pop(
      context,
      true,
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(

          widget.musica==null
          ? "Nova música"
          : "Editar música",

        ),
      ),

      body: Padding(
        padding:
        const EdgeInsets.all(16),

        child: Column(
          children: [

            TextField(
              controller: titulo,
              decoration:
              const InputDecoration(
                labelText: "Título",
              ),
            ),

            TextField(
              controller: artista,
              decoration:
              const InputDecoration(
                labelText: "Artista",
              ),
            ),

            TextField(
              controller: album,
              decoration:
              const InputDecoration(
                labelText: "Álbum",
              ),
            ),

            const SizedBox(
              height:20,
            ),

            SizedBox(

              width:double.infinity,

              child: ElevatedButton(

                onPressed: salvar,

                child:
                const Text(
                  "Salvar",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}