import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/core/core_export.dart';
import 'package:flutter_responsive_ui/pages/widget/widget_export.dart';

class SkillsLayout extends StatelessWidget {
  const SkillsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeBackground(
      isGrey: true,
      child: Column(
        children: [
          const ChipWidget(
            text: 'Skills',
          ),
          GapConstant.h24,
          Text(
            "The skills, tools and technologies I am really good at",
            style: context.bodyLarge,
            textAlign: TextAlign.center,
          ),
          GapConstant.h32,
          _listSkills(context),
        ],
      ),
    );
  }

  Widget _listSkills(BuildContext context) {
    var items = [
      {
        "text": "Flutter",
        "image": "https://api.laam.my.id/assets/images/skills/flutter.png",
        "isBlack": false
      },
      {
        "text": "Kotlin",
        "image": "https://api.laam.my.id/assets/images/skills/kotlin.png",
        "isBlack": false
      },
      {
        "text": "Java",
        "image": "https://api.laam.my.id/assets/images/skills/java.png",
        "isBlack": false
      },
      {
        "text": "Node.js",
        "image": "https://api.laam.my.id/assets/images/skills/nodejs.png",
        "isBlack": false
      },
      {
        "text": "Nest.js",
        "image": "https://api.laam.my.id/assets/images/skills/nestjs.png",
        "isBlack": false
      },
      {
        "text": "Express.js",
        "image": "https://api.laam.my.id/assets/images/skills/expressjs.png",
        "isBlack": true
      },
      {
        "text": "Typescript",
        "image": "https://api.laam.my.id/assets/images/skills/typescript.png",
        "isBlack": false
      },
      {
        "text": "Javascript",
        "image": "https://api.laam.my.id/assets/images/skills/javscript.png",
        "isBlack": false
      },
      {
        "text": "PostgreSQL",
        "image": "https://api.laam.my.id/assets/images/skills/postgresql.png",
        "isBlack": false
      },
      {
        "text": "MySQL",
        "image": "https://api.laam.my.id/assets/images/skills/mysql.png",
        "isBlack": false
      },
      {
        "text": "C#",
        "image": "https://api.laam.my.id/assets/images/skills/csharp.png",
        "isBlack": false
      },
      {
        "text": "Teaching",
        "image": "https://api.laam.my.id/assets/images/skills/teaching.png",
        "isBlack": true
      }
    ];

    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 32,
      spacing: context.isDisplayLargeThanTablet ? 64 : 32,
      children: items
          .map(
            (e) => _SkillsItem(
              item: e,
            ),
          )
          .toList(),
    );
  }
}

class _SkillsItem extends StatelessWidget {
  // final HomeSkillsItemResponseModel item;

  final dynamic item;

  const _SkillsItem({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    const double tabletSize = 84;
    const double phoneSize = 64;

    return Column(
      children: [
        ImageLoader(
          item['image'],
          width: context.isDisplayLargeThanTablet ? tabletSize : phoneSize,
          height: context.isDisplayLargeThanTablet ? tabletSize : phoneSize,
        ),
        GapConstant.h16,
        Text(
          item['text'],
          style: context.bodyMedium,
          textAlign: TextAlign.center,
          textScaleFactor: context.titleScaleFactor,
        ),
      ],
    );
  }
}
