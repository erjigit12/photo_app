// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:photos_app/src/core/routes/routes.dart';
// import 'package:photos_app/src/core/routes/routes_name.dart';
// import 'package:photos_app/src/features/main/cubit/main_cubit.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (context) => MainCubit(),
//         ),
//       ],
//       child: const MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Photo App',
//         initialRoute: RoutesName.registerPage,
//         onGenerateRoute: Routes.generateRoute,
//       ),
//     );
//   }
// }
