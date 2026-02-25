// ignore_for_file: deprecated_member_use, unnecessary_underscores

import 'package:flutter/material.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  bool _allowNotifications = true;

  final List<Map<String, dynamic>> _leagueAlerts = [
    {
      'name': 'PREMIERE LEAGUE',
      'subtitle': 'Breaking News, Editors Picks, Benefits & Rewards',
      'image': 'assets/images/premiere.png',
      'enabled': true,
    },
    {
      'name': 'GAMES & STATS',
      'subtitle': null,
      'image': 'assets/images/premiere.png',
      'enabled': false,
    },
  ];

  final List<Map<String, dynamic>> _teamAlerts = [
    {'name': 'CHELSEA', 'image': 'assets/images/clubs/chelsea.png', 'enabled': true},
    {'name': 'LEICESTER CITY', 'image': 'assets/images/clubs/leicester.png', 'enabled': false},
    {'name': 'ALBION', 'image': 'assets/images/clubs/albion.png', 'enabled': false},
    {'name': 'ARSENAL', 'image': 'assets/images/clubs/arsenal.png', 'enabled': false},
    {'name': 'MAN UNITED', 'image': 'assets/images/clubs/manU.png', 'enabled': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFD4D4),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Row(
                children: List.generate(4, (i) => Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.white.withOpacity(0.08),
                  ),
                )),
              ),
            ),
            Column(
              children: [
                _buildAppBar(context),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.only(bottom: 24),
                    children: [
                      _buildAllowNotificationsRow(),
                      _buildDivider(),
                      _buildSectionHeader('LEAGUE ALERTS'),
                      ..._leagueAlerts.asMap().entries.map(
                        (e) => _buildAlertRow(
                          name: e.value['name'],
                          subtitle: e.value['subtitle'],
                          image: e.value['image'],
                          enabled: e.value['enabled'] as bool,
                          isEnabled: _allowNotifications,
                          onStatusTap: () {
                            setState(() {
                              _leagueAlerts[e.key]['enabled'] =
                                  !(_leagueAlerts[e.key]['enabled'] as bool);
                            });
                          },
                        ),
                      ),
                      _buildDivider(),
                      _buildSectionHeader('TEAM ALERTS'),
                      ..._teamAlerts.asMap().entries.map(
                        (e) => _buildAlertRow(
                          name: e.value['name'],
                          subtitle: null,
                          image: e.value['image'],
                          enabled: e.value['enabled'] as bool,
                          isEnabled: _allowNotifications,
                          onStatusTap: () {
                            setState(() {
                              _teamAlerts[e.key]['enabled'] =
                                  !(_teamAlerts[e.key]['enabled'] as bool);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.maybePop(context),
            child: const Icon(Icons.chevron_left, size: 28, color: Colors.black87),
          ),
          const SizedBox(width: 8),
          const Text(
            'NOTIFICATION',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAllowNotificationsRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Allow notifications',
            style: TextStyle(fontSize: 15, color: Colors.black87),
          ),
          Switch(
            value: _allowNotifications,
            onChanged: (val) => setState(() => _allowNotifications = val),
            activeColor: Colors.white,
            activeTrackColor: const Color(0xFFFF4D4D),
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.black26,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(height: 1, color: Color(0xFFFFBDBD), indent: 20, endIndent: 20);
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w900,
          letterSpacing: 1,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildAlertRow({
    required String name,
    required String? subtitle,
    required String image,
    required bool enabled,
    required bool isEnabled,
    required VoidCallback onStatusTap,
  }) {
    final bool active = isEnabled && enabled;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          // Logo
          ColorFiltered(
            colorFilter: isEnabled
                ? const ColorFilter.mode(Colors.transparent, BlendMode.multiply)
                : const ColorFilter.matrix([
                    0.2126, 0.7152, 0.0722, 0, 0,
                    0.2126, 0.7152, 0.0722, 0, 0,
                    0.2126, 0.7152, 0.0722, 0, 0,
                    0,      0,      0,      1, 0,
                  ]),
            child: Image.asset(
              image,
              width: 44,
              height: 44,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFFFBDBD),
                ),
                child: const Icon(Icons.shield, color: Colors.white, size: 22),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                    color: isEnabled ? Colors.black87 : Colors.black38,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 11,
                      color: isEnabled ? Colors.black45 : Colors.black26,
                      height: 1.4,
                    ),
                  ),
                ],
              ],
            ),
          ),
          GestureDetector(
            onTap: isEnabled ? onStatusTap : null,
            child: Text(
              active ? 'On' : 'Off',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: active ? const Color(0xFFFF4D4D) : Colors.black38,
              ),
            ),
          ),
        ],
      ),
    );
  }
}