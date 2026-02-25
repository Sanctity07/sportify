// ignore_for_file: deprecated_member_use, unnecessary_underscores

import 'package:flutter/material.dart';

class FollowTeamsView extends StatefulWidget {
  const FollowTeamsView({super.key});

  @override
  State<FollowTeamsView> createState() => _FollowTeamsViewState();
}

class _FollowTeamsViewState extends State<FollowTeamsView> {
  final List<Map<String, dynamic>> _teams = [
    {'name': 'CHELSEA', 'logo': 'assets/images/clubs/chelsea.png', 'following': false},
    {'name': 'ALBION', 'logo': 'assets/images/clubs/albion.png', 'following': false},
    {'name': 'ARSENAL', 'logo': 'assets/images/clubs/arsenal.png', 'following': false},
    {'name': 'STOKE CIY', 'logo': 'assets/images/clubs/stokecity.png', 'following': false},
    {'name': 'LEICESTER CITY', 'logo': 'assets/images/clubs/leicester.png', 'following': false},
    {'name': 'MAN UNITED', 'logo': 'assets/images/clubs/manU.png', 'following': false},
  ];

  void _toggleFollow(int index) {
    setState(() {
      _teams[index]['following'] = !_teams[index]['following'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD4D4),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: _buildTeamsList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
      color: const Color(0xFFFF4D4D),
      child: Stack(
        children: [
          Positioned(
            right: -10,
            top: 10,
            child: Text(
              "TEAMS",
              style: TextStyle(
                color: Colors.white.withOpacity(0.15),
                fontSize: 60,
                fontWeight: FontWeight.w900,
                letterSpacing: 4,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.maybePop(context),
                child: const Icon(Icons.chevron_left, color: Colors.white, size: 28),
              ),
              const SizedBox(height: 30),
              const Text(
                "FOLLOW YOUR\nFAVORITE TEAMS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white54, width: 1),
                ),
                child: const Text(
                  "Get news,game updates highlights and more\ninfo on your favorite teams",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTeamsList() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: _teams.length,
      separatorBuilder: (_, __) => const Divider(
        height: 1,
        color: Color(0xFFFFBDBD),
        indent: 20,
        endIndent: 20,
      ),
      itemBuilder: (context, index) {
        final team = _teams[index];
        final bool isFollowing = team['following'] as bool;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              SizedBox(
                width: 48,
                height: 48,
                child: Image.asset(
                  team['logo'] as String,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFBDBD),
                    ),
                    child: const Icon(Icons.sports_soccer, color: Colors.white, size: 24),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  team['name'] as String,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                    color: Colors.black87,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _toggleFollow(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isFollowing ? const Color(0xFFFF4D4D) : Colors.black87,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    isFollowing ? "FOLLOWING" : "FOLLOW",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isFollowing ? 10 : 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}