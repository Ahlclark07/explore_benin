import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int index;
  final Function(int i) callback;

  const CustomBottomNavigationBar(
      {super.key, required this.index, required this.callback});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void _onItemTapped(int index) {
    widget.callback(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff6f8ff),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            selectedItemColor: const Color(0xFF5F67EA),
            selectedFontSize: 12,
            unselectedFontSize: 12,
            unselectedItemColor: Colors.grey.withOpacity(0.7),
            type: BottomNavigationBarType.fixed,
            currentIndex: widget.index,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: 'Accueil',
                icon: Icon(
                  Icons.home_rounded,
                  size: 30,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Agenda',
                icon: Icon(
                  Icons.calendar_today_rounded,
                  size: 30,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Rechercher',
                icon: Icon(
                  Icons.search_rounded,
                  size: 30,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Traduction',
                icon: Icon(
                  Icons.translate_rounded,
                  size: 30,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Messagerie',
                icon: Icon(
                  Icons.chat_rounded,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
