import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodioo/core/theme/app_typography.dart';

import '../../../repositories/authentication/auth_bloc.dart';
import '../../../repositories/authentication/auth_event.dart';
import 'widget/switch_dark_mode.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(28),
            child: SingleChildScrollView(
                child: Column(
              children: [
                // Cover Photo Section
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage('https://example.com/cover-photo.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Profile Picture
                      Positioned(
                        bottom: -50,
                        left: 20,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 4,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                                'https://example.com/profile-pic.jpg'),
                          ),
                        ),
                      ),

                      // Edit Cover Photo Button
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.camera_alt,
                                  color: Colors.white, size: 16),
                              SizedBox(width: 4),
                              Text(
                                'Edit Cover Photo',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Profile Info Section
                Container(
                  padding: EdgeInsets.only(top: 60, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Software Developer at Tech Company',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16),

                      // Action Buttons
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: EdgeInsets.symmetric(vertical: 12),
                              ),
                              child: Text('Edit Profile'),
                            ),
                          ),
                          SizedBox(width: 8),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_horiz),
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.grey[200],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // About Section
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      ListTile(
                        leading: Icon(Icons.home),
                        title: Text('Lives in New York, USA'),
                      ),
                      ListTile(
                        leading: Icon(Icons.work),
                        title: Text('Works at Tech Company'),
                      ),
                      ListTile(
                        leading: Icon(Icons.school),
                        title: Text('Studied at University of Technology'),
                      ),
                    ],
                  ),
                ),

                // Photos Section
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Photos',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://example.com/photo$index.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(Logout());
                  },
                  child: const Text("Đăng xuất",
                      style: AppTypographyDark.textContent),
                ),
                const SwitchDarkMode(),
              ],
            ))));
  }
}
