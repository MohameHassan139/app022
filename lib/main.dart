import 'package:app022/shared/network/local/cashe_helper.dart';
import 'package:app022/shared/network/remote/dio_helper.dart';
import 'package:app022/shared/themes/dark_mode.dart';
import 'package:app022/shared/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/cubit/home_cubit.dart';
import 'layout/hom_layout.dart';
import 'main_cubit/main_cubit.dart';
import 'main_cubit/main_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  bool? fromShered = await CacheHelper.getBoolean(
    key: "isLight",
  );

  fromShered ??= true;
  runApp(MyApp(fromShered));
}

class MyApp extends StatelessWidget {
  final bool fromShered;
  const MyApp(this.fromShered, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {
            return NewsCubit()..getBusiness();
          },
        ),
        BlocProvider(
          create: (context) => MainCubit()
            ..changeMode(
              formShered: fromShered,
            ),
        )
      ],
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightThem(),
            darkTheme: darktThem(),
            themeMode: MainCubit.get(context).mode,
            home: const LayoutScreen(),
          );
        },
      ),
    );
  }
}
