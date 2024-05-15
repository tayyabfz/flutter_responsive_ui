import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/core/core_export.dart';
import 'package:flutter_responsive_ui/pages/widget/widget_export.dart';
import 'package:flutter_svg/svg.dart';

class ContactLayout extends StatelessWidget {
  // final HomeContactResponseModel contact;

  const ContactLayout({
    super.key,
    // required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return HomeBackground(
      child: Column(
        children: [
          const ChipWidget(
            text: 'Contact',
          ),
          GapConstant.h24,
          SizedBox(
            width: 700,
            child: Text(
              "Looking forward to what's ahead! Whether you're seeking a developer, have questions, or just want to connect, please don't hesitate to reach out.",
              textAlign: TextAlign.center,
              style: context.bodyLarge,
            ),
          ),
          GapConstant.h32,
          _emailLayout(context),
          GapConstant.h32,
          Text(
            "You can also find me on these platforms!",
            style: context.bodyMedium,
          ),
          GapConstant.h8,
          _otherPlatforms(context),
        ],
      ),
    );
  }

  Widget _emailLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.email_outlined,
          size: 32,
        ),
        if (context.isDisplayLargeThanTablet)
          GapConstant.w24
        else
          GapConstant.w16,
        Text(
          "wodatoki@gmail.com",
          style: context.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textScaleFactor: context.titleScaleFactor,
        ),
        if (context.isDisplayLargeThanTablet)
          GapConstant.w16
        else
          GapConstant.w8,
        IconButton(
          onPressed: () {
            _launchUrl('mailto:wodatoki@gmail.com');
          },
          icon: const Icon(Icons.open_in_new),
        ),
      ],
    );
  }

  Widget _otherPlatforms(BuildContext context) {
    var items = [
      {
        "icon": "https://api.laam.my.id/assets/images/contacts/linkedin.svg",
        "type": "linkedin",
        "link": "https://linkedin.com/in/luthfiarifin/"
      },
      {
        "icon": "https://api.laam.my.id/assets/images/contacts/github.svg",
        "type": "github",
        "link": "https://github.com/luthfiarifin"
      },
      {"type": "medium", "link": "https://medium.com/@luthfiarifin"}
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(right: 2),
              // padding: EdgeInsets.only(right: i == items.length - 1 ? 0 : 2),
              child: IconButton(
                icon: SvgPicture.network(
                  e['icon'] ?? '',
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    context.textColor,
                    BlendMode.srcIn,
                  ),
                ),
                onPressed: () {
                  _launchUrl(e['link']!);
                },
              ),
            ),
          )
          .toList(),
    );
  }

  void _launchUrl(String url) {
    LaunchUtil.launchWeb(url);
  }
}
