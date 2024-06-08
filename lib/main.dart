import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';
import 'backend/firebase/firebase_config.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tflite_flutter/tflite_flutter.dart';  // Add this import
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();
  await initFirebase();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  // Initialize TFLite
  final interpreter = await Interpreter.fromAsset('construction_cost_model.tflite');  // Add this line

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(interpreter: interpreter),  // Pass the interpreter
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.interpreter});  // Add interpreter parameter

  final Interpreter interpreter;  // Add this field

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = ThemeMode.system;

  late Stream<BaseAuthUser> userStream;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = costPrognosisFirebaseUserStream()
      ..listen((user) => _appStateNotifier.update(user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      const Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CostPrognosis',
      localizationsDelegates: const [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('zu'),
        Locale('fr'),
        Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans'),
        Locale('ru'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key, this.initialPage, this.page});

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'Mainpage';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Mainpage': const MainpageWidget(),
      'SummaryTrackingpage': const SummaryTrackingpageWidget(),
      'analysis': const AnalysisWidget(),
      'accounts': const AccountsWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: GNav(
        selectedIndex: currentIndex,
        onTabChange: (i) => setState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        backgroundColor: Colors.white,
        color: const Color(0x8A000000),
        activeColor: FlutterFlowTheme.of(context).primary,
        tabBackgroundColor: const Color(0x00000000),
        tabBorderRadius: 100.0,
        tabMargin: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        gap: 0.0,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        duration: const Duration(milliseconds: 500),
        haptic: false,
        tabs: [
          GButton(
            icon: Icons.home_outlined,
            text: FFLocalizations.of(context).getText(
              '5cv3v1j0' /* Home */,
            ),
            iconSize: 30.0,
          ),
          GButton(
            icon: Icons.summarize_outlined,
            text: FFLocalizations.of(context).getText(
              'p9wnkpjt' /* Cost Summary */,
            ),
            iconSize: 24.0,
          ),
          GButton(
            icon: Icons.pie_chart,
            text: FFLocalizations.of(context).getText(
              '7f5qr434' /* Analysis */,
            ),
            iconSize: 30.0,
          ),
          GButton(
            icon: Icons.account_balance_wallet,
            text: FFLocalizations.of(context).getText(
              'kychqlhm' /* Accounts */,
            ),
            iconSize: 30.0,
          )
        ],
      ),
    );
  }
}

