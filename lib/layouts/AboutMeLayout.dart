import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/core/core_export.dart';
import 'package:flutter_responsive_ui/pages/widget/widget_export.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutMeLayout extends StatelessWidget {
  const AboutMeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeBackground(
      isGrey: true,
      child: Column(
        children: [
          const ChipWidget(text: 'About Me'),
          GapConstant.h48,
          ResponsiveRowColumn(
            columnMainAxisAlignment: MainAxisAlignment.center,
            columnSpacing: 32,
            rowSpacing: 32,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            layout: context.isDisplayLargeThanTablet
                ? ResponsiveRowColumnType.ROW
                : ResponsiveRowColumnType.COLUMN,
            children: [
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: _pictureLayout(context),
              ),
              ResponsiveRowColumnItem(
                rowFlex: 1,
                child: _descriptionLayout(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _descriptionLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Already! let's talk about me",
          style: context.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textScaleFactor: context.titleScaleFactor,
        ),
        GapConstant.h16,
        Text(
          "Experienced Android Developer and Team Lead with a passion for crafting high-quality mobile apps. Skilled in code review, task management, and clean architecture. Committed to fostering a collaborative learning environment. Author on Medium, sharing insights on mobile app development.",
          style: context.bodyMedium,
        )
      ],
    );
  }

  Widget _pictureLayout(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: context.isDisplayLargeThanTablet ? 500 : 300,
      ),
      child: const ImageLoader(
        "https://images.unsplash.com/photo-1715590876582-18e4844864a6?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        height: 400,
      ),
    );
  }
}
