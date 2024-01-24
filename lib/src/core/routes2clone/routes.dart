// import 'package:flutter/material.dart';
// import 'package:photos_app/src/core/routes/routes_name.dart';
// import 'package:photos_app/src/features/chat/presentation/pages/single_chat_page.dart';
// import 'package:photos_app/src/features/discover/presentation/page/discover_page.dart';
// import 'package:photos_app/src/features/discover/presentation/page/open_photo_page.dart';
// import 'package:photos_app/src/features/main/page/main_page.dart';
// import 'package:photos_app/src/features/register/presentation/pages/page.dart';

// class Routes {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case RoutesName.mainPage:
//         return MaterialPageRoute(builder: (_) => const MainView());
//       case RoutesName.loggetOutPage:
//         return MaterialPageRoute(builder: (_) => const SplashPage());
//       case RoutesName.registerPage:
//         return MaterialPageRoute(builder: (_) => const RegisterPage());
//       case RoutesName.registerNamePage:
//         return MaterialPageRoute(builder: (_) => const RegisterWithNamePage());
//       case RoutesName.loginPage:
//         return MaterialPageRoute(builder: (_) => const LoginPage());
//       case RoutesName.discoverPage:
//         return MaterialPageRoute(builder: (_) => const DiscoverPage());
//       case RoutesName.openPhotoPage:
//         return MaterialPageRoute(
//             builder: (_) => const OpenPhotoPage(), settings: settings);
//       case RoutesName.singleChatPage:
//         return MaterialPageRoute(builder: (_) => const SingleChatPage());
//       default:
//         return MaterialPageRoute(
//           builder: (context) {
//             return Scaffold(
//               body: Center(
//                 child: Text('No route defined for ${settings.name}'),
//               ),
//             );
//           },
//         );
//     }
//   }
// }
