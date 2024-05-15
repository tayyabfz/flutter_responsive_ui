import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/core/core_export.dart';
import 'package:flutter_responsive_ui/pages/widget/widget_export.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeHeaderLayout extends StatelessWidget {
  const HomeHeaderLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeBackground(
      child: ResponsiveRowColumn(
        columnMainAxisAlignment: MainAxisAlignment.center,
        columnSpacing: 32,
        rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
        layout: context.isDisplayLargeThanTablet
            ? ResponsiveRowColumnType.ROW
            : ResponsiveRowColumnType.COLUMN,
        children: [
          ResponsiveRowColumnItem(
            rowFlex: 5,
            columnOrder: 2,
            child: _leftLayout(context: context),
          ),
          ResponsiveRowColumnItem(
            rowFlex: 4,
            columnOrder: 1,
            child: _rightLayout(context: context),
          ),
        ],
      ),
    );
  }

  Widget _rightLayout({
    required BuildContext context,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: context.isDisplayLargeThanTablet ? 380 : 300,
      ),
      child: ImageLoader(
        //header.image,
        "https://images.unsplash.com/photo-1573164574230-db1d5e960238?q=80&w=3538&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        height: context.isDisplayLargeThanTablet ? 340 : 280,
      ),
    );
  }

  Widget _leftLayout({
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Woda Toki",
              style: context.displayMedium?.copyWith(
                fontWeight: FontWeight.w900,
              ),
              textScaleFactor: context.titleScaleFactor,
            ),
            GapConstant.w8,
            Lottie.asset(
              'assets/lottie/lo_hello.json',
              width: 72,
            ),
          ],
        ),
        GapConstant.h16,
        Text(
          "Experienced Freelance Software Engineer",
          style: context.bodyMedium,
        ),
        GapConstant.h32,
        _headerItem(
          context: context,
          icon: Icons.location_on_outlined,
          text: "Dubai, United Arab Emirates",
        ),
        GapConstant.h8,
        _headerItem(
          context: context,
          icon: Icons.radio_button_on,
          text: "Available for new projects",
          // header.isAvailableForProject
          //     ? 'Available for new projects'
          //     : 'Currently, not available',
          iconColor:
              // header.isAvailableForProject ? Colors.green.shade600 : Colors.red,
              Colors.green.shade600,
        ),
        GapConstant.h32,
        _buttonConnect(context),
      ],
    );
  }

  Row _headerItem({
    required BuildContext context,
    required IconData icon,
    required String text,
    Color? iconColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 24,
          color: iconColor,
        ),
        GapConstant.w12,
        Text(
          text,
          style: context.bodyMedium,
        )
      ],
    );
  }

  Widget _buttonConnect(BuildContext context) {
    return SizedBox(
      height: 56,
      width: 190,
      child: ElevatedButton(
        onPressed: _onConnectClicked,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/ic_linkedin.svg',
              height: 32,
              width: 32,
              colorFilter: ColorFilter.mode(
                context.textColor,
                BlendMode.srcIn,
              ),
            ),
            GapConstant.w4,
            Text(
              "Contact me",
              style: context.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  void _onConnectClicked() async {
    // header.linkedin.link
    await LaunchUtil.launchWeb("https://linkedin.com");
  }
}
