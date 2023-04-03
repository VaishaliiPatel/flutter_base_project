import 'package:cmsocpp/app/presentation/screens/payment/payment_controller.dart';
import 'package:cmsocpp/core/base/base_bindings.dart';


class PaymentBinding extends ScreenBindings {
  @override
  void dependencies() {
    ScreenBindings.put(PaymentScreenController());
  }
}
