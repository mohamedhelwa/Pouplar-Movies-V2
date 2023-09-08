part of 'home_widgets_imports.dart';

class BuildBottomTabBar extends StatelessWidget {
  final HomeData homeData;
  const BuildBottomTabBar({Key? key, required this.homeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 3,
          ),
        ],
      ),
      child: BlocBuilder<GenericBloc<int>, GenericState<int>>(
        bloc: homeData.homeTabBarIndexCubit,
        builder: (context, state) {
          return TabBar(
            indicatorColor: Colors.transparent,
            onTap: (index) {
              homeData.homeTabBarIndexCubit.onUpdateData(index);
              if (index == 0) {
                homeData.moviesPagingController.refresh();
              }
            },
            enableFeedback: false,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            tabs: [
              BuildTabItem(
                isSelected: state.data == 0,
                title: tr(context, "home"),
                icon: state.data == 0 ? Icons.home : Icons.home_outlined,
              ),
              BuildTabItem(
                isSelected: state.data == 1,
                title: tr(context, "settings"),
                icon:
                    state.data == 1 ? Icons.settings : Icons.settings_outlined,
              ),
            ],
          );
        },
      ),
    );
  }
}
