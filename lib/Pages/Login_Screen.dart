import 'package:chatapp/Pages/chatpage.dart';
import 'package:chatapp/Pages/cubit/chat_page_cubit/chat_page_cubit.dart';
import 'package:chatapp/Pages/cubit/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../helper/show_snackbar.dart';
import '../widgets/Constant.dart';
import '../widgets/custom_Text_field.dart';
import '../widgets/custom_button.dart';
import 'Register_Screen.dart';

class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> formkry = GlobalKey();
  static const String id = 'LoginScreen';
  String? email;
  String? password;
  bool isloading = false;

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isloading = true;
        } else if (state is LoginSuccess) {
          isloading = false;
          Navigator.pushNamed(context, ChatPage.id);
        } else if (state is LoginFailure) {
          isloading = false;
          showSnackbar(context,state.errmessage);
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isloading,
        child: Scaffold(
          backgroundColor: kprimaryclr,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Form(
              key: formkry,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Image.asset(
                    Klogo,
                    height: 100,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Scholer Chat',
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontFamily: 'pacifico'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  const Row(
                    children: [
                      Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextFormField(
                    hinttext: 'Email',
                    onchange: (data) {
                      email = data;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hinttext: 'Password',
                    onchange: (data) {
                      password = data;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      ontap: () async {
                        if (formkry.currentState!.validate()) {

                         BlocProvider.of<LoginCubit>(context).loginUser(email: email!, password: password!);
                         BlocProvider.of<ChatPageCubit>(context).getmessage();
                        } else {}
                      },
                      title: 'LOGIN'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'don\'t have an account ?  ',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterScreen.id);
                        },
                        child: const Text(
                          '  Register ',
                          style: TextStyle(
                            color: Color(0xffc7ede6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
