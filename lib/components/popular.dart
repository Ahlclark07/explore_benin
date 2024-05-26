import 'package:explore_benin/models/game.dart';
import 'package:flutter/material.dart';

class PopularGame extends StatelessWidget {
  PopularGame({super.key});

  final List<Game> games = Game.games();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Container(),
            ),
          ),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              width: 250, // Fixer une taille au conteneur de l'image
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Hero(
                      tag: 'game_${index}',
                      child: Image.asset(
                        games[index].bgImage,
                        fit: BoxFit
                            .cover, // Faire en sorte que l'image remplisse le conteneur
                      ),
                    ),
                  ),
                  SizedBox(height: 8), // Espacement entre l'image et le texte
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Aligner les éléments à l'extrémité de la ligne
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            games[index]
                                .placeName, // Afficher le nom de la place
                            style: TextStyle(
                              fontSize: 16, // Taille du texte
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on), // Icône de localisation
                              Text(
                                games[index]
                                    .location, // Afficher la localisation
                                style: TextStyle(
                                  fontSize: 14, // Taille du texte
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '${games[index].starRating}', // Nombre d'étoiles
                            style: TextStyle(
                              fontSize: 18, // Taille du texte
                            ),
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 18, // Taille de l'icône
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: games.length,
      ),
    );
  }
}
