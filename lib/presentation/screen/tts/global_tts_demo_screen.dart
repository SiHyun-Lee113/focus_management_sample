import 'package:barrier_free_test/domain/tts/global_tts_controller.dart';
import 'package:flutter/material.dart';

class GlobalTtsDemoScreen extends StatefulWidget {
  const GlobalTtsDemoScreen({super.key});

  @override
  State<GlobalTtsDemoScreen> createState() => _GlobalTtsDemoScreenState();
}

class _GlobalTtsDemoScreenState extends State<GlobalTtsDemoScreen> {
  final _textController = TextEditingController(text: '안녕하세요. 글로벌 TTS입니다.');

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tts = GlobalTtsController.instance;

    return Scaffold(
      appBar: AppBar(title: const Text('Global TTS Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('전역 TTS 컨트롤러 사용 예시'),
            const SizedBox(height: 12),
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: '읽을 텍스트',
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () => tts.speak(
                    _textController.text,
                    source: 'demo.input',
                  ),
                  child: const Text('말하기'),
                ),
                ElevatedButton(
                  onPressed: () => tts.speak(
                    '헤더 영역입니다.',
                    source: 'demo.section',
                  ),
                  child: const Text('헤더 안내'),
                ),
                ElevatedButton(
                  onPressed: () => tts.speak(
                    '처음으로 버튼입니다.',
                    source: 'demo.widget',
                  ),
                  child: const Text('버튼 안내'),
                ),
                ElevatedButton(
                  onPressed: () => tts.stop(),
                  child: const Text('정지'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              '설명: 여러 화면에서 동일한 컨트롤러로 speak를 호출해도 '
              '항상 하나의 TTS 인스턴스가 관리됩니다.',
            ),
          ],
        ),
      ),
    );
  }
}
