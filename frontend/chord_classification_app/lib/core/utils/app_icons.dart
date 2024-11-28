import 'package:flutter/material.dart';

import 'assets_path.dart';

//Centralization of icons

abstract class AppIcons {
  static get settings => Assets.icons.settings;

  static const rightCheveron = Icons.chevron_right;
  static const menu = Icons.menu;
  static const bookmark = Icons.bookmark;
  static const bookmarkOutlined = Icons.bookmark_outline;
}
