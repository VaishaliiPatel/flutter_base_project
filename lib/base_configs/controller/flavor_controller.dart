import 'package:cmsocpp/core/base/base_controller.dart';
import '../configs/flavor_config.dart';
import '../repository/flavor_repository.dart';

class FlavorController extends ServiceController implements FlavorConfig {

  final BaseFlavorRepository _repository;

  FlavorController({required BaseFlavorRepository repository}) : _repository = repository;



  @override
  BaseFlavorConfig get flavorBacancy => _repository.flavorBacancy;

  @override
  BaseFlavorConfig get currentFlavor => _repository.currentFlavor;

}