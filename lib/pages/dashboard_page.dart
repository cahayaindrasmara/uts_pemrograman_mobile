import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/auth_controller.dart'; // untuk akses username dan login state

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final username = Provider.of<AuthController>(context).username;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 150,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              'Dashboard',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16),
              children: [
                dashboardCard(context, Icons.add, 'Counter', '/counter'),
                dashboardCard(
                  context,
                  Icons.person,
                  'Profile',
                  '/profile/$username',
                ),
                dashboardCard(context, Icons.settings, 'Settings', null),
                dashboardCard(context, Icons.logout, 'Logout', '/login'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.lightBlue[100],
            child: Text('Selamat datang, $username !'),
          ),
        ],
      ),
    );
  }

  Widget dashboardCard(
    BuildContext context,
    IconData icon,
    String label,
    String? route,
  ) {
    return GestureDetector(
      onTap: () {
        if (route != null) Navigator.pushNamed(context, route);
      },
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(icon, size: 40), Text(label)],
        ),
      ),
    );
  }
}
