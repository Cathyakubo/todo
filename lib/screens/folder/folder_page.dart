import 'package:flutter/material.dart';
import 'package:three_screen_app/screens/personal/widget/personal_page.dart';
import '../../custom/custom_app_bar.dart';
import 'widget/folder_card.dart';
import 'widget/iconlist.dart'; // Make sure iconDropdownItems and iconColors are defined here

class FolderPage extends StatefulWidget {
  const FolderPage({super.key});

  @override
  State<FolderPage> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  List<Map<String, dynamic>> folders = [
    {
      'title': 'Personal',
      'lists': 4,
      'icon': Icons.favorite,
      'color': Colors.pink[100],
    },
    {
      'title': 'UX/UI',
      'lists': 3,
      'icon': Icons.design_services,
      'color': Colors.green[100],
    },
    {
      'title': 'Writing',
      'lists': 8,
      'icon': Icons.edit,
      'color': Colors.purple[100],
    },
    {
      'title': 'Yoga',
      'lists': 2,
      'icon': Icons.self_improvement,
      'color': Colors.orange[100],
    },
    {
      'title': 'Recipes',
      'lists': 7,
      'icon': Icons.restaurant_menu,
      'color': Colors.teal[100],
    },
  ];

  void _addNewFolder() {
    final titleController = TextEditingController();
    IconData selectedIcon = Icons.folder;

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text("New Folder"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(labelText: 'Folder Name'),
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Select Icon:'),
                  ),
                  const SizedBox(height: 10),
                  DropdownButton<IconData>(
                    value: selectedIcon,
                    items: iconDropdownItems,
                    onChanged: (IconData? value) {
                      if (value != null) {
                        setState(() {
                          selectedIcon = value;
                        });
                      }
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  child: const Text("Cancel"),
                  onPressed: () {
                    titleController.dispose();
                    Navigator.pop(dialogContext);
                  },
                ),
                TextButton(
                  child: const Text("Add"),
                  onPressed: () {
                    final newTitle = titleController.text.trim();
                    if (newTitle.isEmpty) {
                      // Optional: Show error or just return
                      return;
                    }
                    folders.add({
                      'title': newTitle,
                      'lists': 0,
                      'icon': selectedIcon,
                      'color': iconColors[selectedIcon] ?? Colors.grey[200],
                    });
                    titleController.dispose();
                    Navigator.pop(dialogContext);
                    setState(() {}); // Refresh folder list UI
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Folders',
        showFilterIcon: true,
        showBackButton: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            FolderCard(isNew: true, onTap: _addNewFolder),
            ...folders.map(
              (folder) => FolderCard(
                folder: folder,
                color: folder['color'],
                onTap:
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PersonalPage(),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Icon(Icons.home),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Icon(Icons.calendar_month),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Icon(Icons.today_outlined),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Icon(Icons.add_box_outlined),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

final Map<IconData, Color> iconColors = {
  Icons.folder: Colors.blue.shade100,
  Icons.favorite: Colors.pink.shade100,
  Icons.work: Colors.green.shade100,
  Icons.school: Colors.orange.shade100,
};
