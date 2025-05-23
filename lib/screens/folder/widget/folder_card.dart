import 'package:flutter/material.dart';

class FolderCard extends StatelessWidget {
  final bool isNew;
  final Map<String, dynamic>? folder;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final Color? color;

  const FolderCard({
    super.key,
    this.isNew = false,
    this.folder,
    this.onTap,
    this.onLongPress,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (isNew) {
      return GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
        child: Card(
          color: Colors.blue[50],
          child: const Center(child: Icon(Icons.add, size: 40)),
        ),
      );
    }

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Card(
        color: color ?? Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(folder!['icon'], size: 40),
            const SizedBox(height: 8),
            Text(folder!['title']),
            Text('${folder!['lists']} Lists'),
          ],
        ),
      ),
    );
  }
}
