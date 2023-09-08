part of 'home_widgets_imports.dart';

class BuildTabBarPages extends StatelessWidget {
  final HomeData homeData;

  const BuildTabBarPages({Key? key, required this.homeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<int>, GenericState<int>>(
      bloc: homeData.homeTabBarIndexCubit,
      builder: (context, state) {
        return [
          HomePage(homeData: homeData),
          const Settings(),
        ][state.data];
      },
    );
  }
}
