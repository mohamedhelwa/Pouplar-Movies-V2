import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:custom_widgets/utils/generic_cubit/generic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClearTextFieldButton extends StatelessWidget {
  final TextEditingController controller;
  final GenericBloc<bool> visibilityCubit;
  final Function()? onTap;

  const ClearTextFieldButton({
    Key? key,
    required this.controller,
    required this.visibilityCubit,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
      bloc: visibilityCubit,
      builder: (context, state) {
        return Visibility(
          visible: state.data,
          child: IconButton(
            onPressed: onTap ?? () => clearSearchText(visibilityCubit),
            iconSize: 20,
            highlightColor: Colors.transparent,
            color: MyColors.blackOpacity,
            icon: const Icon(Icons.clear),
          ),
        );
      },
    );
  }

  void clearSearchText(GenericBloc<bool> visibilityCubit) {
    if (controller.text.trim().isNotEmpty) {
      controller.clear();
      Future.delayed(const Duration(milliseconds: 300), () {
        visibilityCubit.onUpdateData(false);
      });
    }
  }
}
