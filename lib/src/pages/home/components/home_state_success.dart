import 'package:flutter/material.dart';
import 'package:pit02gp07/src/core/theme/app_colors.dart';

import '../state/home_state.dart';
import 'header_home.dart';
import 'home_state_empty.dart';
import 'home_state_success_w_filters.dart';

class HomeStateSuccessWidget extends StatefulWidget {
  final HomeStateSuccess state;

  const HomeStateSuccessWidget({
    super.key,
    required this.state,
    
  });

  @override
  State<HomeStateSuccessWidget> createState() => _HomeStateSuccessWidgetState();
}

class _HomeStateSuccessWidgetState extends State<HomeStateSuccessWidget> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        HomeHeader(widget: widget),
        Expanded(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            color: AppColors.darkGray,
            child: widget.state.transactions.isEmpty
                ? const HomeEmptyStateWidget()
                : HomeStateSuccessWithFiltersWidget(

                    state: widget.state,
                  ),
          ),
        )
      ],
    );
  }
}
