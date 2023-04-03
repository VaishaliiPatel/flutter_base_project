import 'package:flutter/material.dart';

import 'base_controller.dart';
import 'base_instance.dart';

abstract class BaseWidget {
  T get<T>() {
    T controller = BaseInstance.get();
    if (controller is ScreenController) {
      return controller;
    }
    throw UnsupportedError('Unsupported controller request');
  }
}

abstract class BaseMaterialAppWidget implements BaseWidget {
  @override
  T get<T>() => BaseInstance.get();
}

abstract class BaseMaterialAppStatefulWidget extends StatefulWidget with BaseMaterialAppWidget {
  const BaseMaterialAppStatefulWidget({Key? key}) : super(key: key);
}

abstract class BaseMaterialAppStatelessWidget extends StatelessWidget with BaseMaterialAppWidget {
  const BaseMaterialAppStatelessWidget({Key? key}) : super(key: key);
}

abstract class BaseStatefulWidget extends StatefulWidget with BaseWidget {
  const BaseStatefulWidget({Key? key}) : super(key: key);
}

abstract class BaseStatelessWidget extends StatelessWidget with BaseWidget {
  const BaseStatelessWidget({Key? key}) : super(key: key);
}
