import 'package:app022/layout/cubit/home_cubit.dart';
import 'package:app022/layout/cubit/home_states.dart';
import 'package:app022/shared/network/local/coponant.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) => ConditionalBuilder(
        condition: NewsCubit.get(context).sport.isNotEmpty,
        builder: (context) => ListView.separated(
          itemBuilder: (context, index) => listItem(
            NewsCubit.get(context).sport[index],
            context,
          ),
          itemCount: NewsCubit.get(context).sport.length,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 20,
            );
          },
        ),
        fallback: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
