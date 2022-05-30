import 'package:aplikacja__mobilna/messages.dart';
import 'package:enough_mail/enough_mail.dart';
import 'package:flutter/material.dart';

class ConnectPage extends StatefulWidget {
  final String? email;
  final String? password;

  const ConnectPage({Key? key, required this.email, required this.password})
      : super(key: key);

  @override
  State<ConnectPage> createState() => _ConnectPageState();
}

typedef ConnectedCallback = void Function(Mailbox);
typedef ErrorCallback = void Function(String);

class _ConnectPageState extends State<ConnectPage> {
  @override
  Widget build(BuildContext context) {
    if ((widget.email?.isEmpty ?? true) || (widget.password?.isEmpty ?? true)) {
      return buildError("Email and password are required");
    }

    // TODO: Error handling
    connect(widget.email!, widget.password!).then((messages) => {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute<MessagesPage>(
                  builder: (context) =>
                      MessagesPage(title: 'Inbox', messages: messages)))
        });

    return buildWait();
  }

  Widget buildError(String message) {
    return Scaffold(
      body: Center(
        child: Text(message),
      ),
    );
  }

  Widget buildWait() {
    return const Scaffold(
      body: Center(
        child: Text("Please wait while we sign you in"),
      ),
    );
  }

  Future<List<MimeMessage>> connect(String email, String password) async {
    final config = await Discover.discover(widget.email!);

    // TODO: Show error when config is null (could not be detected)
    final account =
        MailAccount.fromDiscoveredSettings(email, email, password, config!);

    // TODO: Disable logging
    final client = MailClient(account, isLogEnabled: true);

    await client.connect();
    await client.selectInbox();

    final messages = await client.fetchMessages(count: 10);

    return messages;
  }
}
