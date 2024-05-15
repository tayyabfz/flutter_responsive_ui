import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/core/core_export.dart';
import 'package:flutter_responsive_ui/pages/widget/widget_export.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ProjectsLayout extends StatelessWidget {
  const ProjectsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeBackground(
      child: Column(
        children: [
          const ChipWidget(
            text: 'Projects',
          ),
          GapConstant.h24,
          Text(
            "Here are a few of the noteworthy projects I've developed:",
            style: context.bodyLarge,
            textAlign: TextAlign.center,
          ),
          GapConstant.h16,
          _listProjects(),
        ],
      ),
    );
  }

  Widget _listProjects() {
    final items = [
      {
        "name": "WIGO Partner",
        "description":
            "WIGO Partner simplifies venue management. A comprehensive dashboard offers bookings, sales analytics, and profile configuration for tourism businesses, enhancing efficiency and customer experience.",
        "technologies": [
          "Flutter",
          "Nest.js",
          "Responsive",
          "Git",
          "Dart",
          "Typescript",
          "Payment-Gateway"
        ],
        "image":
            "https://api.laam.my.id/assets/images/projects/wigo-partner.png",
        "link": "https://play.google.com/store/apps/details?id=id.wigo.partner"
      },
      {
        "name": "WIGO App",
        "description":
            "WIGO App is your ultimate travel companion. Discover destinations, activities, and dining worldwide with interactive maps and guides. Seamlessly plan and enjoy your journey.",
        "technologies": [
          "Flutter",
          "Nest.js",
          "Git",
          "Dart",
          "Typescript",
          "Payment-Gateway",
          "E-Wallet"
        ],
        "image": "https://api.laam.my.id/assets/images/projects/wigo-app.png",
        "link": "https://play.google.com/store/apps/details?id=id.wigo.app"
      },
      {
        "name": "uDagang",
        "description":
            "uDagang, crafted by Indonesian youth, empowers local MSMEs by offering a dynamic marketplace. Explore vibrant communities and seamless integration with social media for a thriving business ecosystem.",
        "technologies": ["Android", "Node.js", "Git", "Kotlin", "Javascript"],
        "image": "https://api.laam.my.id/assets/images/projects/udagang.png",
        "link": "https://play.google.com/store/apps/details?id=com.imi.udagang"
      }
    ];

    return Column(
      children: items
          .map(
            (e) => _ProjectItem(
              item: e,
              isEven: true, //items.length>0? items.indexed. % 2 == 0,
            ),
          )
          .toList(),
    );
  }
}

class _ProjectItem extends StatelessWidget {
  // final HomeProjectsItemResponseModel item;

  final bool isEven;

  final dynamic item;

  const _ProjectItem({
    required this.item,
    required this.isEven,
  });

  @override
  Widget build(BuildContext context) {
    var isRow = context.isDisplayLargeThanTablet;

    return Container(
      margin: const EdgeInsets.only(top: 32),
      decoration: context.radiusBorderDecoration,
      child: ResponsiveRowColumn(
        rowCrossAxisAlignment: CrossAxisAlignment.start,
        layout: isRow
            ? ResponsiveRowColumnType.ROW
            : ResponsiveRowColumnType.COLUMN,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowOrder: isEven ? 1 : 2,
            child: _image(context, !isRow),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 1,
            rowOrder: !isEven ? 1 : 2,
            child: _text(context),
          ),
        ],
      ),
    );
  }

  Widget _image(BuildContext context, bool isColumn) {
    const radius = Radius.circular(12);
    const radiusZero = Radius.zero;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: isColumn
              ? radius
              : isEven
                  ? radius
                  : radiusZero,
          bottomLeft: isColumn
              ? radiusZero
              : isEven
                  ? radius
                  : radiusZero,
          topRight: isColumn
              ? radius
              : !isEven
                  ? radius
                  : radiusZero,
          bottomRight: isColumn
              ? radiusZero
              : !isEven
                  ? radius
                  : radiusZero,
        ),
        color: context.colorScheme.onInverseSurface,
      ),
      padding: const EdgeInsets.all(32),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: !isColumn ? 400 : 340,
          minWidth: context.screenWidth,
        ),
        child: ImageLoader(
          item['image'],
          height: context.isDisplayLargeThanTablet ? null : 200,
        ),
      ),
    );
  }

  Widget _text(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(48),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item['name'],
            style: context.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textScaleFactor: context.titleScaleFactor,
          ),
          GapConstant.h24,
          Text(
            item['description'],
            style: context.bodyMedium,
          ),
          GapConstant.h32,
          _technologies(),
          GapConstant.h56,
          _openIcon(),
        ],
      ),
    );
  }

  Widget _technologies() {
    final tech = [
      "Flutter",
      "Nest.js",
      "Git",
      "Dart",
      "Typescript",
      "Payment-Gateway",
      "E-Wallet"
    ]; //item['technologies'];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: tech
          .map(
            (e) => ChipWidget(text: e),
          )
          .toList(),
    );
  }

  Widget _openIcon() {
    return IconButton(
      onPressed: () {
        LaunchUtil.launchWeb(item['link']);
      },
      icon: const Icon(Icons.open_in_new),
    );
  }
}
