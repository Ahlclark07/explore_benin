import 'package:explore_benin/theme/decoration.dart';
import 'package:explore_benin/theme/palette.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children: [
        Container(
          height: screenHeight,
          color: Palette.primary,
          child: Center(
            child: Transform.translate(
              offset: Offset(0, -screenHeight * .12),
              child: Container(
                width: 200,
                height: 200,
                color: Palette.background,
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            child: ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                width: screenWidth,
                color: Palette.background,
                height: screenHeight * 48 / 100,
                padding: EdgeInsets.only(bottom: 30),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  margin: EdgeInsets.only(top: screenHeight * .14),
                  child: Column(children: [
                    Text(
                      "Commencez",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 35),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 80, bottom: 18),
                      height: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Palette.primary),
                      width: 130,
                    ),
                    const Text(
                      "Démarrez votre aventure maintenant et découvrez les meilleures destinations du Bénin !",
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: ContainerDecoration.roundedYellow,
                      child: IconButton(
                          onPressed: () => Navigator.of(context)
                              .popAndPushNamed("/connexion"),
                          icon: const Icon(
                            Icons.arrow_forward,
                            size: 27,
                          )),
                    )
                  ]),
                ),
              ),
            ))
      ]),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.lineTo(0, h);

    path.lineTo(w, h);
    path.quadraticBezierTo(w + 30, h * 0.35, w * .8, h * .27);
    path.quadraticBezierTo(w * .7, h * .26, w * .3, h * .25);
    path.quadraticBezierTo(w * .05, h * .26, 0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
