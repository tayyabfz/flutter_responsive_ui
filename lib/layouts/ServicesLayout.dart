import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/core/core_export.dart';
import 'package:flutter_responsive_ui/pages/widget/widget_export.dart';
import 'package:flutter_svg/svg.dart';

class ServicesLayout extends StatelessWidget {
  const ServicesLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeBackground(
      child: Column(
        children: [
          const ChipWidget(
            text: 'Services',
          ),
          GapConstant.h24,
          Text(
            "The services i can help you:",
            style: context.bodyLarge,
          ),
          GapConstant.h32,
          _listServices(),
          //_ServicesItem(),
        ],
      ),
    );
  }

  Widget _listServices() {
    // var items = services.items;

    final items = [
      {
        "icon": "https://api.laam.my.id/assets/images/services/mobile.svg",
        "title": "Mobile App Development",
        "description": "Create seamless mobile experiences, custom solutions"
      },
      {
        "icon": "https://api.laam.my.id/assets/images/services/fullstack.svg",
        "title": "Full-Stack Development",
        "description": "End-to-end solutions, frontend to backend development"
      },
      {
        "icon": "https://api.laam.my.id/assets/images/services/consulting.svg",
        "title": "Development Consulting",
        "description": "Expert guidance for successful project outcomes"
      }
    ];

    return Wrap(
      alignment: WrapAlignment.center,
      runSpacing: 24,
      spacing: 24,
      children: items.map((e) {
        return _ServicesItem(
          item: e,
        );
      }).toList(),
    );
  }
}

class _ServicesItem extends StatelessWidget {
  // final HomeServicesItemResponseModel item;

  final dynamic item;

  const _ServicesItem({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 290),
      child: Container(
        decoration: context.radiusBorderDecoration.copyWith(
          color: Theme.of(context).colorScheme.onInverseSurface,
        ),
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.network(
              item['icon'],
              // "assets/icons/tablet.svg",
              width: 32,
              height: 32,
              // colorFilter: ColorFilter.mode(
              //   context.colorScheme.onSurface,
              //   BlendMode.srcIn,
              // ),
            ),
            GapConstant.h96,
            Text(
              item['title'].toString(),
              //"Mobile App Development",
              style: context.titleLarge,
              textScaleFactor: context.titleScaleFactor,
            ),
            GapConstant.h16,
            Container(
              color: Colors.grey.shade600,
              width: 64,
              height: 2,
            ),
            GapConstant.h16,
            Text(
              item['description'].toString(),
            ),
          ],
        ),
      ),
    );
  }
}
