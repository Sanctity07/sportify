import 'package:flutter/material.dart';
import 'package:sportify/views/follow_players_view.dart';
import 'package:sportify/views/follow_teams_view.dart';
import 'package:sportify/views/notification_view.dart';
import 'package:sportify/views/privacy_view.dart';
import 'package:sportify/views/customer_support_view.dart';
import 'package:sportify/views/app_info_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD4D4),
      body: SafeArea(
        child: Stack(
          children: [
              SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  _buildMyTeamsSection(context),
                  _buildMyPlayersSection(context),
                  _buildOtherOptions(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
      color: const Color(0xFFFF4D4D),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/logo.png",
                height: 26,
                width: 26,
                color: Colors.white,
              ),
              const SizedBox(width: 8),
              const Text(
                "SPORTIFY",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            "Welcome to Sportify ID",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Your  Sportify ID grants you access to the \nexclusive offers, personalized content, and \nmore- so you can keep being one of the best \nfans out there.",
            style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.4),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildMyTeamsSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "MY TEAMS",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                  color: Colors.black87,
                ),
              ),
              IconButton(
                icon: Icon(Icons.add, color: Colors.black87, size: 22),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FollowTeamsView()));
                },
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Text(
            "Follow your favorite teams for personalized content and recommendations.",
            style: TextStyle(fontSize: 13, color: Colors.black54, height: 1.4),
          ),
        ],
      ),
    );
  }

  Widget _buildMyPlayersSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "MY PLAYERS",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1,
                  color: Colors.black87,
                ),
              ),
              IconButton(
                icon: Icon(Icons.add, color: Colors.black87, size: 22),
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => const FollowPlayersView()));
                },
              ),
            ],
          ),
          const SizedBox(height: 6),
          const Text(
            "Follow your favorite  for personalized content and out recommendations.",
            style: TextStyle(fontSize: 13, color: Colors.black54, height: 1.4),
          ),
        ],
      ),
    );
  }
Widget _buildOtherOptions(BuildContext context) {
  final options = [
    {
      "title": "Notifications",
      "page": const NotificationView(),
    },
    {
      "title": "Privacy",
      "page": const PrivacyView(),
    },
    {
      "title": "Customer Support",
      "page": const CustomerSupportView(),
    },
    {
      "title": "App info",
      "page": const AppInfoView(),
    },
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Text(
          "OTHER OPTIONS",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w900,
            letterSpacing: 1,
            color: Colors.black87,
          ),
        ),
      ),
      ...options.map(
        (option) => Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              title: Text(
                option["title"] as String,
                style: const TextStyle(fontSize: 15, color: Colors.black87),
              ),
              trailing: const Icon(
                Icons.chevron_right,
                color: Colors.black45,
                size: 20,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => option["page"] as Widget,
                  ),
                );
              },
            ),
            const Divider(height: 1, color: Color(0xFFFFBDBD)),
          ],
        ),
      ),
    ],
  );
}
}
