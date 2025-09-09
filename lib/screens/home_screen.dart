import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/home_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryLight,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        elevation: 0,
        shape: CircleBorder(
          side: BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),
        child: Icon(Icons.add, color: AppColors.primary, size: 28),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Full-screen gradient background
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    AppColors.primaryLight,
                    AppColors.secondaryLight,
                    const Color(0xFFFFFFFF),
                  ],
                ),
              ),
            ),
            // Subtle blue accent pattern
            Positioned(
              top: -100,
              right: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      AppColors.primary.withOpacity(0.08),
                      Colors.transparent,
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Additional accent pattern
            Positioned(
              bottom: 100,
              left: -150,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [
                      AppColors.primary.withOpacity(0.05),
                      Colors.transparent,
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            ListView(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
              children: [
                // Header Section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Welcome back, Yvonne 👋",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF2D3748),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Your journey within continues today.",
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF4A5568),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: AppColors.primary,
                      child: const Text(
                        "YW",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Today's Highlight Card
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: AppColors.mainGradient,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.calendar_today, color: Colors.white),
                          SizedBox(width: 12),
                          Text(
                            "Today with Atsulu",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Session starts at 2:00 PM",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: AppColors.primary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                          elevation: 4,
                          shadowColor: AppColors.primary.withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Join Now",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Quick Actions Row (fixed for smooth scroll)
                SizedBox(
                  height: 120, // adjust to card height
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      QuickActionCard(
                        title: "Meditation",
                        icon: Icons.self_improvement,
                        backgroundColor: const Color(0xFF9C27B0),
                        onTap: () {},
                      ),
                      const SizedBox(width: 16),
                      QuickActionCard(
                        title: "Journal Entry",
                        icon: Icons.edit_note,
                        backgroundColor: const Color(0xFF00BCD4),
                        onTap: () {},
                      ),
                      const SizedBox(width: 16),
                      QuickActionCard(
                        title: "Resources",
                        icon: Icons.menu_book,
                        backgroundColor: const Color(0xFF4CAF50),
                        onTap: () {},
                      ),
                      const SizedBox(width: 16),
                      QuickActionCard(
                        title: "Messages",
                        icon: Icons.message,
                        backgroundColor: const Color(0xFF3F51B5),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Recommendations Section
                const Text(
                  "For You",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 16),
                const RecommendationCard(
                  title: "5-Minute Breathing Exercise",
                  tag: "Mindfulness",
                  icon: Icons.spa,
                ),
                const RecommendationCard(
                  title: "Daily Affirmation",
                  tag: "Self-Care",
                  icon: Icons.favorite,
                ),

                // Progress Tracker
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 25,
                        offset: const Offset(0, 10),
                        spreadRadius: 6,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.primary,
                            width: 3,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "80%",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "This week's progress with Atsulu",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.textDark,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Keep going! You're doing great.",
                              style: TextStyle(
                                color: AppColors.textGray,
                                fontSize: 14,
                              ),
                            ),
                          ],
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
}
