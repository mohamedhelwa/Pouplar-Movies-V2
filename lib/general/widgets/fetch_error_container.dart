import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/widgets/my_text.dart';
import 'package:custom_widgets/localization/localization_methods.dart';
import 'package:custom_widgets/utils/generic_cubit/generic_cubit.dart';
import 'package:custom_widgets/utils/widget_utils.dart';
import 'package:custom_widgets/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FetchErrorContainer extends StatelessWidget {
  final GenericBloc<bool> errorVisibilityCubit;
  final Function() onRefresh;
  final String? errorText;

  const FetchErrorContainer({
    Key? key,
    required this.errorVisibilityCubit,
    required this.onRefresh,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
      bloc: errorVisibilityCubit,
      builder: (context, state) {
        return state.data
            ? Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyText(
                      title: "${tr(context, "somethingWentWrong")} !",
                      size: 16,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                      alien: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Icon(
                        Icons.error_outline,
                        color: MyColors.red,
                        size: 50,
                      ),
                    ),
                    MyText(
                      title: "$errorText",
                      size: 12,
                      color: MyColors.black,
                      alien: TextAlign.center,
                    ),
                    DefaultButton(
                      fontFamily: WidgetUtils.lang == "ar"
                          ? GoogleFonts.cairo().fontFamily
                          : GoogleFonts.roboto().fontFamily,
                      title: tr(context, "tryAgain"),
                      color: MyColors.secondary,
                      fontSize: screenWidth <= 320 ? 14 : 16,
                      textColor: MyColors.black,
                      fontWeight: FontWeight.bold,
                      width: screenWidth * 0.45,
                      margin: const EdgeInsets.all(20),
                      onTap: onRefresh,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          MyText(
                            title: tr(context, "tryAgain"),
                            size: 14,
                            color: MyColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(width: 5),
                          Icon(
                            Icons.refresh,
                            color: MyColors.black,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink();
      },
    );
  }
}
