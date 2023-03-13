import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/cubit/home_cubit.dart';
import '../../../layout/cubit/home_states.dart';

Widget listItem(Map list, context) => Container(
      margin: const EdgeInsets.only(right: 20, left: 20),
      height: 120,
      child: Row(
        children: [
          Container(
            height: 120,
            width: 120,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Image(
              image: NetworkImage(
                '''${list["urlToImage"]}''',
              ),
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Builder(builder: (context) {
                    return Text(
                      '''${list['title']}''',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1,
                    );
                  }),
                ),
                Text(
                  '''${list['publishedAt']}''',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  Color color = Colors.blue,
  required Function function,
  required String text,
}) =>
    Container(
        width: double.infinity,
        color: color,
        child: MaterialButton(
          onPressed: function(),
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ));

Widget defaultTextFormField({
  required TextEditingController textController,
  VoidCallback Function(String)? onFieldSubmitted,
  VoidCallback? Function(String?)? onChanged,
  required String labelText,
  String? Function(String?)? validater,
  IconData? suffix,
  IconData? prefixIcon,
  bool isPassword = false,
  VoidCallback? onTap,
}) =>
    TextFormField(
      onTap: onTap,
      controller: textController,
      validator: validater,
      keyboardType: TextInputType.visiblePassword,
      obscureText: isPassword,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        prefixIcon: Icon(prefixIcon),
        suffix: Icon(suffix),
      ),
    );

void navigateto({required BuildContext context, required Widget wiget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => wiget));

Widget listBulider({required BuildContext context, required list}) =>
    BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) => ConditionalBuilder(
        condition: NewsCubit.get(context).business.isNotEmpty,
        builder: (context) => ListView.separated(
          itemBuilder: (context, index) => listItem(
            NewsCubit.get(context).business[index],
            context,
          ),
          itemCount: NewsCubit.get(context).business.length,
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
