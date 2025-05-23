import 'package:flutter/material.dart';

final List<DropdownMenuItem<IconData>> iconDropdownItems = [
  DropdownMenuItem(
    value: Icons.folder,
    child: Row(
      children: [Icon(Icons.folder), SizedBox(width: 8), Text("Folder")],
    ),
  ),
  DropdownMenuItem(
    value: Icons.book,
    child: Row(children: [Icon(Icons.book), SizedBox(width: 8), Text("Book")]),
  ),
  DropdownMenuItem(
    value: Icons.movie,
    child: Row(
      children: [Icon(Icons.movie), SizedBox(width: 8), Text("Movie")],
    ),
  ),
  DropdownMenuItem(
    value: Icons.gamepad,
    child: Row(
      children: [Icon(Icons.gamepad), SizedBox(width: 8), Text("Game")],
    ),
  ),
  DropdownMenuItem(
    value: Icons.favorite,
    child: Row(
      children: [Icon(Icons.favorite), SizedBox(width: 8), Text("Favorite")],
    ),
  ),
  DropdownMenuItem(
    value: Icons.edit,
    child: Row(children: [Icon(Icons.edit), SizedBox(width: 8), Text("Edit")]),
  ),
  DropdownMenuItem(
    value: Icons.design_services,
    child: Row(
      children: [
        Icon(Icons.design_services),
        SizedBox(width: 8),
        Text("Design"),
      ],
    ),
  ),
  DropdownMenuItem(
    value: Icons.restaurant_menu,
    child: Row(
      children: [
        Icon(Icons.restaurant_menu),
        SizedBox(width: 8),
        Text("Recipe"),
      ],
    ),
  ),
  DropdownMenuItem(
    value: Icons.self_improvement,
    child: Row(
      children: [
        Icon(Icons.self_improvement),
        SizedBox(width: 8),
        Text("Yoga"),
      ],
    ),
  ),
  DropdownMenuItem(
    value: Icons.music_note,
    child: Row(
      children: [Icon(Icons.music_note), SizedBox(width: 8), Text("Music")],
    ),
  ),
  DropdownMenuItem(
    value: Icons.code,
    child: Row(children: [Icon(Icons.code), SizedBox(width: 8), Text("Code")]),
  ),
  DropdownMenuItem(
    value: Icons.shopping_cart,
    child: Row(
      children: [
        Icon(Icons.shopping_cart),
        SizedBox(width: 8),
        Text("Shopping"),
      ],
    ),
  ),
  DropdownMenuItem(
    value: Icons.work,
    child: Row(children: [Icon(Icons.work), SizedBox(width: 8), Text("Work")]),
  ),
  DropdownMenuItem(
    value: Icons.school,
    child: Row(
      children: [Icon(Icons.school), SizedBox(width: 8), Text("School")],
    ),
  ),
];
final Map<IconData, Color> iconColors = {
  Icons.folder: Colors.grey,
  Icons.book: Colors.blue,
  Icons.movie: Colors.red,
  Icons.gamepad: Colors.deepPurple,
  Icons.favorite: Colors.pink,
  Icons.edit: Colors.purple,
  Icons.design_services: Colors.green,
  Icons.restaurant_menu: Colors.teal,
  Icons.self_improvement: Colors.orange,
  Icons.music_note: Colors.indigo,
  Icons.code: Colors.blueGrey,
  Icons.shopping_cart: Colors.brown,
  Icons.work: Colors.cyan,
  Icons.school: Colors.amber,
};
