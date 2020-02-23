import 'package:flutter/material.dart';
import 'package:hackstudio_flutter/ui/home/home_page.dart';
import 'package:hackstudio_flutter/ui/login/login_page.dart';
import 'package:hackstudio_flutter/ui/signup/signup.dart';

import 'ui/search_results/search_results_page.dart';

generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/signup':
      return MaterialPageRoute(builder: (context) => SignupPage());
    case '/login':
      return MaterialPageRoute(builder: (context) => LoginPage());
    case '/home':
      return NoAnimationMaterialPageRoute(builder: (context) => HomePage());
    case '/search-results':
      return MaterialPageRoute(builder: (context) => SearchResultsPage());
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    @required WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
            builder: builder,
            maintainState: maintainState,
            settings: settings,
            fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return child;
  }
}
