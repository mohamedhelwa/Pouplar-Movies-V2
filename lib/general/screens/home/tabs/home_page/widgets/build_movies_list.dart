part of 'home_page_widgets_imports.dart';

class BuildMoviesList extends StatelessWidget {
  final HomeData homeData;

  const BuildMoviesList({Key? key, required this.homeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
        bloc: homeData.searchingEnabledCubit,
        builder: (context, state) {
          return state.data
              ? BuildSearchResultList(homeData: homeData)
              : BuildNowPlayingList(homeData: homeData);
        },
      ),
    );
  }
}
