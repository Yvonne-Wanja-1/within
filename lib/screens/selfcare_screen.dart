import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class SelfCareScreen extends StatelessWidget {
  const SelfCareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background gradient
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
            CustomScrollView(
              slivers: [
                // App Bar
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Self Care',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[700],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications_none,
                              color: Colors.white),
                          onPressed: () {
                            // Implement notifications
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // Daily Mood Tracker
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Card(
                      elevation: 8,
                      shadowColor: Colors.purple[300]?.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.purple[400]!,
                              Colors.purple[300]!,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'How are you feeling today?',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildMoodButton('😊', 'Great'),
                                _buildMoodButton('😌', 'Good'),
                                _buildMoodButton('😐', 'Okay'),
                                _buildMoodButton('😔', 'Low'),
                                _buildMoodButton('😢', 'Bad'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Daily Self-Care Activities
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Today\'s Self-Care',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '2/5 completed',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        _buildActivityCard(
                          'Morning Meditation',
                          '10 minutes of mindful breathing',
                          Icons.self_improvement,
                          Colors.blue[400]!,
                          true,
                        ),
                        _buildActivityCard(
                          'Gratitude Journal',
                          'Write 3 things you\'re grateful for',
                          Icons.edit_note,
                          Colors.green[400]!,
                          true,
                        ),
                        _buildActivityCard(
                          'Afternoon Walk',
                          '15 minutes of fresh air',
                          Icons.directions_walk,
                          Colors.orange[400]!,
                          false,
                        ),
                        _buildActivityCard(
                          'Evening Reflection',
                          'Review your day and achievements',
                          Icons.nights_stay,
                          Colors.indigo[400]!,
                          false,
                        ),
                        _buildActivityCard(
                          'Bedtime Routine',
                          'Prepare for restful sleep',
                          Icons.bed,
                          Colors.purple[400]!,
                          false,
                        ),
                      ],
                    ),
                  ),
                ),

                // Wellness Tips
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Wellness Tips',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          height: 180,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              _buildWellnessTipCard(
                                'Mindful Breathing',
                                'Take 5 deep breaths when feeling stressed',
                                Icons.air,
                                const Color(0xFF7C4DFF),
                              ),
                              _buildWellnessTipCard(
                                'Stay Hydrated',
                                'Drink water regularly throughout the day',
                                Icons.water_drop,
                                const Color(0xFF4ECDC4),
                              ),
                              _buildWellnessTipCard(
                                'Digital Detox',
                                'Take regular breaks from screens',
                                Icons.phone_android,
                                const Color(0xFFFF6B6B),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Self-Care Resources
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Resources',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildResourceCard(
                          'Guided Meditation',
                          'Explore our collection of meditation sessions',
                          Icons.headphones,
                          Colors.teal[400]!,
                        ),
                        _buildResourceCard(
                          'Sleep Stories',
                          'Calming stories for better sleep',
                          Icons.night_shelter,
                          Colors.indigo[400]!,
                        ),
                        _buildResourceCard(
                          'Journal Prompts',
                          'Inspiration for your daily reflections',
                          Icons.book,
                          Colors.amber[700]!,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add custom self-care activity
        },
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildMoodButton(String emoji, String label) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: Colors.white24,
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(16),
          ),
          child: Text(
            emoji,
            style: const TextStyle(fontSize: 24),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildActivityCard(
    String title,
    String description,
    IconData icon,
    Color color,
    bool completed,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shadowColor: color.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: completed ? TextDecoration.lineThrough : null,
            color: completed ? Colors.grey : Colors.black87,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            color: Colors.grey[600],
            decoration: completed ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          value: completed,
          onChanged: (value) {},
          activeColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Widget _buildWellnessTipCard(
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(right: 16),
      elevation: 4,
      shadowColor: color.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color,
              Color.lerp(color, Colors.white, 0.3)!,
            ],
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 40),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.9),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResourceCard(
    String title,
    String description,
    IconData icon,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 2,
      shadowColor: color.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
