part of 'home_page_widgets_imports.dart';

class BuildFilterSwitch extends StatelessWidget {
  final HomeData homeData;

  const BuildFilterSwitch({Key? key, required this.homeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(
          title: tr(context, "voteAverageLessThan6"),
          size: screenWidth <= 350 ? 9 : 12,
          color: MyColors.primary,
        ),
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: homeData.filterByVoteCountsSwitchCubit,
          builder: (context, state) {
            return Switch(
              value: state.data,
              activeColor: MyColors.primary,
              onChanged: (value) => value
                  ? homeData.filterByVoteAverage()
                  : homeData.resetFilter(),
            );
          },
        ),
      ],
    );
  }
}
