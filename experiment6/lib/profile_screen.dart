import 'package:flutter/material.dart';
import 'api_services.dart';

class ProfileScreen extends StatefulWidget {
  final String username;

  ProfileScreen({required this.username});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      final data = await ApiService.fetchUserData(widget.username);
      setState(() {
        userData = data;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub Profile'),
      ),
      body: userData == null
          ? Center(child: CircularProgressIndicator())
          : ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          ListTile(
            title: Text('Name'),
            subtitle: Text(userData!['name'] ?? 'N/A'),
          ),
          ListTile(
            title: Text('Bio'),
            subtitle: Text(userData!['bio'] ?? 'N/A'),
          ),
          ListTile(
            title: Text('Followers'),
            subtitle: Text(userData!['followers'].toString()),
          ),
          ListTile(
            title: Text('Following'),
            subtitle: Text(userData!['following'].toString()),
          ),
          ListTile(
            title: Text('Public Repositories'),
            subtitle: Text(userData!['public_repos'].toString()),
          ),
        ],
      ),
    );
  }
}
