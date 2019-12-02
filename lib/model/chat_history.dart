import 'package:intl/intl.dart';

final List<ChatHistory> chatHistories = [
  ChatHistory(
    assetName: 'assets/images/morty.jpg',
    name: 'Morty',
    message: 'Is it Organic',
    time: 'date time',
  ),
  ChatHistory(
    assetName: 'assets/images/rick.jpg',
    name: 'Rick',
    message: 'Wubalubadubdub',
    time: 'date time',
  ),
  ChatHistory(
    assetName: 'assets/images/summer.jpg',
    name: 'Summer',
    message: 'You know you\'re kind of a dick, right?',
    time: 'date time',
  ),
];


int chatIndex(ChatHistory chatHistory) => chatHistories.indexOf(chatHistory);

class ChatHistory {
  final String assetName;
  final String name;
  final String message;
  final String time;

  ChatHistory({this.assetName, this.name, this.message, this.time});
}
