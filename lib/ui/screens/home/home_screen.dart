import 'package:contact_app/core/utils/app_colors.dart';
import 'package:contact_app/ui/screens/home/contact_page/contact_page.dart';
import 'package:contact_app/ui/screens/home/user_page/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  static const String route = '/Home';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const UserPage(),
    const ContactPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: AppColors.secondaryText,
            ),
            label: 'Usuario',
            activeIcon: Icon(
              Icons.account_circle,
              color: AppColors.primary,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.quick_contacts_dialer_sharp,
              color: AppColors.secondaryText,
            ),
            label: 'Contactos',
            activeIcon: Icon(
              Icons.quick_contacts_dialer_sharp,
              color: AppColors.primary,
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
