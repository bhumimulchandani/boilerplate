import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DummyPage extends StatefulWidget {
  const DummyPage({
    super.key,
    required this.userID,
    required this.username,
  });

  final int userID;
  final String username;

  @override
  State<DummyPage> createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'UserID: ${widget.userID}',
              ),
              Text(
                'UserName: ${widget.username}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
