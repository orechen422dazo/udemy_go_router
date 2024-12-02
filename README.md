# udemy_go_router
Udemyの講座でGoRouterの学習。

パスの設定がバージョンアップで変更されていたのと、`context.goNamed`を使用しないとモバイルではルートのエラーが発生する。

非同期な処理を記述するときは、if(mounted) が必要だった。過去の動画だとLintの警告が出てこないようだ。

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if(mounted) {
        context.go('/login/redirection');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('スプラッシュ', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
```

### Case Login Page
```dart
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
```
