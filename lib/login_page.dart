import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:udemy_go_router/sessions.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('このアプリをご利用の方はログインください。'),
            ElevatedButton(onPressed: () async {
              await login();
              if(context.mounted) {
                context.go('/login/redirection');
              }
            }, child: const Text('ログインする'))
          ],
        ),
      ),
    );
  }
}
