import 'package:barrier_free_test/presentation/screen/init/init_screen_cubit.dart';
import 'package:barrier_free_test/presentation/screen/init/model/init_screen_tts_scenario_event.dart';

extension InitScreenCubitTtsServiceExtension on InitScreenCubit {
  void handelTtsEvent(InitScreenTtsScenarioEvent event) {
    switch(event) {
      case InitScreenApproach():
        print('[TTS SERVICE] 초기 화면입니다.');
        break;
      case InitScreenSectionHeader():
        print('[TTS SERVICE] 헤더 영역입니다.');
        break;
      case InitScreenSectionStartOrder():
        print('[TTS SERVICE] 주문하기 영역입니다.');
        break;
      case InitScreenSectionLanguage():
        print('[TTS SERVICE] 언어를 선택할 수 있는 영역입니다.');
        break;
      case InitScreenWidgetHome():
        print('[TTS SERVICE] 홈 화면으로 이동하는 버튼입니다.');
        break;
      case InitScreenWidgetCallAgent():
        print('[TTS SERVICE] 직원 호출 버튼입니다.');
        break;
      case InitScreenWidgetStartOrder():
        print('[TTS SERVICE] 주문 시작 버튼입니다.');
        break;
      case InitScreenWidgetLanguage():
        print('[TTS SERVICE] ${event.language} 선택 버튼입니다.');
        break;
    }
  }
}