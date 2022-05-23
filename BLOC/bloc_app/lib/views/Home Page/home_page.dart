import 'package:bloc_app/views/Home%20Page/pages.dart';
import 'package:bloc_app/views/Home%20Page/widgets/home_tab_button.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ////.watch <HomeCubit>
    final selectedTab = context
        .select<HomeCubit, HomeTab>((HomeCubit cubit) => cubit.state.tab);
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage')),
      body: IndexedStack(
        index: selectedTab.index,
        children: const [
          Page1(),
          Page2(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeTabButton(
              value: HomeTab.page1,
              selectedValue: selectedTab,
              iconData: Icons.list_rounded,
            ),
            HomeTabButton(
              value: HomeTab.page2,
              selectedValue: selectedTab,
              iconData: Icons.list_rounded,
            ),
          ],
        ),
      ),
    );
  }
}

//Değişmez
@immutable
class HomeState extends Equatable {
  final HomeTab tab;

  const HomeState({required this.tab});

  @override
  List<Object?> get props => [tab];
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(tab: HomeTab.page1));

  void setTab(HomeTab tab) => emit(HomeState(tab: tab));
}
