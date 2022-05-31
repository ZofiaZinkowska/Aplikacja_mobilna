import 'package:aplikacja__mobilna/compose.dart';
import 'package:aplikacja__mobilna/read.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key, required this.title, required this.messages})
      : super(key: key);

  final String title;
  final List<MimeMessage> messages;

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: _itemBuilder,
          itemCount: widget.messages.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ComposePage()));
        },
        tooltip: 'New message',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final message = widget.messages[index];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
              child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute<ReadPage>(
                            builder: (context) => ReadPage(message: message)));
                  },
                  icon: const Icon(Icons.read_more))),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('From: ${message.from}'),
                Text('Subject: ${message.decodeSubject()}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
