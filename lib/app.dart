import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'bindings/general_bindings.dart';
import 'core/constants/colors.dart';
import 'core/theme/theme.dart';
import 'routes/navigation_route.dart';

/// ----- Use this Class to setup themes, initial bindings, any animations and much ------
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GeneralBindings(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: CustomAppTheme.lightTheme,
      darkTheme: CustomAppTheme.lightTheme,
      getPages: AppRoutes.pages,
      home: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        backgroundColor: CustomColors.white,
        body: Center(
          child: CircularProgressIndicator(
            color: CustomColors.primary,
          ),
        ),
      ),
    );
  }
}
