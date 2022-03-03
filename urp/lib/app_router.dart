import 'package:auto_route/annotations.dart';
import 'package:urp/presentation/landing/landing_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LandingPage, initial: true),
    // AutoRoute(page: BookDetailsPage),
  ],
)
class $AppRouter {}
