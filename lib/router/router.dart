// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
import 'package:auto_route/auto_route.dart';
import 'package:testing/pages/dragNdrop.page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // AutoRoute(page: HomeChipPage, initial: true),
    AutoRoute(page: HomeDragNdropPage, initial: true),
    // AutoRoute(page: BookDetailsPage),
  ],
)
class $AppRouter {}
