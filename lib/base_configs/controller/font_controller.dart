import '../../../../../core/base/base_controller.dart';
import '../repository/font_repository.dart';

class FontController extends ServiceController {
  final BaseFontRepository _repository;

  FontController({required BaseFontRepository repository}) : _repository = repository;
}
