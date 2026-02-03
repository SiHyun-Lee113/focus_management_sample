import 'package:barrier_free_test/presentation/screen/init/init_screen_cubit.dart';
import 'package:barrier_free_test/presentation/screen/init/model/init_screen_tts_scenario_event.dart';

extension InitScreenCubitTtsServiceExtension on InitScreenCubit {
  void handelTtsEvent(InitScreenTtsScenarioEvent event) async {
    if (!state.isVoiceMode) return;

    print('handelTtsEvent $event');

    switch (event) {
      case InitScreenApproach():
        await ttsService.speak('초기 화면입니다.');
        break;
      case InitScreenSectionHeader():
        await ttsService.speak('헤더 영역입니다.');
        break;
      case InitScreenSectionStartOrder():
        await ttsService.speak('주문하기 영역입니다.');
        break;
      case InitScreenSectionLanguage():
        await ttsService.speak('언어를 선택할 수 있는 영역입니다.');
        break;
      case InitScreenWidgetHome():
        await ttsService.speak('홈 화면으로 이동하는 버튼입니다.');
        break;
      case InitScreenWidgetCallAgent():
        await ttsService.speak('직원 호출 버튼입니다.');
        break;
      case InitScreenWidgetStartOrder():
        await ttsService.speak('주문 시작 버튼입니다.');
        break;
      case InitScreenWidgetLanguage():
        await ttsService.speak(event.language);
        break;
      case InitScreenButtonClick():
        await ttsService.speak('click');
    }
  }
}
