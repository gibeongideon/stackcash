// class ApiConnect {
//   /// {@macro authentication_repository}
//   ApiConnect({this.email,});
    
  
//   Future<void> signUpWithEmailAndPassword({
//     @required String email,
//     @required String password,
//   }) async {
//     assert(email != null && password != null);
//     try {
//       await _firebaseAuth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on Exception {
//       throw ;
//     }
//   }


// }