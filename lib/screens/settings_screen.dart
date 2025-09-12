import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    AppColors.primaryLight,
                    AppColors.secondaryLight,
                    Colors.white,
                  ],
                ),
              ),
            ),
            // Content
            CustomScrollView(
              slivers: [
                // App Bar
                SliverAppBar(
                  floating: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black87),
                    onPressed: () => Navigator.pop(context),
                  ),
                  title: const Text(
                    'Settings',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Settings List
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSettingSection(
                          'Account',
                          [
                            _buildSettingTile(
                              'Personal Information',
                              Icons.person_outline,
                              onTap: () {
                                // Handle personal info
                              },
                            ),
                            _buildSettingTile(
                              'Notifications',
                              Icons.notifications_none,
                              onTap: () {
                                // Handle notifications
                              },
                            ),
                            _buildSettingTile(
                              'Privacy',
                              Icons.lock_outline,
                              onTap: () {
                                // Handle privacy
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        _buildSettingSection(
                          'Preferences',
                          [
                            _buildSettingTile(
                              'Language',
                              Icons.language,
                              trailing: 'English',
                              onTap: () {
                                // Handle language
                              },
                            ),
                            _buildSettingTile(
                              'Dark Mode',
                              Icons.dark_mode_outlined,
                              isSwitch: true,
                              onTap: () {
                                // Handle theme toggle
                              },
                            ),
                            _buildSettingTile(
                              'Reminder Time',
                              Icons.access_time,
                              trailing: '9:00 AM',
                              onTap: () {
                                // Handle reminder time
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        _buildSettingSection(
                          'Support',
                          [
                            _buildSettingTile(
                              'Help Center',
                              Icons.help_outline,
                              onTap: () {
                                // Handle help center
                              },
                            ),
                            _buildSettingTile(
                              'Contact Us',
                              Icons.mail_outline,
                              onTap: () {
                                // Handle contact
                              },
                            ),
                            _buildSettingTile(
                              'Terms of Service',
                              Icons.description_outlined,
                              onTap: () {
                                // Handle terms
                              },
                            ),
                            _buildSettingTile(
                              'Privacy Policy',
                              Icons.privacy_tip_outlined,
                              onTap: () {
                                // Handle privacy policy
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        _buildSettingSection(
                          'Account Actions',
                          [
                            _buildSettingTile(
                              'Sign Out',
                              Icons.logout,
                              textColor: Colors.red,
                              onTap: () {
                                // Handle sign out
                              },
                            ),
                          ],
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
    );
  }

  Widget _buildSettingSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: items,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingTile(
    String title,
    IconData icon, {
    String? trailing,
    bool isSwitch = false,
    Color? textColor,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        leading: Icon(icon, color: AppColors.primary),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: textColor ?? Colors.black87,
          ),
        ),
        trailing: isSwitch
            ? Switch(
                value: false, // You should manage this state
                onChanged: (_) => onTap(),
                activeColor: Colors.white, // Thumb color when active
                activeTrackColor: Colors.blue, // Track color when active
                inactiveThumbColor:
                    Colors.grey[100], // Thumb color when inactive
                inactiveTrackColor:
                    Colors.grey[300], // Track color when inactive
              )
            : trailing != null
                ? Text(
                    trailing,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  )
                : const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.black54,
                  ),
        onTap: onTap,
      ),
    );
  }
}
