import 'package:flutter/material.dart';
import 'package:movies_app/common/app_colors.dart';
import 'package:movies_app/common/app_icons.dart';
import 'package:movies_app/common/app_text_style.dart';
import 'package:movies_app/ui/widgets/icon_label.dart';

class MoviesDetailPage extends StatefulWidget {
  const MoviesDetailPage({super.key});

  @override
  State<MoviesDetailPage> createState() => _MoviesDetailPageState();
}

class _MoviesDetailPageState extends State<MoviesDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(Icons.bookmark_rounded, size: 28),
          ),
        ],
      ),
      body: Column(
        spacing: 24,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                child: Image.asset(
                  "assets/images/img_1.png",
                  width: double.infinity, // full width của SizedBox/Stack
                  height: 210,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 178, right: 16),
                  child: Container(
                    width: 54,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.bgGray,
                    ),
                    child: IconLabel(
                      image: AppIcons.icStar,
                      color: AppColors.textOrange,
                      label: "9.5",
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 150, left: 24),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    child: Image.asset(
                      "assets/images/img_1.png",
                      width: 100,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 220, left: 132),
                  child: SizedBox(
                    height: 48,
                    width: 220,
                    child: Text(
                      "Spiderman No Way Home",
                      style: AppTextStyle.titleMedium,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              IconLabel(
                image: AppIcons.icCalendarBlank,
                color: AppColors.textGray,
                label: "2021",
              ),
              SizedBox(
                height: 20,
                child: VerticalDivider(thickness: 1, color: AppColors.textGray),
              ),
              IconLabel(
                image: AppIcons.icClock,
                color: AppColors.textGray,
                label: "2021",
              ),
              SizedBox(
                height: 20,
                child: VerticalDivider(thickness: 1, color: AppColors.textGray),
              ),
              IconLabel(
                image: AppIcons.icTicket,
                color: AppColors.textGray,
                label: "2021",
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
              style: AppTextStyle.bodysmall,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
