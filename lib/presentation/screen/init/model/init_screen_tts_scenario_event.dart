sealed class InitScreenTtsScenarioEvent {
  const InitScreenTtsScenarioEvent();
}

class InitScreenApproach extends InitScreenTtsScenarioEvent{
  const InitScreenApproach();
}

class InitScreenSectionHeader extends InitScreenTtsScenarioEvent{
  const InitScreenSectionHeader();
}

class InitScreenSectionStartOrder extends InitScreenTtsScenarioEvent{
  const InitScreenSectionStartOrder();
}

class InitScreenSectionLanguage extends InitScreenTtsScenarioEvent {
  const InitScreenSectionLanguage();
}

class InitScreenWidgetHome extends InitScreenTtsScenarioEvent {
  const InitScreenWidgetHome();
}

class InitScreenWidgetCallAgent extends InitScreenTtsScenarioEvent {
  const InitScreenWidgetCallAgent();
}

class InitScreenWidgetStartOrder extends InitScreenTtsScenarioEvent {
  const InitScreenWidgetStartOrder();
}

class InitScreenWidgetLanguage extends InitScreenTtsScenarioEvent  {
  final String language;

  const InitScreenWidgetLanguage(this.language);
}
