import 'package:explore_benin/components/newest.dart';
import 'package:explore_benin/components/popular.dart';
import 'package:explore_benin/models/hebergement_model.dart';
import 'package:flutter/material.dart';

class CategorySection extends StatefulWidget {
  CategorySection({Key? key});

  @override
  _CategorySectionState createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  bool isHebergementView = false;

  final mainCategories = [
    {
      'icon': Icons.airplanemode_active_outlined,
      'color': const Color(0xFF605CF4),
      'title': 'Destination'
    },
    {
      'icon': Icons.hotel_outlined,
      'color': const Color(0xFFFC77A6),
      'title': 'Hébergement'
    },
    {
      'icon': Icons.restaurant_outlined,
      'color': const Color(0xFF4391FF),
      'title': 'Restaurants'
    },
    {
      'icon': Icons.directions_bus_outlined,
      'color': const Color(0xFF7182f2),
      'title': 'Transport'
    },
    {
      'icon': Icons.event_outlined,
      'color': const Color(0xFF9C27B0),
      'title': 'Événement'
    },
  ];

  final hebergementCategories = [
    {'title': 'Auberge', 'icon': Icons.house},
    {'title': 'Hotel', 'icon': Icons.hotel},
  ];

  final List<Hebergement> hebergements = [
    Hebergement(
      image: 'assets/images/ganv1.jpg',
      name: 'QILOLO',
      location: 'Abomey, Benin',
      stars: 4,
    ),
    Hebergement(
      image: 'assets/images/ganv2.jpg',
      name: 'QILOLO',
      location: 'Calavi, Benin',
      stars: 5,
    ),
    Hebergement(
      image: 'assets/images/ganv3.jpg',
      name: 'QILOLO',
      location: 'Cotonou, Benin',
      stars: 3,
    ),
    Hebergement(
      image: 'assets/images/ganv3.jpg',
      name: 'QILOLO',
      location: 'Lokossa, Benin',
      stars: 3,
    ),
    // Ajoutez plus d'éléments selon vos besoins
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF6F8FF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: isHebergementView
          ? buildHebergementView()
          : buildMainCategoriesView(),
    );
  }

  Widget buildMainCategoriesView() {
    return Column(
      children: [
        SizedBox(
          height: 140,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                if (mainCategories[index]['title'] == 'Hébergement') {
                  setState(() {
                    isHebergementView = true;
                  });
                }
              },
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: mainCategories[index]['color'] as Color),
                    child: Icon(
                      mainCategories[index]['icon'] as IconData,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    mainCategories[index]['title'] as String,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            separatorBuilder: (_, index) => const SizedBox(width: 33),
            itemCount: mainCategories.length,
          ),
        ),
        Container(
          width: 410,
          child: const Text(
            'Destinations Populaires',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        PopularGame(),
        Container(
          width: 410,
          child: const Text(
            'Découvrez Aussi',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        NewestGame(),
      ],
    );
  }

  Widget buildHebergementView() {
    return Column(
      children: [
        SizedBox(
          height: 140,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => Column(
              children: [
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 255, 136, 0)),
                  child: Icon(
                    hebergementCategories[index]['icon'] as IconData,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  hebergementCategories[index]['title'] as String,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            separatorBuilder: (_, index) => const SizedBox(width: 33),
            itemCount: hebergementCategories.length,
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Découvrez nos Hébergements',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: hebergements.length,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Container(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          hebergements[index].image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(hebergements[index].name),
                      subtitle: Row(
                        children: [
                          Icon(Icons.location_on, size: 16, color: Colors.grey),
                          SizedBox(width: 5),
                          Text(hebergements[index].location),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(hebergements[index].stars,
                            (starIndex) {
                          return Icon(Icons.star,
                              color: Colors.yellow, size: 20);
                        }),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
