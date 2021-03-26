import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
enum Status{
  Uninitialized, Authenticated, Authenticating, Unauthenticated
}

class CurrentUser extends ChangeNotifier {
  String _uid;
  String _email;
  String _name;
  String _img;

  String get getUid=> _uid;
  String get getEmail=> _email;
  String get getname=> _name;
  String get getImg=> _img;

GoogleSignIn _googleSignIn;
  FirebaseAuth _auth = FirebaseAuth.instance;
  User _user;
  Status _status = Status.Uninitialized;

  Status get status => _status;
  User get user => _user;
  Future<bool> signUpUser(String email, String password) async{

  try{
  _status = Status.Authenticating;
  notifyListeners();
   await _auth.createUserWithEmailAndPassword(email: email, password: password);
   return true;
  }catch(e){
    _status =Status.Unauthenticated;
    notifyListeners();
    return false;
  }
  }

  Future<bool> loginUser(String email, String password) async{

    try{
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
     return true;
     
    }catch(e){
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }


  Future<bool> signInWithGoogle() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);
      return true;
    } catch (e) {
      print(e);
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  
  }
  
  Future<void> _onAuthStateChanged(User firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;
      _status = Status.Authenticated;
    }
    notifyListeners();
  }

}
