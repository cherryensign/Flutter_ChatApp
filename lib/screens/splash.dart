import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(
              top: 30,
              bottom: 20,
              left: 20,
              right: 20,
            ),
            width: 200,
            child: Column(
              children: const [
                Icon(
                  Icons.chat_bubble_outline_outlined,
                  size: 150,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Chat App by Mithilesh',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
