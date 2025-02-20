import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider((ref) => false);

final colorsListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider((ref) => 0);
