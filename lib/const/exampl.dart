/*
  Future<UserCredential?> signInWithFacebook() async {
    try {
      final result = await FacebookAuth.instance
          .login(permissions: ['public_profile', 'email']);

      if (result.status == LoginStatus.success) {
        // Extract the access token from the login result
        final OAuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.token);

        // Sign in with the Facebook credential using Firebase Authentication
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        // Return the UserCredential
        return userCredential;
      } else {
        // Handle login failure
        if (kDebugMode) {
          print('Facebook login failed: ${result.status} - ${result.message}');
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error signing in with Facebook: $e');
      }
      return null;
    }
  }
*/


/*
                            FirebaseServiceProvider.signWithGoogle(
                                    context: context)
                                .then((userCredentialGmail) async {
                              Navigator.pop(context);
                              Navigator.pushReplacementNamed(
                                  context, AppRouters.mainPage);
                            }

                            */
/*
                              if (userCredentialGmail != null) {
                                if (await FirebaseDatabase.userExists()) {
                                  if (mounted) {
                                    Navigator.pushReplacementNamed(
                                        context, AppRouters.mainPage);
                                  }
                                } else {
                                  await FirebaseDatabase.createUserGmail()
                                      .then((value) {
                                    globalMethod.flutterToast(
                                        msg: "Successfully Login");
                                    Navigator.pushReplacementNamed(
                                        context, AppRouters.mainPage);
                                  });
                                }
                              }
                              */

// );

/*
Future<bool> _checkInternetConnectivity() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}
 */

// var status = userDoc.data()?["status"];

// if(isEmailVerify){
//   await FirebaseFirestore.instance
//       .collection("user")
//       .doc(userCredential.user!.uid)
//       .update({"status":"approved"});
//   Navigator.pushNamed(context, AppRouters.mainPage);
//   globalMethod.flutterToast(msg: "Sign in Successfully");
// }

// W/d_tour_firebas(32473): Unknown chunk type '200'.