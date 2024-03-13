import 'package:chatapp/Pages/Login_Screen.dart';
import 'package:chatapp/Pages/cubit/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../helper/show_snackbar.dart';
import '../widgets/Constant.dart';
import '../widgets/custom_Text_field.dart';
import '../widgets/custom_button.dart';




class RegisterScreen extends StatelessWidget {
  String? email;
  static String id = 'Register';
  String? password;

  GlobalKey<FormState> formkry = GlobalKey();

  bool isloading = false;

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit,RegisterState>(
      listener: (context, state){
        if (state is RegisterLoading) {
          isloading = true;
        } else if (state is RegisterSuccess) {
          isloading = false;
          Navigator.pushNamed(context, LoginScreen.id);
        } else if (state is RegisterFailure) {
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
                        'REGISTER',
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
                          BlocProvider.of<RegisterCubit>(context).registerAcount(email: email!, password: password!);

                        } else {}
                      },
                      title: 'REGISTER'),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'aready  have an account ?  ',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          '  Login ',
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
