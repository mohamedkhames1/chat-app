import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> registerAcount({required String email,required String password}) async {
    emit(RegisterLoading());
    try {
      var auth = FirebaseAuth.instance;
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
           emit(RegisterFailure(errmessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errmessage: 'The account already exists for that email.'));}
      }on Exception catch (e) {
      RegisterFailure(errmessage: 'there are error try again');
    }
  }

}
