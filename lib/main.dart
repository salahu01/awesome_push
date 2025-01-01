import 'package:awesome_push/core/theme/dark_theme.dart';
import 'package:awesome_push/core/theme/light_theme.dart';
import 'package:awesome_push/presentation/logic/home/home_cubit.dart';
import 'package:awesome_push/presentation/pages/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //* 🍪📦  session configuration
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getApplicationDocumentsDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: GetMaterialApp(
        title: 'Awesome Push',
        themeMode: ThemeMode.system,
        theme: lightTheme,
        darkTheme: darkTheme,
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
