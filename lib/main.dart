
import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const GameApp());
}

const factUri = '" https://api.open5e.com/v1/manifest/ " , "spells" : " https://api.open5e.com/v1/spells/ " , "spelllist" : " https: //api.open5e.com/v1/spelllist/ " , "monsters" : " https://api.open5e.com/v1/monsters/ " , "documents" : " https://api.open5e.com/ v1/documents/ " , "backgrounds" : " https://api.open5e.com/v1/backgrounds/ " , "planes" : " https://api.open5e.com/v1/planes/ " , "sections " : " https://api.open5e.com/v1/sections/ " , "feats" : " https://api.open5e.com/v1/feats/ " , "conditions" : " https://api .open5e.com/v1/conditions/ " , "races" : " https://api.open5e.com/v1/races/ " , "classes" : " https://api.open5e.com/v1/classes / " , "magicitems" : " https://api.open5e.com/v1/magicitems/ "';

Future<String> getDataFromApi() async {
  final Response response = await get(Uri.parse(factUri));
  final jsonString = response.body;
  
  return jsonString;
}

Future<String> getFact()async{
  final String jsonString = await getDataFromApi();
  final Map<String, dynamic> jsonMap = json.decode(jsonString);
    
  final String spells = jsonMap['spells'];
  return spells;
  }

class GameApp extends StatelessWidget {
  const GameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GameCenter(),
    );
  }
}

class GameCenter extends StatefulWidget {
  const GameCenter({super.key});

  @override
  _GameCenterState createState() => _GameCenterState();
}

class _GameCenterState extends State<GameCenter> {
  List<Void> games = [];
  bool isLoading = false;
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Game Center'),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : games.isNotEmpty
                ? GameList(games)
                : const Text('Drücke den Button, um Spiele zu laden.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
        backgroundColor: const Color.fromARGB(255, 5, 74, 106),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class GameList extends StatelessWidget {
  final List<Void> games;

  const GameList(this.games, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: games.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Monsters: ',
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Text('Feats: '),
            ],
          ),
        );
      },
    );
  }
}
