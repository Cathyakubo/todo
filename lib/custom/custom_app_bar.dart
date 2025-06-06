import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:three_screen_app/screens/settings/widget/settings_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.onBack,
    required this.showFilterIcon,
    this.showBackButton = true,
  });
  final String title;
  final VoidCallback? onBack;
  final bool showFilterIcon;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      leading:
          showBackButton
              ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: onBack ?? () => Navigator.pop(context),
              )
              : null,

      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.black,
        ),
      ),
      actions: [
        if (showFilterIcon)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
              child: SvgPicture.asset('assets/icons/filter.svg'),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
