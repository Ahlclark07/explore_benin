import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DestinationCard extends StatelessWidget {
  final String nom;
  final String localisation;
  final String etoiles;
  final String image;
  const DestinationCard({
    super.key,
    required this.nom,
    required this.localisation,
    required this.etoiles,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Container(
        width: 300,
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: 289,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(image)),
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.left,
                      nom,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.pin_drop,
                          color: Colors.orange,
                        ),
                        Text(
                          localisation,
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    Text(
                      "4,8",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
