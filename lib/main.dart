import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const WithinApp());
}

class WithinApp extends StatelessWidget {
  const WithinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Within',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF6B9AC4),
          secondary: const Color(0xFF97C1A9),
          background: const Color(0xFFF8F9FA),
          surface: Colors.white,
          onBackground: const Color(0xFF2C3E50),
          onSurface: const Color(0xFF2C3E50),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFF6B9AC4),
          secondary: const Color(0xFF97C1A9),
          background: const Color(0xFF121212),
          surface: const Color(0xFF1E1E1E),
          onBackground: Colors.white,
          onSurface: Colors.white,
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const SessionsScreen(),
    const SelfCareScreen(),
    const CommunityScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.calendar_today),
            label: 'Sessions',
          ),
          NavigationDestination(
            icon: Icon(Icons.self_improvement),
            label: 'Self-Care',
          ),
          NavigationDestination(icon: Icon(Icons.forum), label: 'Community'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// Placeholder screens - These will be replaced with actual implementations
class SessionsScreen extends StatelessWidget {
  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Sessions Screen'));
  }
}

class SelfCareScreen extends StatelessWidget {
  const SelfCareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Self-Care Screen'));
  }
}

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Community Screen'));
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile Screen'));
  }
}
