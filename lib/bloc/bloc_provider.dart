import 'package:bloc/bloc.dart';

import '../const/constants.dart';
import '../helper/helper.dart';

class CubitNames extends Cubit<String?> {
  CubitNames() : super(null);

  void getName() {
    emit(names.getRandomValue());
  }
}
