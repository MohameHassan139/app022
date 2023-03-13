
import 'package:app022/shared/network/local/coponant.dart';
import 'package:flutter/material.dart';

import '../../layout/cubit/home_cubit.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
       var list = NewsCubit.get(context).science;
    return listBulider(context: context, list: list);
  }
}
