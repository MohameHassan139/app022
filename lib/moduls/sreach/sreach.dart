import 'package:app022/layout/cubit/home_cubit.dart';
import 'package:app022/layout/cubit/home_states.dart';
import 'package:app022/shared/network/local/coponant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    var list = NewsCubit.get(context).sreach;
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
         print(
            "from listener !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      },
      builder: (context, state) {
        return Scaffold(
          // appBar: AppBar(),
          body: Column(
            
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextFormField(
                  labelText: 'Sreach',
                  textController: searchController,
                  prefixIcon: Icons.search,
                  onChanged: (value) {
                    print(
                        "from onchange!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                    value ??= 'a';
                    NewsCubit.get(context).getSearch(value);
                  },
                  onTap: () {
                    
                    print(
                        "from onTap!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                    
                  },
                ),
              ),
              listBulider(context: context, list: list),
            ],
          ),
        );
      },
    );
  }
}
