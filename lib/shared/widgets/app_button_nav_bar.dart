import 'package:flutter/material.dart';

class ButtonNavBar extends StatelessWidget {
  final int indiceAtual;
  final Function(int) onTap;

  const ButtonNavBar({
    required this.indiceAtual,
    required this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: indiceAtual,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xFF208286),
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: TextStyle(
        color: Colors.grey,
      ),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled) ,
          label: "Home"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history) ,
          label: "Historico"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications) ,
          label: "Notificações"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined) ,
          label: "Perfil"
        ),
      ],
    );
  }
}