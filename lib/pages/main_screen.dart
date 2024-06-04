import 'package:cached_network_image/cached_network_image.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:explore_benin/components/cards/hebergement_card.dart';
import 'package:explore_benin/components/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import '../components/cards/destination_card.dart';
import '../components/cards/president_card.dart';
import '../components/custom_tab_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageActuelle = 0;
  final listPages = [
    const HomeInnerPage(),
    Container(),
    Container(),
    Container()
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(0),
      width: size.width,
      height: size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/fond.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 36,
              ),
              onPressed: null,
            ),
          ),
          title: const Text(
            "Cotonou, Littoral",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          actions: [
            Container(
              width: 55,
              height: 55,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                  image: const DecorationImage(
                      image: CachedNetworkImageProvider(
                    "https://thumbor.comeup.com/unsafe/158x158/filters:quality(90):no_upscale()/user/5299c83c-271a-4ef9-b2a1-4b78391b9015.jpg",
                  ))),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Builder(builder: (context) {
            return listPages[pageActuelle];
          }),
        ),
        bottomNavigationBar: CustomBottomNavigationBar(
          index: pageActuelle,
          callback: (i) => setState(() {
            pageActuelle = i;
          }),
        ),
      ),
    );
  }
}

class HomeInnerPage extends StatefulWidget {
  const HomeInnerPage({
    super.key,
  });

  @override
  State<HomeInnerPage> createState() => _HomeInnerPageState();
}

class _HomeInnerPageState extends State<HomeInnerPage> {
  int tabActif = 0;
  final List<String> titres = [
    "Desitinations",
    "Hébergements",
    "Restaurants",
    "Evènements",
    "Transports",
    "Présidents"
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 25,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Salut Ulysse,",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 17,
              ),
              Text(
                "Où souhaitez vous explorer aujourd'hui ?",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          width: size.width,
          height: 800,
          padding: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: ContainedTabBarView(
              onChange: (valeur) {
                setState(() {
                  tabActif = valeur;
                });
              },
              tabBarProperties: const TabBarProperties(
                indicator: BoxDecoration(),
                isScrollable: true,
              ),
              tabs: List<CustomTabHeader>.generate(titres.length, (index) {
                return CustomTabHeader(
                    value: titres[index], actif: tabActif == index);
              }),
              views: [
                DestinationSection(size: size),
                HebergementSection(size: size),
                Container(
                  height: 300,
                  width: size.width,
                  color: Colors.yellow,
                ),
                Container(
                  height: 300,
                  width: size.width,
                  color: Colors.black,
                ),
                Container(
                  height: 300,
                  width: size.width,
                  color: Colors.purple,
                ),
                PresidentSection(size: size),
              ]),
        )
      ],
    );
  }
}

class PresidentSection extends StatelessWidget {
  const PresidentSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        margin: const EdgeInsets.only(top: 20),
        width: size.width,
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          runSpacing: 20,
          children: List<PresidentCard>.generate(7, (index) {
            return PresidentCard();
          }),
        ));
  }
}

class HebergementSection extends StatelessWidget {
  const HebergementSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Populaires",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              TextButton(
                  onPressed: null,
                  child: Text(
                    "Voir plus",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w500),
                  ))
            ],
          ),
          FlutterCarousel(
              items: List<HebergementCard>.generate(5, (index) {
                return const HebergementCard(
                  localisation: "Lokossa",
                  nom: "Cité de Ganvié",
                  etoiles: "4,8",
                  images: [
                    "https://media.gettyimages.com/id/170753600/fr/photo/stilts.jpg?s=2048x2048&w=gi&k=20&c=UA8RLYiiqe61IdMONMZryQW32ZZqKGVeoePsR8ezKPQ=",
                    "https://media.gettyimages.com/id/1211399049/fr/photo/ganvie-village-scene-a-unique-village-built-on-stilts-on-lake-nokoue-near-cotonou-benin.jpg?s=2048x2048&w=gi&k=20&c=tP2ljyXlnbsDoNz7ZZcZgdyhv-JyujRHJth8ORlSIgQ="
                  ],
                );
              }),
              options: CarouselOptions(height: 260)),
          const SizedBox(
            height: 30,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Découvrez",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              TextButton(
                  onPressed: null,
                  child: Text(
                    "Voir plus",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w500),
                  ))
            ],
          ),
          FlutterCarousel(
              items: List<HebergementCard>.generate(5, (index) {
                return const HebergementCard(
                  localisation: "Lokossa",
                  nom: "Cité de Ganvié",
                  etoiles: "4,8",
                  images: [
                    "https://media.gettyimages.com/id/170753600/fr/photo/stilts.jpg?s=2048x2048&w=gi&k=20&c=UA8RLYiiqe61IdMONMZryQW32ZZqKGVeoePsR8ezKPQ=",
                    "https://media.gettyimages.com/id/1211399049/fr/photo/ganvie-village-scene-a-unique-village-built-on-stilts-on-lake-nokoue-near-cotonou-benin.jpg?s=2048x2048&w=gi&k=20&c=tP2ljyXlnbsDoNz7ZZcZgdyhv-JyujRHJth8ORlSIgQ="
                  ],
                );
              }),
              options: CarouselOptions(height: 260))
        ],
      ),
    );
  }
}

class DestinationSection extends StatelessWidget {
  const DestinationSection({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Populaires",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              TextButton(
                  onPressed: null,
                  child: Text(
                    "Voir plus",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w500),
                  ))
            ],
          ),
          FlutterCarousel(
              items: List<DestinationCard>.generate(5, (index) {
                return const DestinationCard(
                  localisation: "Lokossa",
                  nom: "Cité de Ganvié",
                  etoiles: "4,8",
                  image:
                      "https://media.gettyimages.com/id/170753600/fr/photo/stilts.jpg?s=2048x2048&w=gi&k=20&c=UA8RLYiiqe61IdMONMZryQW32ZZqKGVeoePsR8ezKPQ=",
                );
              }),
              options: CarouselOptions(height: 260)),
          const SizedBox(
            height: 30,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Découvrez",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              TextButton(
                  onPressed: null,
                  child: Text(
                    "Voir plus",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.w500),
                  ))
            ],
          ),
          FlutterCarousel(
              items: List<DestinationCard>.generate(5, (index) {
                return const DestinationCard(
                  localisation: "Lokossa",
                  nom: "Cité de Ganvié",
                  etoiles: "4,8",
                  image:
                      "https://media.gettyimages.com/id/170753600/fr/photo/stilts.jpg?s=2048x2048&w=gi&k=20&c=UA8RLYiiqe61IdMONMZryQW32ZZqKGVeoePsR8ezKPQ=",
                );
              }),
              options: CarouselOptions(height: 260))
        ],
      ),
    );
  }
}
