import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notebook/cubit/bloc_opserver.dart';
import 'package:notebook/cubit/cubit.dart';
import 'package:notebook/screens/layout_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NoteCubit()..CreateDatabase(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   appBarTheme: AppBarTheme(
        //     color: Color(0xDDA017DB),
        //     systemOverlayStyle: SystemUiOverlayStyle(
        //       statusBarIconBrightness: Brightness.light,
        //     ),
        //     titleTextStyle: TextStyle(
        //       color: Colors.white,
        //       fontSize: 20.0,
        //     ),
        //   ),
        // ),
        home: NodeScreen(),
      ),
    );
  }
}
