import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/pages/AuthService.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String userId, docId;
  Profile({Key? key, required this.userId, required this.docId}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {

  String subjects = '';
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: authService.getUserStream(widget.docId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text("No data available"));
          }
          var user = snapshot.data!.data() as Map<String, dynamic>;
          String subjects = List<String>.from(user['subjects'] ?? []).join(', ');

          return profileView(user, subjects);
        },
      ),
    );
  }

  Widget profileView(Map<String, dynamic> user, String subjects) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.webp'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("../../assets/profile.webp"),
                ),
                const SizedBox(height: 16),
                Text(
                  "${user['first name']} ${user['last name']}",
                  style: const TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text("${user['email']}", style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.85))),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (user['role'] == 'tutor') ...[
                        const Text(
                          "Subjects",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          subjects,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                      const SizedBox(height: 16),
                      const Text("Bio", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black87)),
                      Text("${user['bio']}", style: const TextStyle(fontSize: 16, color: Colors.black54)),
                      // Add more profile details here
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit', arguments: user);
                  },
                  child: const Text('Edit Profile'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}