import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  List<Map<String, dynamic>> lists = [
    {
      'title': 'Weekly Planner',
      'progress': 0.2,
      'icon': Icons.calendar_today,
      'color': Colors.green[100],
    },
    {
      'title': 'Books',
      'progress': 0.4,
      'icon': Icons.book,
      'color': Colors.pink[100],
    },
    {
      'title': 'Films',
      'progress': 0.6,
      'icon': Icons.movie,
      'iconColor': Colors.blue,
      'color': Colors.orange[100],
    },
    {
      'title': 'Games',
      'progress': 0.3,
      'icon': Icons.videogame_asset,
      'color': Colors.blue[100],
    },
  ];

  final Map<String, dynamic> task = {
    'title': 'Update planner',
    'time': '09:00',
    'priority': 'High',
    'list': 'Weekly Planner',
  };

  void addNewList() {
    setState(() {
      lists.add({
        'title': 'New List ${lists.length + 1}',
        'progress': 0.0,
        'icon': Icons.list,
        'color': Colors.purple[100],
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: addNewList,
                    icon: const Icon(Icons.add_box_outlined),
                    label: const Text("New List"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10, width: 12),
            const Text(
              "LISTS",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // LIST CARDS
            Column(
              children:
                  lists.map((item) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: item['color'],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            item['icon'],
                            size: 30,
                            color: item['iconColor'] ?? Colors.black,
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title'],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                LinearProgressIndicator(
                                  value: item['progress'],
                                  minHeight: 5,
                                  backgroundColor: Colors.white,
                                  color: Colors.black.withOpacity(0.6),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
            ),

            const SizedBox(height: 20),
            const Text(
              "TASKS",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Upcoming",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // TASK CARD
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Text(
                  task['list'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task['title']),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("🕒 ${task['time']}"),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            task['priority'],
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                trailing: const Icon(Icons.expand_more),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.today_outlined), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}
