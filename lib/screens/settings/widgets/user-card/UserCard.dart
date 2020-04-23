import 'package:flutter/material.dart';
import 'package:flutter_starter/services/auth/firebase/GoogleAuthService.dart';

class UserCard extends StatefulWidget {
  UserCard({Key key}) : super(key: key);

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  Map<String, dynamic> _profile;
  bool _loading = false;

  @override
  void initState() {
    super.initState();

    googleAuthService.profile.listen( (state) => setState( () => _profile = state));
    googleAuthService.loading.listen( (state) => setState( () => _loading = state));
    
  }

  @override
  void dispose() {
    // googleAuthService.profile.stop();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(_profile['photoURL']),),
              title: Text(_profile['displayName']),
              subtitle: Text(_profile['email']),
            ),
            Center(child: Container(
              child: Text(_loading.toString()),
            ),)
          ],
        ),
      ),
    );
  }
}
