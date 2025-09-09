import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/sessions_screen.dart';
import 'screens/home_screen.dart';
import 'screens/community_screen.dart';
import 'screens/selfcare_screen.dart';
import 'screens/profile_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    // Handle initialization error gracefully
    print('Firebase initialization failed: $e');
  }
  runApp(const WithinApp());
}

class WithinApp extends StatelessWidget {
  const WithinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      title: 'Within',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.transparent,
        colorScheme: ColorScheme.light(
          primary: Colors.blueAccent,
          secondary: Colors.blueAccent.shade200,
          background: Colors.transparent,
          surface: Colors.transparent,
          onBackground: const Color(0xFF2C3E50),
          onSurface: const Color(0xFF2C3E50),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.dark(
          primary: Colors.blueAccent,
          secondary: Colors.blueAccent.shade200,
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
    const SelfCareScreen(), // Self-care screen with daily activities and mood tracking
    const HomeScreen(),
    const CommunityScreen(),
    const ProfileScreen(), // Profile screen with user stats and achievements
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _screens[_selectedIndex],
        Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          body: Container(),
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            color: Colors.blueAccent,
            buttonBackgroundColor: Colors.blueAccent,
            animationDuration: const Duration(milliseconds: 300),
            height: 60,
            index: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: const [
              Icon(Icons.calendar_today, color: Colors.white),
              Icon(Icons.self_improvement, color: Colors.white),
              Icon(Icons.home,
                  color: Colors.white,
                  size: 30), // Made home icon slightly larger
              Icon(Icons.forum, color: Colors.white),
              Icon(Icons.person, color: Colors.white),
            ],
          ),
        ),
      ],
    );
  }
}
