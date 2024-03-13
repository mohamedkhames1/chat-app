import 'package:chatapp/Pages/chatpage.dart';
import 'package:chatapp/Pages/cubit/chat_page_cubit/chat_page_cubit.dart';
import 'package:chatapp/Pages/cubit/login_cubit/login_cubit.dart';
import 'package:chatapp/Pages/cubit/register_cubit/register_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Pages/Login_Screen.dart';
import 'Pages/Register_Screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => ChatPageCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          RegisterScreen.id: (context) => RegisterScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          ChatPage.id: (context) => ChatPage(),
        },
        initialRoute: LoginScreen.id,
        home: LoginScreen(),
      ),
    );
  }
}
