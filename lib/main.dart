import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/add_event_screen.dart';
import 'package:flutter_application_1/view/viewAddMedicacao.dart';
import 'package:flutter_application_1/utils/app_routes.dart';
import 'package:flutter_application_1/view/dados_vitais_screen.dart';
import 'package:flutter_application_1/view/agenda_screen.dart';
import 'package:flutter_application_1/view/perfil_screen.dart';
import 'package:flutter_application_1/view/ajuda_screen.dart';
import 'package:flutter_application_1/view/login_screen.dart';
import 'package:flutter_application_1/view/viewMedicacao.dart';
import 'package:flutter_application_1/theme/appTheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      initialRoute: AppRoutes.HOME,
      routes: {
        AppRoutes.HOME: (context) => const ViewMedicacao(),
        AppRoutes.ADD_MEDICACAO: (context) => const ViewAddMedicacao(),
        AppRoutes.DADOS_VITAIS: (context) => const DadosVitaisScreen(),
        AppRoutes.AGENDA: (context) => const AgendaScreen(),
        AppRoutes.PERFIL: (context) => const PerfilScreen(),
        AppRoutes.AJUDA: (context) => const AjudaScreen(),
        AppRoutes.LOGIN: (context) => const LoginScreen(),
        AppRoutes.ADD_EVENT: (context) => const AddEventScreen(),
      },
    );
  }
}
