import 'package:app022/layout/cubit/home_cubit.dart';
import 'package:app022/layout/cubit/home_states.dart';
import 'package:app022/main_cubit/main_cubit.dart';
import 'package:app022/moduls/sreach/sreach.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/network/local/coponant.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.title[cubit.currentIndex]),
            actions: [
              IconButton(
                onPressed: () {
                  navigateto(
                    context: context,
                    wiget: const SearchScreen(),
                  );
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: () {
                  MainCubit.get(context).changeMode();
                },
                icon: const Icon(
                  Icons.brightness_4_outlined,
                ),
              )
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (value) {
              cubit.changeIndex(value);
            },
            items: cubit.navBarItem,
          ),
        );
      },
    );
  }
}
