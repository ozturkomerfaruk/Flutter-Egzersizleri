import 'package:bloc_app/views/Home%20Page/home_page.dart';
import 'package:bloc_app/views/Home%20Page/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabButton extends StatelessWidget {
  const HomeTabButton({
    Key? key,
    required this.value,
    required this.selectedValue,
    required this.iconData,
  }) : super(key: key);

  final HomeTab value;
  final HomeTab selectedValue;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<HomeCubit>().setTab(value),
      icon: Icon(iconData, size: 32),
      color: selectedValue != value
          ? null
          : Theme.of(context).colorScheme.secondary,
    );
  }
}
