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





];
