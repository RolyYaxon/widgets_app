import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const appMenuItem = <MenuItem>[

  MenuItem(
  title: "Counter", 
  subtitle: "CounterRiverpod", 
  link: "/counter", 
  icon: Icons.countertops
  ),


MenuItem(
  title: "Buttons", 
  subtitle: "Menu", 
  link: "/buttons", 
  icon: Icons.smart_button_outlined
  ),

  MenuItem(
  title: "Cards", 
  subtitle: "Cards Menu", 
  link: "/cards", 
  icon: Icons.credit_card
  ),

    MenuItem(
  title: "ProgressIndicator", 
  subtitle: "Menu de progressbars", 
  link: "/progress", 
  icon: Icons.remove_from_queue
  ),

      MenuItem(
  title: "DIalogs and Snackbars", 
  subtitle: "Otro menu", 
  link: "/snackbars", 
  icon: Icons.snapchat
  ),

      MenuItem(
  title: "Animated Thing", 
  subtitle: "Many animations", 
  link: "/animated", 
  icon: Icons.gamepad_rounded
  ),
        MenuItem(
  title: "Ui Controls", 
  subtitle: "Controls", 
  link: "/uicontrols", 
  icon: Icons.cloud_upload_outlined
  ),

          MenuItem(
  title: "Tutorial", 
  subtitle: "Tutoriales", 
  link: "/tutorial", 
  icon: Icons.architecture
  ),
          MenuItem(
  title: "Infinite Scroll", 
  subtitle: "Scrool", 
  link: "/infinite", 
  icon: Icons.medical_information_outlined
  ),
          MenuItem(
  title: "Change Theme", 
  subtitle: "Select a color", 
  link: "/themechanger", 
  icon: Icons.palette_outlined
  ),






];
