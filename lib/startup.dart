import 'package:cmsocpp/app/data/network/interceptors/auth_interceptor.dart';
import 'package:cmsocpp/app/data/network/interceptors/dio_logger.dart';
import 'package:cmsocpp/app/data/network/rest_client/rest_client_dio.dart';
import 'package:cmsocpp/base_configs/controller/flavor_controller.dart';
import 'package:cmsocpp/base_configs/controller/style_controller.dart';
import 'package:cmsocpp/base_configs/repository/color_repository.dart';
import 'package:cmsocpp/base_configs/repository/flavor_repository.dart';
import 'package:cmsocpp/base_configs/repository/style_repository.dart';

import 'app/data/network/api_controller.dart';
import 'base_configs/controller/color_controller.dart';
import 'base_configs/controller/firebase_controller.dart';
import 'base_configs/controller/font_controller.dart';
import 'base_configs/controller/local_storage_controller.dart';
import 'base_configs/controller/navigation_controller.dart';
import 'base_configs/controller/theme_controller.dart';
import 'base_configs/controller/utility_controller.dart';
import 'base_configs/repository/firebase_repository.dart';
import 'base_configs/repository/font_repository.dart';
import 'base_configs/repository/local_storage_repository.dart';
import 'base_configs/repository/navigation_repository.dart';
import 'base_configs/repository/theme_repository.dart';
import 'core/base/base_instance.dart';

abstract class Startup {
  static BaseFirebaseRepository? firebaseRepository;

  static Future<void> initFirebase() async {
    firebaseRepository = FirebaseRepository();
    BaseInstance.put(await _getFirebase(firebaseRepository!));
  }

  static Future<void> init() async {
    BaseInstance.put(_getNavigation());
    BaseInstance.put(await _getLocalStorage());
    BaseInstance.put(_getTheme());
    BaseInstance.put(_getFont());
    BaseInstance.put(_getFlavor());
    BaseInstance.put(_getColor());
    BaseInstance.put(_getColor());
    BaseInstance.put(_getStyle());
    RestClientDio dioClient = RestClientDio();
    RestClientDio authClient = RestClientDio.auth();
    authClient.dioAuth.interceptors.add(DioLogger());
    dioClient.dio.interceptors.addAll([AuthInterceptor(), DioLogger()]);
    BaseInstance.put(_getApi(dioClient, authClient));
    BaseInstance.put(_getUtility());
  }

  static Future<FirebaseController> _getFirebase(BaseFirebaseRepository repository) async {
    await repository.init();
    return FirebaseController(repository: repository);
  }

  static NavigationController _getNavigation() {
    return NavigationController(repository: NavigationRepository());
  }

  static Future<LocalStorageController> _getLocalStorage() async {
    BaseLocalStorageRepository repository = LocalStorageRepository();
    await repository.init();
    return LocalStorageController(repository: repository);
  }

  static ThemeController _getTheme() {
    BaseThemeRepository repository = ThemeRepository();
    return ThemeController(repository: repository);
  }

  static FontController _getFont() {
    BaseFontRepository repository = FontRepository();
    // repository.init();
    return FontController(repository: repository);
  }

  static ApiController _getApi(RestClientDio clientDio, RestClientDio authClientDio) {
    return ApiController(dioClient: clientDio, authClient: authClientDio);
  }

  static FlavorController _getFlavor() {
    return FlavorController(repository: FlavorRepository());
  }

  static StyleController _getStyle() {
    return StyleController(repository: StyleRepository());
  }

  static UtilityController _getUtility() {
    return UtilityController();
  }

  static ColorController _getColor() {
    return ColorController(repository: ColorRepository());
  }
}
