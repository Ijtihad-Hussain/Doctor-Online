import 'dart:typed_data';
import 'package:tele_consult/models/user.dart';

class Message {
  final AppUser sender;
  final AppUser receiver;
  final String text;
  final MessageType messageType;
  final List<int>? fileBytes;
  final String? fileName;

  Message({
    required this.sender,
    required this.receiver,
    required this.text,
    required this.messageType,
    this.fileBytes,
    this.fileName,
  });
}


enum MessageType {
  text,
  file,
}