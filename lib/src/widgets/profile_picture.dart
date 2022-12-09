import 'package:flutter/material.dart';
import 'package:pit02gp07/src/core/theme/app_colors.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
    this.url,
    this.size = 80.0,
  }) : super(key: key);

  final String? url;
  final double size;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.iceWhite,
        image: url != null
            ? DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  url!,
                ),
              )
            : null,
      ),
      duration: const Duration(milliseconds: 400),
    );
  }
}
