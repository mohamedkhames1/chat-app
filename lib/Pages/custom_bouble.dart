import 'package:flutter/material.dart';

import '../model/message.dart';
import '../widgets/Constant.dart';

class Chat_Bubble extends StatelessWidget {
   Chat_Bubble({
    required this.message
  });
Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(

        padding: const EdgeInsets.only(left:16,top: 32,right: 32,bottom: 32),
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: const BoxDecoration(
          color: kprimaryclr,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
        ),
        child:  Text(
          message.message, style: const TextStyle(
            color: Colors.white
        ),
        ),
      ),
    );
  }
}


class Chat_BubbleFrend extends StatelessWidget {
  Chat_BubbleFrend({
    required this.message
  });
Message message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(

        padding: const EdgeInsets.only(left:16,top: 32,right: 32,bottom: 32),
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: const BoxDecoration(
          color: Color(0xff006d84),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
        ),
        child:  Text(
          message.message, style: const TextStyle(
            color: Colors.white
        ),
        ),
      ),
    );
  }
}
