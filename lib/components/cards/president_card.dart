import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PresidentCard extends StatelessWidget {
  const PresidentCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.blue, width: 5),
              boxShadow: [
                BoxShadow(spreadRadius: 2, blurRadius: 3, color: Colors.black12)
              ],
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                "https://thumbor.comeup.com/unsafe/158x158/filters:quality(90):no_upscale()/user/5299c83c-271a-4ef9-b2a1-4b78391b9015.jpg",
              ))),
        ),
        Container(
          width: 120,
          margin: const EdgeInsets.only(top: 6),
          child: Expanded(
            child: Text(
              textAlign: TextAlign.center,
              "Pr. Ahmal Bilal SEIDOU",
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
            ),
          ),
        ),
        Container(
          width: 100,
          margin: const EdgeInsets.only(top: 6),
          child: Expanded(
            child: Text(
              textAlign: TextAlign.center,
              "10-10-2020 à 10-11-2024",
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ),
        )
      ],
    );
  }
}
