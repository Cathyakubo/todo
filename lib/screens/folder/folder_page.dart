import 'package:flutter/material.dart';
import 'package:three_screen_app/screens/personal/widget/personal_page.dart';
import '../../custom/custom_app_bar.dart';
import 'widget/folder_card.dart';
import 'widget/iconlist.dart';

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
      builder: (_) {
        return StatefulBuilder(
          builder: (context, setState) {
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
                  const Text('Select Icon:'),
                  const SizedBox(height: 10),
                  DropdownButton<IconData>(
                    value: selectedIcon,
                    items: iconDropdownItems,
                    onChanged: (value) {
                      setState(() {
                        selectedIcon = value!;
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  child: const Text("Cancel"),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  child: const Text("Add"),
                  onPressed: () {
                    setState(() {
                      folders.add({
                        'title': titleController.text,
                        'lists': 0,
                        'icon': selectedIcon,
                        'color': iconColors[selectedIcon] ?? Colors.grey[200],
                      });
                    });
                    Navigator.pop(context);
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
        showBackButton: false,
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
                      MaterialPageRoute(builder: (context) => PersonalPage()),
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
              child: Icon(Icons.add),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
