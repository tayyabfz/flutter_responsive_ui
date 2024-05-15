import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_responsive_ui/core/core_export.dart';
import 'package:flutter_responsive_ui/layouts/HomeHeaderLayout.dart';
import 'package:flutter_responsive_ui/layouts/ProjectsLayout.dart';
import 'package:flutter_responsive_ui/layouts/ServicesLayout.dart';
import 'package:flutter_responsive_ui/layouts/SkillsLayout.dart';
import 'package:flutter_responsive_ui/layouts/bottom_layout.dart';
import 'package:flutter_responsive_ui/layouts/contact_layout.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../layouts/AboutMeLayout.dart';
import 'widget/widget_export.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // item scroll controller
  final ItemScrollController _itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    /// Added Adaptive Theme Wrapper
    return ValueListenableBuilder(
      valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
      builder: (BuildContext context, AdaptiveThemeMode value, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            titleSpacing: 32,
            scrolledUnderElevation: 4,
            shadowColor: Colors.grey.shade50.withOpacity(0.2),
            titleTextStyle: Theme.of(context).textTheme.titleSmall,
            title: _appBarContent(context),
          ),
          body: _body(),
          endDrawer: _drawer(context),
        );
      },
    );
  }

  Widget _body() {
    return ScrollablePositionedList.builder(
      itemCount: _bodyItems.length,
      itemBuilder: (context, index) => _bodyItems[index],
      itemScrollController: _itemScrollController,
    );
  }

  Widget _appBarContent(BuildContext context) {
    return Center(
      child: MaxWidthBox(
        maxWidth: MaxSizeConstant.maxWidth,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '@DataDaur',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
            ),
            if (context.isDisplayLargeThanTablet) _toolbarItems(),
          ],
        ),
      ),
    );
  }

  Widget? _drawer(BuildContext context) {
    if (context.isDisplayLargeThanTablet) return null;

    return _HomeDrawer(
      items: _generateToolbarItem(),
    );
  }

  Widget _toolbarItems() {
    return Row(
      children: [
        ..._generateToolbarItem().map(
          (e) => Padding(
            padding: const EdgeInsets.only(left: 24),
            child: ToolbarTextWidget(text: e.text, onTap: e.onTap),
          ),
        ),
        GapConstant.w24,
        const DarkModeWidget(),
      ],
    );
  }

  // body items
  List<Widget> get _bodyItems => [
        const HomeHeaderLayout(),
        const AboutMeLayout(),
        const ServicesLayout(),
        const SkillsLayout(),
        const ProjectsLayout(),
        const ContactLayout(),
        const BottomLayout(),
      ];

  //  generate toolbar item
  List<_ToolbarItem> _generateToolbarItem() {
    return [
      _ToolbarItem(text: 'About', onTap: () => _changeToIndex(1)),
      _ToolbarItem(text: 'Services', onTap: () => _changeToIndex(2)),
      _ToolbarItem(text: 'Skills', onTap: () => _changeToIndex(3)),
      _ToolbarItem(text: 'Projects', onTap: () => _changeToIndex(4)),
      _ToolbarItem(text: 'Contact', onTap: () => _changeToIndex(5)),
    ];
  }

  // change to Index
  void _changeToIndex(int i) {
    _itemScrollController.scrollTo(
      index: i,
      duration: const Duration(milliseconds: 300),
    );
  }
}

class _HomeDrawer extends StatelessWidget {
  final List<_ToolbarItem> items;

  const _HomeDrawer({
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          GapConstant.h16,
          ...items.map(
            (e) => ListTile(
              title: Text(e.text),
              onTap: () => _onItemClicked(e, context),
            ),
          ),
          GapConstant.h8,
          const Divider(
            thickness: 0.4,
          ),
          GapConstant.h8,
          _switchTheme(context),
        ],
      ),
    );
  }

  void _onItemClicked(_ToolbarItem e, BuildContext context) {
    Scaffold.of(context).closeEndDrawer();
    e.onTap?.call();
  }

  Widget _switchTheme(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Switch theme',
            style: context.bodyLarge,
          ),
          const DarkModeWidget(),
        ],
      ),
      onTap: () {
        context.setDarkOrLight();
      },
    );
  }
}

class _ToolbarItem {
  final String text;
  final GestureTapCallback? onTap;

  _ToolbarItem({
    required this.text,
    this.onTap,
  });
}
