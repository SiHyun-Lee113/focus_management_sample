import 'package:barrier_free_test/presentation/screen/init/init_screen_cubit.dart';
import 'package:barrier_free_test/presentation/screen/init/model/init_screen_tts_scenario_event.dart';

extension InitScreenCubitTtsServiceExtension on InitScreenCubit {
  void handelTtsEvent(InitScreenTtsScenarioEvent event) async {
    if (!state.isVoiceMode) return;

    print('handelTtsEvent $event');

    switch(event) {
      case InitScreenApproach():
        ttsService.speak('초기 화면입니다.');
        break;
      case InitScreenSectionHeader():
        ttsService.speak('헤더 영역입니다.');
        break;
      case InitScreenSectionStartOrder():
        ttsService.speak('주문하기 영역입니다.');
        break;
      case InitScreenSectionLanguage():
        ttsService.speak('언어를 선택할 수 있는 영역입니다.');
        break;
      case InitScreenWidgetHome():
        ttsService.speak('홈 화면으로 이동하는 버튼입니다.');
        break;
      case InitScreenWidgetCallAgent():
        ttsService.speak('직원 호출 버튼입니다.');
        break;
      case InitScreenWidgetStartOrder():
        ttsService.speak('주문 시작 버튼입니다.');
        break;
      case InitScreenWidgetLanguage():
        ttsService.speak(event.language);
        break;
    }
  }
}