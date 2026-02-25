// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:sportify/views/home_view.dart';
import 'package:sportify/views/news_view.dart';
import 'package:sportify/views/profile_view.dart';
import 'package:sportify/views/tasks_view.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 3; // Profile selected by default
  final PageController _pageController = PageController();

  final List<_NavItem> _items = const [
    _NavItem(icon: Icons.home_outlined, label: 'Home'),
    _NavItem(icon: Icons.article_outlined, label: 'News'),
    _NavItem(icon: Icons.assignment_outlined, label: 'Tasks'),
    _NavItem(icon: Icons.person, label: 'Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeView(),
          NewsView(),
          TasksView(),
          ProfileView(),
        ],
      ),

      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: List.generate(_items.length, (index) {
              final isSelected = index == _selectedIndex;

              return Expanded(
                child: GestureDetector(
                  onTap: () => _onItemTapped(index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFFFE5E5)
                          : const Color(0xFFFFF0F0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      _items[index].icon,
                      size: 24,
                      color: isSelected
                          ? const Color(0xFFE53935)
                          : const Color(0xFF1A1A1A),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
} 