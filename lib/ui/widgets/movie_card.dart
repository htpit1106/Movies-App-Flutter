import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/common/app_colors.dart';
import 'package:movies_app/common/app_icons.dart';
import 'package:movies_app/common/app_text_style.dart';
import 'package:movies_app/router/router_config.dart';
import 'package:movies_app/ui/widgets/icon_label.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.id,
    this.imagePath,
    this.originalTitle,
    this.voteAverage,
    this.releaseDate,
    this.runtime,
  });

  final int id;
  final String? imagePath;
  final String? originalTitle;
  final String? voteAverage;
  final String? releaseDate;
  final String? runtime;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(AppRouter.moviesDetail, extra: {'id': id});
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          spacing: 13,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Image.network(
                imagePath ?? "assets/images/img.png",
                width: 100,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 14,
                children: [
                  Text(
                    originalTitle ?? "No title",
                    style: AppTextStyle.titleSmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Column(
                    spacing: 4,

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconLabel(
                        color: AppColors.textOrange,
                        image: AppIcons.icStar,
                        label: voteAverage ?? "8.5",
                      ),
                      IconLabel(
                        color: AppColors.textWhite,
                        image: AppIcons.icTicket,
                        label: "Action",
                      ),
                      IconLabel(
                        color: AppColors.textWhite,
                        image: AppIcons.icCalendarBlank,
                        label: releaseDate ?? "2021",
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
            ),
          ],
        ),
      ),
    );
  }
}
