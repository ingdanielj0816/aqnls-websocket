import 'package:flutter/cupertino.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

class FacebookUserData {
  final String? name;
  final String? email;

  FacebookUserData({this.name, this.email});
}

Future<FacebookUserData?> initiateFacebookLogin() async {
  final fb = FacebookLogin();

  final res = await fb.logIn(permissions: [
    FacebookPermission.publicProfile,
    FacebookPermission.email,
  ]);

  switch (res.status) {
    case FacebookLoginStatus.success:
      final email = await fb.getUserEmail();
      if (email != null) debugPrint('And your email is $email');

      final userProfile = await fb.getUserProfile();
      final name = userProfile?.name;
      final firstName = userProfile?.firstName;
      final lastName = userProfile?.lastName;

      if (name != null) {
        debugPrint('Your name is $name');
        debugPrint('Your first name is $firstName');
        debugPrint('Your last name is $lastName');
        return FacebookUserData(name: name, email: email);
      }
      break;
    case FacebookLoginStatus.cancel:
      break;
    case FacebookLoginStatus.error:
      debugPrint('Error while log in: ${res.error}');
      break;
  }

  return null;
}
