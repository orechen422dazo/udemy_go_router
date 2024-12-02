import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:udemy_go_router/sessions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ホーム'),
        actions: [
          TextButton(onPressed: () async {
            await logout();
            if(context.mounted) {
              context.go('/login');
            }
          }, child: const Text('ログアウト'))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              // ✅ 正しい使用方法
              context.pushNamed(
                  'detail',
                  pathParameters: {'id': 'A'}
              );
            }, child: const Text('Aを閲覧する')),
            ElevatedButton(onPressed: () {
              // ✅ 正しい使用方法
              context.pushNamed(
                  'detail',
                  pathParameters: {'id': 'B'}
              );
            }, child: const Text('Bを閲覧する')),
            ElevatedButton(onPressed: () {
              // ✅ 正しい使用方法
              context.pushNamed(
                  'detail',
                  pathParameters: {'id': 'C'}
              );
            }, child: const Text('Cを閲覧する')),
          ],
        ),
      ),
    );
  }
}
