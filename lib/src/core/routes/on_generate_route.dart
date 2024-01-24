import 'package:flutter/material.dart';
import 'package:photos_app/src/core/routes/page_names.dart';
import 'package:photos_app/src/features/features.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case PageNames.registerPage:
        {
          return materialBuilder(widget: const RegisterPage());
        }

      case PageNames.loginPage:
        {
          return materialBuilder(widget: const LoginPage());
        }

      case PageNames.nameRegisterPage:
        {
          return materialBuilder(widget: const NameRegisterPage());
        }

      case PageNames.discoverPage:
        {
          return materialBuilder(widget: const DiscoverPage());
        }

      case PageNames.searchPage:
        {
          return materialBuilder(widget: const SearchPage());
        }

      case PageNames.addPage:
        {
          return materialBuilder(widget: const AddPage());
        }

      case PageNames.profilePage:
        {
          return materialBuilder(widget: const ProfilePage());
        }

      case PageNames.singleChatPage:
        {
          return materialBuilder(
            widget: const SingleChatPage(),
          );
        }

      case PageNames.openPhotoPage:
        {
          if (args is String) {
            return materialBuilder(widget: OpenPhotoPage(images: args));
          } else {
            return materialBuilder(widget: const ErrorPage());
          }
        }

      case PageNames.mainPage:
        {
          if (args is String) {
            return materialBuilder(widget: MainView(uid: args));
          } else {
            return materialBuilder(widget: const ErrorPage());
          }
        }

      default:
        return materialBuilder(
          widget: const ErrorPage(),
        );
    }
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("error"),
      ),
      body: const Center(
        child: Text("error"),
      ),
    );
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
