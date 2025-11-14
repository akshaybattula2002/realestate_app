import 'package:flutter/material.dart';
import 'package:get/get.dart';

class customAppDrawer extends StatefulWidget {
  const customAppDrawer({super.key});

  @override
  State<customAppDrawer> createState() => _customAppDrawerState();
}

class _customAppDrawerState extends State<customAppDrawer> {
  @override
  Widget build(BuildContext context) {
    final String currentRoute = Get.currentRoute;

    // Navigation + highlight
    void navigateTo(String route) {
      if (currentRoute != route) {
        Get.back();
        Get.offNamed(route);
      } else {
        Get.back();
      }
    }

    Widget buildMenuItem({
      required IconData icon,
      required String title,
      required String route,
    }) {
      final bool isSelected = currentRoute == route;
      return InkWell(
        onTap: () => navigateTo(route),
        borderRadius: BorderRadius.circular(14),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 14),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue.shade50 : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Icon(icon, color: isSelected ? Colors.blue : Colors.black),
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.blue : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Drawer(
      child: Column(
        children: [
          _buildHeader(),

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 10),

                buildMenuItem(
                  icon: Icons.home_outlined,
                  title: "Home",
                  route: "/home",
                ),

                buildMenuItem(
                  icon: Icons.house_outlined,
                  title: "My Properties",
                  route: "/my-properties",
                ),

                buildMenuItem(
                  icon: Icons.favorite_border,
                  title: "Favorites",
                  route: "/favorites",
                ),

                buildMenuItem(
                  icon: Icons.add_home_outlined,
                  title: "Add Property",
                  route: "/add-property",
                ),

                buildMenuItem(
                  icon: Icons.person_search_outlined,
                  title: "Agents",
                  route: "/agents",
                ),

                buildMenuItem(
                  icon: Icons.calculate_outlined,
                  title: "Mortgage Calculator",
                  route: "/mortgage-calculator",
                ),

                buildMenuItem(
                  icon: Icons.message_outlined,
                  title: "Messages",
                  route: "/messages",
                ),

                buildMenuItem(
                  icon: Icons.settings_outlined,
                  title: "Settings",
                  route: "/settings",
                ),

                const SizedBox(height: 16),
                Divider(color: Colors.grey.shade300),

                // Sign Out
                InkWell(
                  onTap: () {
                    // Navigate to login page and clear all previous routes
                    Get.offAllNamed('/loginpage'); // Ensure '/login' is your login route
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 14),
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: Colors.red.shade600),
                        const SizedBox(width: 16),
                        Text(
                          "Sign Out",
                          style: TextStyle(
                            color: Colors.red.shade600,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 110,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Real Estate Menu",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
