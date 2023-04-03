import '../../../../core/base/base_bindings.dart';
import '../../../../core/base/base_widget.dart';

class NavigationModel {
  final String route;
  final BaseStatelessWidget screen;
  final ScreenBindings? bindings;

  const NavigationModel({
    required this.route,
    required this.screen,
    this.bindings,
  });
}
