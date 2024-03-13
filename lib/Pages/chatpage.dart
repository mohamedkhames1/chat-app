import 'package:chatapp/Pages/cubit/chat_page_cubit/chat_page_cubit.dart';
import 'package:chatapp/widgets/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/message.dart';
import 'custom_bouble.dart';

class ChatPage extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  final _controler = ScrollController();
  static String id = 'chatPage';
  List<Message> messageList = [];

  ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kprimaryclr,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Klogo,
              height: 50,
            ),
            const Text('Chat'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: BlocConsumer<ChatPageCubit, ChatPageState>(
            builder: (BuildContext context, state) {
              return ListView.builder(
                reverse: true,
                itemBuilder: (context, index) {
                  return messageList[index].id == email
                      ? Chat_Bubble(
                          message: messageList[index],
                        )
                      : Chat_BubbleFrend(message: messageList[index]);
                },
                itemCount: messageList.length,
                controller: _controler,
              );
            },
            listener: (BuildContext context, Object? state) {
              if (state is ChatPageSuccess) {
                messageList = state.messages;
              }
            },
          )),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    onSubmitted: (data) {
                      BlocProvider.of<ChatPageCubit>(context).SendMessage(email: email.toString(), message: data);
                      controller.clear();
                      _controler.animateTo(
                        0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn,
                      );
                    },
                    decoration: InputDecoration(
                      hintText: 'Send Message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: kprimaryclr),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: kprimaryclr),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon:  const Icon(
                    Icons.send,
                    color: kprimaryclr,
                  ),
                  onPressed: () {
                    // BlocProvider.of<ChatPageCubit>(context).SendMessage(email: email.toString(), message:data );
                    // controller.clear();
                    // _controler.animateTo(
                    //   0,
                    //   duration: const Duration(milliseconds: 500),
                    //   curve: Curves.fastOutSlowIn,
                   // );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void nn(Object? email) {

  }
}
