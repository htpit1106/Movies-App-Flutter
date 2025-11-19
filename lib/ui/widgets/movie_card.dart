import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/common/app_colors.dart';
import 'package:movies_app/common/app_icons.dart';
import 'package:movies_app/common/app_text_style.dart';
import 'package:movies_app/router/router_config.dart';
import 'package:movies_app/ui/widgets/icon_label.dart';

class Moviecard extends StatelessWidget {
  const Moviecard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.year,
    required this.duration,
  });

  final String imagePath;
  final String title;
  final String rating;
  final String year;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.pushNamed( AppRouter.moviesDetail);
      },
      child: Card(
        margin: EdgeInsets.only(left: 16, top: 16),
        color: AppColors.background,
        child: Row(
          spacing: 13,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              spacing: 14,
              children: [
                Text(title, style: AppTextStyle.titleSmall),
                Column(
                  spacing: 4,

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconLabel(
                      color: AppColors.textOrange,
                      image: AppIcons.icStar,
                      label: "8.5",
                    ),
                    IconLabel(
                      color: AppColors.textWhite,
                      image: AppIcons.icTicket,
                      label: "Action",
                    ),
                    IconLabel(
                      color: AppColors.textWhite,
                      image: AppIcons.icCalendarBlank,
                      label: "2021",
                    ),
                    IconLabel(
                      color: AppColors.textWhite,
                      image: AppIcons.icClock,
                      label: "139 minutes",
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
