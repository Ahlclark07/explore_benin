import 'package:explore_benin/components/category_page.dart';
import 'package:explore_benin/components/custom_bottom_navigation_bar.dart';
import 'package:explore_benin/components/header_section.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

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
    return Scaffold(
      backgroundColor: const Color(0xFF5F67EA),
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
    );
  }
}

class HomeInnerPage extends StatelessWidget {
  const HomeInnerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform(
          transform: Matrix4.identity()..rotateZ(20),
          origin: const Offset(150, 50),
          child: Image.asset(
            'assets/images/bg_liquid.png',
            width: 200,
          ),
        ),
        Positioned(
          right: 0,
          top: 200,
          child: Transform(
            transform: Matrix4.identity()..rotateZ(20),
            origin: const Offset(180, 100),
            child: Image.asset(
              'assets/images/bg_liquid.png',
              width: 200,
            ),
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 30),
            const HeaderSection(),
            const SizedBox(height: 50),
            CategorySection(),
          ],
        )
      ],
    );
  }
}
