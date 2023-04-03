import 'package:cmsocpp/base_configs/configs/config.dart';

enum Flavors { bacancy, shell }

enum ChargeBy {
  time(1),
  energy(2),
  amount(3);

  const ChargeBy(this.value);

  final int value;
}

enum ConnectorStatus {
  available(StringConfig.available),
  inUse(StringConfig.charging),
  unAvailable(StringConfig.notAvailable),
  faulty(StringConfig.faulty),
  free(StringConfig.free),
  paid(StringConfig.paid);

  const ConnectorStatus(this.value);

  final String value;
}
