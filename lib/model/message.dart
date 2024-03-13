import 'package:flutter/foundation.dart';

import '../widgets/Constant.dart';

class Message {

 final String message;
 final String id;
  Message(this.message, this.id);
factory Message.fromJeson(jsonData){
 return Message(jsonData[Kmessage],jsonData['id']);
 }
}
