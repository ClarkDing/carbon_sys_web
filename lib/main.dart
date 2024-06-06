import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String _currentPage = 'Main Content Area';

  void _navigateTo(String page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          FixedSidebar(
            onItemSelected: _navigateTo,
          ),
          Expanded(
            child: Center(
              child: Text(_currentPage),
            ),
          ),
        ],
      ),
    );
  }
}

class FixedSidebar extends StatelessWidget {
  final Function(String) onItemSelected;

  FixedSidebar({required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      color: Colors.blue,
      child: ListView(
        children: [
          CustomExpansionTile(
            title: 'Home',
            icon: Icons.home,
            onItemSelected: onItemSelected,
            children: [
              ListTile(
                title: Text('Sub-item 1'),
                onTap: () {
                  onItemSelected('Home Sub-item 1 Page');
                },
              ),
              ListTile(
                title: Text('Sub-item 2'),
                onTap: () {
                  onItemSelected('Home Sub-item 2 Page');
                },
              ),
            ],
          ),
          CustomExpansionTile(
            title: 'Profile',
            icon: Icons.person,
            onItemSelected: onItemSelected,
            children: [
              ListTile(
                title: Text('Sub-item 1'),
                onTap: () {
                  onItemSelected('Profile Sub-item 1 Page');
                },
              ),
              ListTile(
                title: Text('Sub-item 2'),
                onTap: () {
                  onItemSelected('Profile Sub-item 2 Page');
                },
              ),
            ],
          ),
          CustomExpansionTile(
            title: 'Settings',
            icon: Icons.settings,
            onItemSelected: onItemSelected,
            children: [
              ListTile(
                title: Text('Sub-item 1'),
                onTap: () {
                  onItemSelected('Settings Sub-item 1 Page');
                },
              ),
              ListTile(
                title: Text('Sub-item 2'),
                onTap: () {
                  onItemSelected('Settings Sub-item 2 Page');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;
  final Function(String) onItemSelected;

  CustomExpansionTile({
    required this.title,
    required this.icon,
    required this.children,
    required this.onItemSelected,
  });

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(widget.icon, color: Colors.white),
      title: Text(widget.title, style: TextStyle(color: Colors.white)),
      children: widget.children,
      initiallyExpanded: isExpanded,
      onExpansionChanged: (bool expanding) => setState(() => isExpanded = expanding),
    );
  }
}
