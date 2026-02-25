import 'package:flutter/material.dart';

class FollowPlayersView extends StatefulWidget {
  const FollowPlayersView({super.key});

  @override
  State<FollowPlayersView> createState() => _FollowPlayersViewState();
}

class _FollowPlayersViewState extends State<FollowPlayersView> {
  final List<Map<String, dynamic>> _players = [
    {'name': 'Steven Adams', 'sport': 'Football', 'number': '#51', 'position': 'F', 'image': 'assets/images/players/steven.png', 'following': false},
    {'name': 'Precious Achiuwa', 'sport': 'Football', 'number': '#51', 'position': 'F', 'image': 'assets/images/players/precious.png', 'following': false},
    {'name': 'Bam Adebayo', 'sport': 'Football', 'number': '#51', 'position': 'F', 'image': 'assets/images/players/bam.png', 'following': false},
    {'name': 'Santi Aldama', 'sport': 'Cricket', 'number': '#561', 'position': 'F', 'image': 'assets/images/players/santi.png', 'following': false},
    {'name': 'Grayson Allen', 'sport': 'Basketball', 'number': '#51', 'position': 'F', 'image': 'assets/images/players/grayson.png', 'following': false},
    {'name': 'Jarrett Allen', 'sport': 'Football', 'number': '#51', 'position': 'F', 'image': 'assets/images/players/jarrett.png', 'following': false},
  ];

  void _toggleFollow(int index) {
    setState(() {
      _players[index]['following'] = !_players[index]['following'];
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
            Expanded(child: _buildPlayersList()),
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
          // Watermark text
          Positioned(
            right: -10,
            top: 10,
            child: Text(
              "PLAYERS",
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
                "FOLLOW YOUR\nFAVORITE PLAYERS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Get news,game updates highlights and more\ninfo on your favorite teams",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlayersList() {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: _players.length,
      separatorBuilder: (_, __) => const Divider(
        height: 1,
        color: Color(0xFFFFBDBD),
        indent: 20,
        endIndent: 20,
      ),
      itemBuilder: (context, index) {
        final player = _players[index];
        final bool isFollowing = player['following'] as bool;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              // Player photo
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  player['image'] as String,
                  width: 52,
                  height: 52,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFBDBD),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.person, color: Colors.white, size: 28),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              // Player name & sport info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      player['name'] as String,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      "${player['sport']} | ${player['number']} ${player['position']}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
              // Follow / Following button
              GestureDetector(
                onTap: () => _toggleFollow(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
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