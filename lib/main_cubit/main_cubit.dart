import 'package:app022/main_cubit/main_state.dart';
import 'package:app022/shared/network/local/cashe_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(InitialState());
  static MainCubit get(context) => BlocProvider.of(context);

  ThemeMode mode = ThemeMode.dark;
  bool isLight = true;

  void changeMode({
    bool? formShered,
  }) {
    if (formShered != null) {
      isLight = formShered;
    } else {
      isLight = !isLight;
    }
    CacheHelper.setBoolean(key: 'isLight', value: isLight);
    if (isLight) {
      mode = ThemeMode.light;
    } else {
      mode = ThemeMode.dark;
    }

    emit(ChangeModeState());
  }
}
