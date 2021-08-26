import 'package:get/get.dart';

class Locales extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'es': {
          'primaryButtonText': 'Solicitar cruce peatonal',
          'walkerSubtitleHelperOnStop':
              'No puede cruzar, solicite el cruce peatonal',
          'walkerSubtitleHelperOnWaiting':
              'Cruce peatonal solicitado, en breves se activara la señal de cruce',
          'walkerSubtitleHelperOnGo': 'Puede cruzar',
          'walkerSubtitleHelperOnWarning': 'Precaucion, no cruzar!',
        },
      };
}
