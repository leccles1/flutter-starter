// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class GoogleAuthService {

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  //Shared state for Widgets
  Stream<FirebaseUser> user;
  Stream<Map<String, dynamic>> profile;
  PublishSubject loading = PublishSubject();

  GoogleAuthService() {
    Stream<FirebaseUser> user = _auth.onAuthStateChanged;

    profile = user.switchMap((FirebaseUser u) {
      if (u != null) {
        return _db
          .collection('users')
          .document(u.uid)
          .snapshots()
          .map( (snap) => snap.data);
      } else {
        return Stream.value({});
      }
    });
  }

  Future<FirebaseUser> googleSignIn() async {
    loading.add(true);

    GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credentials = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    AuthResult authResult = await _auth.signInWithCredential(credentials);
    FirebaseUser user = authResult.user;
  
    updateUserData(user);
    loading.add(false);

    print('Signed in' + user.displayName);
    return user;
  }

  void updateUserData(FirebaseUser user) async {
    DocumentReference ref = _db.collection('users').document(user.uid);

    return ref.setData({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoUrl,
      'displayName': user.displayName,
      'lastSeen': DateTime.now()
    }, merge: true);
  }

  void signOut() {
    _auth.signOut();
  }

}

final GoogleAuthService googleAuthService = GoogleAuthService();