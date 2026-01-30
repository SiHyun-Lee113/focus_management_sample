# 배리어프리 키오스크 설계 문서

## 목적
키패드 기반 UI 컨트롤(이동, 선택)과 음성 안내를 결합해 접근성(배리어프리)을 강화한다.  
Clean Architecture + BLoC 기반 프로젝트 특성을 유지하면서 유지보수성을 높이는 구조를 정의한다.

## 요구사항 요약
- 키패드를 통한 UI 컨트롤(이동, 선택)
- 컨트롤 결과를 화면에 표시
  - 페이지 이동: 해당 페이지 강조
  - 영역 이동: 영역 테두리 강조
  - 버튼 이동: 버튼 테두리 강조
- 컨트롤 결과를 음성으로 출력
  - 페이지 이동: 페이지 설명
  - 영역 이동: 영역 설명
  - 버튼 이동/클릭: 버튼 설명 및 클릭 결과 설명

## 아키텍처 원칙
- Presentation ↔ Domain ↔ Data 레이어 분리
- 키패드 입력, 포커스 이동, 음성 안내를 **각각 별도 모듈/유스케이스**로 분리
- BLoC은 UI 상태 관리 전담, UI 로직(포커스 계산/음성 문장 생성)은 Domain로 이동
- 인터페이스(Port) 기반으로 Data 레이어 구현체를 교체 가능하도록 설계

## 모듈 구성
### Presentation
- 화면 렌더링 및 상태 표시(강조, 테두리 표시)
- BLoC/Cubit은 이벤트를 수신하고 Domain 유스케이스 실행 결과를 상태로 변환
- 포커스 상태 및 음성 메시지 출력 트리거만 담당

### Domain
- `FocusController` 유스케이스
  - 입력: 현재 포커스, 키패드 방향/선택 명령
  - 출력: 새로운 포커스 위치, 화면 강조 타입
- `SpeechComposer` 유스케이스
  - 입력: 페이지/영역/버튼 메타데이터, 현재 포커스 상태
  - 출력: 음성 안내 텍스트
- `PageNavigator` 유스케이스
  - 입력: 페이지 이동 명령
  - 출력: 페이지 전환 결과 + 강조 정보

### Data
- `KeypadInputSource` (외부 입력 인터페이스)
  - 기존 키패드 인식 모듈을 래핑하여 Domain으로 전달
- `SpeechOutput` (TTS 출력 인터페이스)
  - 실제 음성 합성 엔진 연결
- `UIFocusRepository`
  - 화면 구성 요소(페이지/영역/버튼)의 구조 정보 제공

## 핵심 흐름
1. 키패드 입력 수신
2. FocusController가 포커스 이동 계산
3. Presentation이 UI 강조/테두리 렌더링
4. SpeechComposer가 문장 생성
5. SpeechOutput이 음성 출력

## 상태 모델(예시)
- `FocusState`
  - pageId, areaId, buttonId
  - highlightType: page | area | button
  - narrationText: string

## 유지보수 전략
- 포커스 이동 규칙 변경은 Domain 유스케이스에서만 수정
- UI 강조 스타일 변경은 Presentation 전용 위젯에서만 수정
- 음성 문구 변경은 SpeechComposer만 수정
- 키패드/음성 엔진 교체 시 Data 레이어만 수정

## 테스트 전략
### Domain 테스트
- FocusController: 방향 입력에 따른 포커스 이동 규칙 검증
- SpeechComposer: 포커스 상태별 문장 생성 검증
- PageNavigator: 페이지 전환 시 강조 정보 검증

### Presentation 테스트
- 특정 포커스 상태에서 강조 UI가 정상 표시되는지 위젯 테스트
- BLoC 상태 전이 테스트

### 통합 테스트
- 키패드 입력 → 포커스 이동 → 음성 출력까지 시나리오 검증

## 샘플 프로젝트 구조(제안)
```
lib/
  core/
    error/
    utils/
  data/
    datasources/
    repositories/
  domain/
    entities/
    repositories/
    usecases/
  presentation/
    bloc/
    pages/
    widgets/
```

## 참고
- 키패드 인식 모듈은 기존 구현을 Data 레이어 InputSource로 래핑
- BLoC/Cubit 사용 여부는 Presentation 레이어 정책으로 제한
*** End Patch}Invalid patch text: begin_patch: line 1 column 1: *** Begin Patch
