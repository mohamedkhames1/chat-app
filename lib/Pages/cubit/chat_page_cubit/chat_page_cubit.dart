import 'package:chatapp/model/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/Constant.dart';
part 'chat_page_state.dart';

class ChatPageCubit extends Cubit<ChatPageState> {
  ChatPageCubit() : super(ChatPageInitial());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kmessageCollection);

  void SendMessage({required String email, required String message}) {
    messages.add({
      Kmessage: message,
      kcreadetAt: DateTime.now(),
      'id': email,
    });
  }

  void getmessage() {
    messages.orderBy(kcreadetAt, descending: true).snapshots().listen((event) {
      List<Message> messageList=[];
      for(var doc in event.docs){
        messageList.add(Message.fromJeson(doc));
      }
      emit(ChatPageSuccess(messages:messageList ));
    });
  }
}
