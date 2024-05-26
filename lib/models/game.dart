class Game {
  String bgImage;
  String icon;
  String name;
  String type;
  num score;
  num download;
  num review;
  String description;
  List<String> images;
  String location;
  int starRating;
  String placeName;
  double latitude; // Ajout de la propriété latitude
  double longitude; // Ajout de la propriété longitude

  Game(
    this.bgImage,
    this.icon,
    this.name,
    this.type,
    this.score,
    this.download,
    this.review,
    this.description,
    this.images,
    this.location,
    this.starRating,
    this.placeName,
    this.latitude,
    this.longitude, 
  );

  static List<Game> games() {
    return [
      Game(
        'assets/images/ganv1.jpg',
        'assets/images/ori_logo.png',
        'Cité Lacustre de Ganvié',
        'Site Touristique',
        4.8,
        382,
        324,
        "Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.",
        [
          'assets/images/ganv2.jpg',
          'assets/images/ganv3.jpg',
          'assets/images/ganv4.jpg',
        ],
        'Cotonou',
        5,
        'Cité Lacustre de Ganvié',
        48.8584, // Latitude de la Tour Eiffel
        2.2945, // Longitude de la Tour Eiffel
      ),
      Game(
          'assets/images/ganv1.jpg',
          'assets/images/ori_logo.png',
          'Ori and The Forest',
          'Adventure',
          4.8,
          382,
          324,
          "Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.Ori is stranger to peril, but when a fateful flight puts the owlet ku in har'ms way.",
          [
            'assets/images/ganv2.jpg',
            'assets/images/ganv3.jpg',
            'assets/images/ganv4.jpg',
          ],
          'Cotonou',
          5,
          'Cité Lacustre de Ganvié',
          48.8584, // Latitude de la Tour Eiffel
          2.2945, // Longitude de la Tour Eiffel
        ),
    ];
  }
}
