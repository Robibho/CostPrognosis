import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'zu', 'fr', 'zh_Hans', 'ru'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? zuText = '',
    String? frText = '',
    String? zh_HansText = '',
    String? ruText = '',
  }) =>
      [enText, zuText, frText, zh_HansText, ruText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Mainpage
  {
    'v20mana2': {
      'en': 'Cost Power Prognator',
      'fr': 'Pronateur de puissance de coût',
      'ru': 'Стоимость мощности Прогнатор',
      'zh_Hans': '成本功率预测器',
      'zu': 'I-Cost Power Prognator',
    },
    'fa3mr8wn': {
      'en': 'Home',
      'fr': 'Maison',
      'ru': 'Дом',
      'zh_Hans': '家',
      'zu': 'Ikhaya',
    },
    '7n0zzp4i': {
      'en': 'Cost Summary',
      'fr': 'Résumé des coûts',
      'ru': 'Сводка затрат',
      'zh_Hans': '成本摘要',
      'zu': 'Isifinyezo Sezindleko',
    },
    '3z5ui0en': {
      'en': 'Update Monthly Expenditure',
      'fr': 'Mettre à jour les dépenses mensuelles',
      'ru': 'Обновить ежемесячные расходы',
      'zh_Hans': '更新每月支出',
      'zu': 'Buyekeza Izindleko Zanyanga Zonke',
    },
    'a2k66l4u': {
      'en': 'Predict Structural Cost',
      'fr': 'Prédire le coût structurel',
      'ru': 'Прогнозирование структурных затрат',
      'zh_Hans': '预测结构成本',
      'zu': 'Qagela Izindleko Zesakhiwo',
    },
    'cm1s06i5': {
      'en': 'Predict Cost of Materials',
      'fr': 'Prédire le coût des matériaux',
      'ru': 'Прогнозирование стоимости материалов',
      'zh_Hans': '预测材料成本',
      'zu': 'Qagela Izindleko Zezinto',
    },
    '5w1zhxfy': {
      'en': 'Cost Performance',
      'fr': 'Performance des coûts',
      'ru': 'Стоимость исполнения',
      'zh_Hans': '成本绩效',
      'zu': 'Ukusebenza Kwezindleko',
    },
    '7xphsu2f': {
      'en': 'Manager\'s Details',
      'fr': 'Détails du gestionnaire',
      'ru': 'Данные менеджера',
      'zh_Hans': '经理详细信息',
      'zu': 'Imininingwane Yomphathi',
    },
    'lv0vc9m2': {
      'en': 'Construction Finance Advice',
      'fr': 'Conseils en financement de construction',
      'ru': 'Консультации по финансированию строительства',
      'zh_Hans': '建筑融资建议',
      'zu': 'Iseluleko Sezezimali Zokwakha',
    },
    '4zyeevyx': {
      'en': 'Logout',
      'fr': 'Se déconnecter',
      'ru': 'Выйти',
      'zh_Hans': '登出',
      'zu': 'Phuma',
    },
    '5cv3v1j0': {
      'en': 'Home',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
  },
  // SUMMARY
  {
    '30z5pq95': {
      'en': 'Construction Dashboard',
      'fr': 'Tableau de bord de construction',
      'ru': 'Панель управления строительством',
      'zh_Hans': '施工仪表板',
      'zu': 'Ideshibhodi yokwakha',
    },
    '417yhtj9': {
      'en': 'Summary of Project Costs',
      'fr': 'Résumé des coûts du projet',
      'ru': 'Сводная информация о затратах на проект',
      'zh_Hans': '项目成本摘要',
      'zu': 'Isifinyezo Sezindleko Zomsebenzi',
    },
    'db5q3d06': {
      'en': 'Project Overview',
      'fr': 'Aperçu du projet',
      'ru': 'Обзор проекта',
      'zh_Hans': '项目概况',
      'zu': 'Uhlolojikelele lwephrojekthi',
    },
    '0supx7vr': {
      'en': 'A summary of your construction project is below.',
      'fr': 'Un résumé de votre projet de construction est ci-dessous.',
      'ru': 'Краткое описание вашего строительного проекта представлено ниже.',
      'zh_Hans': '您的建设项目摘要如下。',
      'zu': 'Isifinyezo sephrojekthi yakho yokwakha singezansi.',
    },
    'toouwo2x': {
      'en': 'Total Project Cost',
      'fr': 'Coût total du projet',
      'ru': 'Общая стоимость проекта',
      'zh_Hans': '项目总成本',
      'zu': 'Ingqikithi Yezindleko Zephrojekthi',
    },
    '8xnr90ia': {
      'en': '\$250,000',
      'fr': '250 000 \$',
      'ru': '250 000 долларов США',
      'zh_Hans': '25万美元',
      'zu': '\$250,000',
    },
    'js6us7ih': {
      'en': 'Total Expenditure',
      'fr': 'Total des dépenses',
      'ru': 'Общая сумма расходов',
      'zh_Hans': '总共花费',
      'zu': 'Ingqikithi Yezindleko',
    },
    '2zxeyuj1': {
      'en': '\$150,000',
      'fr': '150 000 \$',
      'ru': '150 000 долларов США',
      'zh_Hans': '15万美元',
      'zu': '\$150,000',
    },
    'y6c1g8e6': {
      'en': 'Expenditure Graph',
      'fr': 'Graphique des dépenses',
      'ru': 'График расходов',
      'zh_Hans': '支出图表',
      'zu': 'Igrafu Yezindleko',
    },
    'bhrq5hys': {
      'en': 'A graphical representation of your total expenditure.',
      'fr': 'Une représentation graphique de vos dépenses totales.',
      'ru': 'Графическое представление ваших общих расходов.',
      'zh_Hans': '您的总支出的图形表示。',
      'zu': 'Ukumelwa okuyisithombe kwesamba sezindleko zakho.',
    },
    'sf6l7kz5': {
      'en': 'Remove this and place graph here.',
      'fr': 'Supprimez-le et placez le graphique ici.',
      'ru': 'Удалите это и поместите график сюда.',
      'zh_Hans': '删除此并将图表放在此处。',
      'zu': 'Susa lokhu bese ubeka igrafu lapha.',
    },
  },
  // costpredictionpage
  {
    'ym6ul3k1': {
      'en': 'Predict Structural Cost',
      'fr': 'Prédire le coût structurel',
      'ru': 'Прогнозирование структурных затрат',
      'zh_Hans': '预测结构成本',
      'zu': 'Qagela Izindleko Zesakhiwo',
    },
    'xtzdgdp6': {
      'en': 'Number of Units',
      'fr': 'Nombre d\'unités',
      'ru': 'Количество единиц',
      'zh_Hans': '单位数',
      'zu': 'Inani lamayunithi',
    },
    '2j8kr170': {
      'en': 'Enter the number of units',
      'fr': 'Entrez le nombre d\'unités',
      'ru': 'Введите количество единиц',
      'zh_Hans': '输入单位数量',
      'zu': 'Faka inombolo yamayunithi',
    },
    'z2iwnkn3': {
      'en': 'Building Height',
      'fr': 'Hauteur du bâtiment',
      'ru': 'Высота здания',
      'zh_Hans': '建筑高度',
      'zu': 'Ukuphakama Kwesakhiwo',
    },
    'pjzrimec': {
      'en': 'Enter the building height',
      'fr': 'Entrez la hauteur du bâtiment',
      'ru': 'Введите высоту здания',
      'zh_Hans': '输入建筑高度',
      'zu': 'Faka ubude besakhiwo',
    },
    'nc2yhubj': {
      'en': 'Builtup Area',
      'fr': 'Zone bâtie',
      'ru': 'Площадь застройки',
      'zh_Hans': '建筑面积',
      'zu': 'Indawo yokwakha',
    },
    'k6e5th33': {
      'en': 'Enter the builtup area',
      'fr': 'Entrez dans la zone bâtie',
      'ru': 'Введите площадь застройки',
      'zh_Hans': '输入建筑面积',
      'zu': 'Faka indawo eyakhelweyo',
    },
    '89qyrhfb': {
      'en': 'Number of Rooms',
      'fr': 'Nombre de chambres',
      'ru': 'Количество комнат',
      'zh_Hans': '房间的数量',
      'zu': 'Inani Lamakamelo',
    },
    '3nt6zc6y': {
      'en': 'Enter the number of rooms',
      'fr': 'Entrez le nombre de chambres',
      'ru': 'Введите количество комнат',
      'zh_Hans': '输入房间数',
      'zu': 'Faka inombolo yamagumbi',
    },
    'rr840wym': {
      'en': 'Number of Columns',
      'fr': 'Le nombre de colonnes',
      'ru': 'Число столбцов',
      'zh_Hans': '列数',
      'zu': 'Inombolo Yamakholomu',
    },
    '0goeuwh9': {
      'en': 'Enter the number of columns',
      'fr': 'Entrez le nombre de colonnes',
      'ru': 'Введите количество столбцов',
      'zh_Hans': '输入列数',
      'zu': 'Faka inombolo yamakholomu',
    },
    '81illpmc': {
      'en': 'Building Function ',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'ynyzu9c7': {
      'en': 'residential',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'jk581nmm': {
      'en': 'rural health clinic ',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '7a7x9gfh': {
      'en': 'church steel structure',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'x9dubout': {
      'en': 'warehouse',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'bl6fumz4': {
      'en': 'chain of shops',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '2yvuq5c1': {
      'en': 'mall',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'wxsdxvgz': {
      'en': 'shop mall',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    't80jl575': {
      'en': 'Warehouse',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'yh0j2zf1': {
      'en': 'steel warehouse',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'dgro2x4c': {
      'en': 'School admin Block',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'bqpnlpkc': {
      'en': 'hall',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'y7i657lc': {
      'en': 'hostel',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '5pmhyxoe': {
      'en': 'abbatoir',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'rtkd20zi': {
      'en': 'blair toilet',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'k0lf2rpq': {
      'en': 'township shop',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '4h78bj1w': {
      'en': 'industrial shop',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'm55jgfa7': {
      'en': 'Cardiology  hospital building',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'ei2mlgjl': {
      'en': 'Oncology hospital building ',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'g9v735ci': {
      'en': 'university hostel',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'dgdmc7l3': {
      'en': 'Please select...',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'hwbcz6zf': {
      'en': 'Search for an item...',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'avcjeq78': {
      'en': 'Predict Cost',
      'fr': 'Prédire le coût',
      'ru': 'Прогнозировать стоимость',
      'zh_Hans': '预测成本',
      'zu': 'Qagela Izindleko',
    },
    '6eelys2v': {
      'en': 'Conceptual Cost for Construction Project Budget:',
      'fr': 'Coût conceptuel du budget du projet de construction :',
      'ru': 'Концептуальная стоимость бюджета строительного проекта:',
      'zh_Hans': '建设项目预算概念成本：',
      'zu': 'Izindleko Zokucabanga Zesabelomali Sephrojekthi Yokwakha:',
    },
  },
  // SummaryTrackingpage
  {
    '5v1acazb': {
      'en': 'Cost Tracking ',
      'fr': 'Suivi des coûts',
      'ru': 'Отслеживание затрат',
      'zh_Hans': '成本跟踪',
      'zu': 'Ukulandelela Izindleko',
    },
    'bgheih6l': {
      'en': 'Contigence Reserve Summary\n',
      'fr': 'Sommaire de la réserve pour éventualités',
      'ru': 'Сводная информация о резервном резерве',
      'zh_Hans': '应急储备汇总',
      'zu': 'Isifinyezo se-Contigence Reserve',
    },
    'v6kknsio': {
      'en': '\$',
      'fr': '\$',
      'ru': '\$',
      'zh_Hans': '\$',
      'zu': '\$',
    },
    'hdquauis': {
      'en': ' balance',
      'fr': 'équilibre',
      'ru': 'баланс',
      'zh_Hans': '平衡',
      'zu': 'ibhalansi',
    },
    'oobi1bqv': {
      'en': '\$',
      'fr': '\$',
      'ru': '\$',
      'zh_Hans': '\$',
      'zu': '\$',
    },
    's2ue67rt': {
      'en': 'income',
      'fr': 'revenu',
      'ru': 'доход',
      'zh_Hans': '收入',
      'zu': 'imali engenayo',
    },
    '5ln48jgk': {
      'en': '\$',
      'fr': '\$',
      'ru': '\$',
      'zh_Hans': '\$',
      'zu': '\$',
    },
    'koe1rgxd': {
      'en': ' expenditure',
      'fr': 'dépense',
      'ru': 'расход',
      'zh_Hans': '支出',
      'zu': 'izindleko',
    },
    'j52vavwx': {
      'en': 'Income\n',
      'fr': 'Revenu',
      'ru': 'Доход',
      'zh_Hans': '收入',
      'zu': 'Imali engenayo',
    },
    'ifatj7dd': {
      'en': '\$',
      'fr': '\$',
      'ru': '\$',
      'zh_Hans': '\$',
      'zu': '\$',
    },
    'u6ngjcvm': {
      'en': 'Expense reinbursement',
      'fr': 'Remboursement des dépenses',
      'ru': 'Рефинансирование расходов',
      'zh_Hans': '费用报销',
      'zu': 'Ukubuyisela izindleko',
    },
    '9m39amut': {
      'en': '\$',
      'fr': '\$',
      'ru': '\$',
      'zh_Hans': '\$',
      'zu': '\$',
    },
    'yc4e114f': {
      'en': ' 8000',
      'fr': '8000',
      'ru': '8000',
      'zh_Hans': '8000',
      'zu': '8000',
    },
    'qs0wvbhq': {
      'en': 'Expenses',
      'fr': 'Dépenses',
      'ru': 'Затраты',
      'zh_Hans': '花费',
      'zu': 'Izindleko',
    },
    'kw6pmatv': {
      'en': '\$',
      'fr': '\$',
      'ru': '\$',
      'zh_Hans': '\$',
      'zu': '\$',
    },
    'u2vhum7v': {
      'en': 'permits & licencing',
      'fr': 'permis et licences',
      'ru': 'разрешения и лицензирование',
      'zh_Hans': '许可证和执照',
      'zu': 'izimvume namalayisensi',
    },
    'lgvuat56': {
      'en': '\$',
      'fr': '\$',
      'ru': '\$',
      'zh_Hans': '\$',
      'zu': '\$',
    },
    'kifxs8n1': {
      'en': ' 9000',
      'fr': '9000',
      'ru': '9000',
      'zh_Hans': '9000',
      'zu': '9000',
    },
    'p9wnkpjt': {
      'en': 'Cost Summary',
      'fr': 'Maison',
      'ru': 'Дом',
      'zh_Hans': '家',
      'zu': 'Ikhaya',
    },
  },
  // categories
  {
    'a3dbmhw1': {
      'en': 'Categories',
      'fr': 'Catégories',
      'ru': 'Категории',
      'zh_Hans': '类别',
      'zu': 'Izigaba',
    },
    'x1m58ox4': {
      'en': 'Home',
      'fr': 'Maison',
      'ru': 'Дом',
      'zh_Hans': '家',
      'zu': 'Ikhaya',
    },
  },
  // Updateexpenditure
  {
    '2rslp1xd': {
      'en': 'Expenditure',
      'fr': 'Dépense',
      'ru': 'Расход',
      'zh_Hans': '支出',
      'zu': 'Izindleko',
    },
    '7or3i9pw': {
      'en': 'Expense',
      'fr': 'Frais',
      'ru': 'Расход',
      'zh_Hans': '费用',
      'zu': 'Izindleko',
    },
    'c3adh87d': {
      'en': 'Income\n',
      'fr': 'Revenu',
      'ru': 'Доход',
      'zh_Hans': '收入',
      'zu': 'Imali engenayo',
    },
    'dlvmydsq': {
      'en': 'entre amount',
      'fr': 'montant entre',
      'ru': 'средняя сумма',
      'zh_Hans': '入场金额',
      'zu': 'inani eliphelele',
    },
    'm6yhjnym': {
      'en': '0',
      'fr': '0',
      'ru': '0',
      'zh_Hans': '0',
      'zu': '0',
    },
    'yzz8rcbr': {
      'en': 'Category',
      'fr': 'Catégorie',
      'ru': 'Категория',
      'zh_Hans': '类别',
      'zu': 'Isigaba',
    },
    'zwjnhwhl': {
      'en': 'Date',
      'fr': 'Date',
      'ru': 'Дата',
      'zh_Hans': '日期',
      'zu': 'Usuku',
    },
    'yc47dbsn': {
      'en': 'Description',
      'fr': 'Description',
      'ru': 'Описание',
      'zh_Hans': '描述',
      'zu': 'Incazelo',
    },
    'mnl468ji': {
      'en': 'type here',
      'fr': 'écrivez ici',
      'ru': 'напечатайте здесь',
      'zh_Hans': '在此输入',
      'zu': 'bhala lapha',
    },
    '6d3k1mpq': {
      'en': 'Account',
      'fr': 'Compte',
      'ru': 'Счет',
      'zh_Hans': '帐户',
      'zu': 'I-akhawunti',
    },
    'bj0v8shq': {
      'en': 'Card',
      'fr': 'Carte',
      'ru': 'Карта',
      'zh_Hans': '卡片',
      'zu': 'Ikhadi',
    },
    '98bb6jle': {
      'en': 'Client Funds',
      'fr': 'Fonds des clients',
      'ru': 'Клиентские средства',
      'zh_Hans': '客户资金',
      'zu': 'Izimali Zabathengi',
    },
    'z01q2pux': {
      'en': 'Cash',
      'fr': 'Espèces',
      'ru': 'Наличные',
      'zh_Hans': '现金',
      'zu': 'Imali',
    },
    'mve3apuy': {
      'en': 'Select',
      'fr': 'Sélectionner',
      'ru': 'Выбирать',
      'zh_Hans': '选择',
      'zu': 'Khetha',
    },
    '54tufprw': {
      'en': 'Search for an item...',
      'fr': 'Rechercher un article...',
      'ru': 'Искать предмет...',
      'zh_Hans': '搜索商品...',
      'zu': 'Sesha into...',
    },
    '95k02ssd': {
      'en': 'Update',
      'fr': 'Mise à jour',
      'ru': 'Обновлять',
      'zh_Hans': '更新',
      'zu': 'Buyekeza',
    },
    'cmft5ohy': {
      'en': 'Home',
      'fr': 'Maison',
      'ru': 'Дом',
      'zh_Hans': '家',
      'zu': 'Ikhaya',
    },
  },
  // analysis
  {
    'x2xj4ama': {
      'en': 'Contigence Reserve Summary\n',
      'fr': 'Sommaire de la réserve pour éventualités',
      'ru': 'Сводная информация о резервном резерве',
      'zh_Hans': '应急储备汇总',
      'zu': 'Isifinyezo se-Contigence Reserve',
    },
    'kpsj3wtr': {
      'en': '\$',
      'fr': '\$',
      'ru': '\$',
      'zh_Hans': '\$',
      'zu': '\$',
    },
    'svgjgywe': {
      'en': ' balance',
      'fr': 'équilibre',
      'ru': 'баланс',
      'zh_Hans': '平衡',
      'zu': 'ibhalansi',
    },
    'akd0l8x4': {
      'en': '\$',
      'fr': '\$',
      'ru': '\$',
      'zh_Hans': '\$',
      'zu': '\$',
    },
    '4vm2umbb': {
      'en': 'income',
      'fr': 'revenu',
      'ru': 'доход',
      'zh_Hans': '收入',
      'zu': 'imali engenayo',
    },
    'qq32zl26': {
      'en': '\$',
      'fr': '\$',
      'ru': '\$',
      'zh_Hans': '\$',
      'zu': '\$',
    },
    'ailxapg1': {
      'en': ' expenditure',
      'fr': 'dépense',
      'ru': 'расход',
      'zh_Hans': '支出',
      'zu': 'izindleko',
    },
    'hs5b4w8r': {
      'en': 'Expense Overview',
      'fr': 'Aperçu des dépenses',
      'ru': 'Обзор расходов',
      'zh_Hans': '费用概览',
      'zu': 'Uhlolojikelele Lwezindleko',
    },
    'x4iqqdp3': {
      'en': 'Income Overview',
      'fr': 'Aperçu du revenu',
      'ru': 'Обзор доходов',
      'zh_Hans': '收入概览',
      'zu': 'Uhlolojikelele lwemali engenayo',
    },
    'e75pynpn': {
      'en': 'Please select...',
      'fr': 'Veuillez sélectionner...',
      'ru': 'Пожалуйста выберите...',
      'zh_Hans': '请选择...',
      'zu': 'Sicela ukhethe...',
    },
    'b29493a6': {
      'en': 'Search for an item...',
      'fr': 'Rechercher un article...',
      'ru': 'Искать предмет...',
      'zh_Hans': '搜索商品...',
      'zu': 'Sesha into...',
    },
    '3qbtnnb1': {
      'en': '\$',
      'fr': '\$',
      'ru': '\$',
      'zh_Hans': '\$',
      'zu': '\$',
    },
    'efiofpsc': {
      'en': 'Expense reinbursement',
      'fr': 'Remboursement des dépenses',
      'ru': 'Рефинансирование расходов',
      'zh_Hans': '费用报销',
      'zu': 'Ukubuyisela izindleko',
    },
    'vgoi2swv': {
      'en': '\$',
      'fr': '\$',
      'ru': '\$',
      'zh_Hans': '\$',
      'zu': '\$',
    },
    'rrsxcfa9': {
      'en': ' 8000',
      'fr': '8000',
      'ru': '8000',
      'zh_Hans': '8000',
      'zu': '8000',
    },
    '7uc05cpn': {
      'en': 'Analysis',
      'fr': 'Analyse',
      'ru': 'Анализ',
      'zh_Hans': '分析',
      'zu': 'Ukuhlaziya',
    },
    '7f5qr434': {
      'en': 'Analysis',
      'fr': 'Maison',
      'ru': 'Дом',
      'zh_Hans': '家',
      'zu': 'Ikhaya',
    },
  },
  // accounts
  {
    '2uk5zfmb': {
      'en': 'Contigence Reserve Summary\n',
      'fr': 'Sommaire de la réserve pour éventualités',
      'ru': 'Сводная информация о резервном резерве',
      'zh_Hans': '应急储备汇总',
      'zu': 'Isifinyezo se-Contigence Reserve',
    },
    'ticwlgbk': {
      'en': '\$',
      'fr': '\$',
      'ru': '\$',
      'zh_Hans': '\$',
      'zu': '\$',
    },
    '916c271g': {
      'en': ' balance',
      'fr': 'équilibre',
      'ru': 'баланс',
      'zh_Hans': '平衡',
      'zu': 'ibhalansi',
    },
    '0bmgg30u': {
      'en': '\$',
      'fr': '\$',
      'ru': '\$',
      'zh_Hans': '\$',
      'zu': '\$',
    },
    'usm5vuz4': {
      'en': 'income',
      'fr': 'revenu',
      'ru': 'доход',
      'zh_Hans': '收入',
      'zu': 'imali engenayo',
    },
    'wty5jn7n': {
      'en': '\$',
      'fr': '\$',
      'ru': '\$',
      'zh_Hans': '\$',
      'zu': '\$',
    },
    'mdbzgxzy': {
      'en': ' expenditure',
      'fr': 'dépense',
      'ru': 'расход',
      'zh_Hans': '支出',
      'zu': 'izindleko',
    },
    'x8gncb1r': {
      'en': 'Accounts\n',
      'fr': 'Comptes',
      'ru': 'Счета',
      'zh_Hans': '帐户',
      'zu': 'Ama-akhawunti',
    },
    'xihb27na': {
      'en': 'Card',
      'fr': 'Carte',
      'ru': 'Карта',
      'zh_Hans': '卡片',
      'zu': 'Ikhadi',
    },
    'w83i5q8t': {
      'en': 'Balance-\$',
      'fr': 'Solde-\$',
      'ru': 'Баланс-\$',
      'zh_Hans': '余额-\$',
      'zu': 'Ibhalansi-\$',
    },
    'agj0z5yi': {
      'en': 'Cash',
      'fr': 'Espèces',
      'ru': 'Наличные',
      'zh_Hans': '现金',
      'zu': 'Imali',
    },
    '298a790w': {
      'en': 'Balance-\$',
      'fr': 'Solde-\$',
      'ru': 'Баланс-\$',
      'zh_Hans': '余额-\$',
      'zu': 'Ibhalansi-\$',
    },
    'ciumglvb': {
      'en': 'Client funds',
      'fr': 'Fonds clients',
      'ru': 'Средства клиентов',
      'zh_Hans': '客户资金',
      'zu': 'Izimali zeklayenti',
    },
    'sl93w6nd': {
      'en': 'Balance-\$',
      'fr': 'Solde-\$',
      'ru': 'Баланс-\$',
      'zh_Hans': '余额-\$',
      'zu': 'Ibhalansi-\$',
    },
    'vbneolqq': {
      'en': 'Account',
      'fr': 'Compte',
      'ru': 'Счет',
      'zh_Hans': '帐户',
      'zu': 'I-akhawunti',
    },
    'kychqlhm': {
      'en': 'Accounts',
      'fr': 'Maison',
      'ru': 'Дом',
      'zh_Hans': '家',
      'zu': 'Ikhaya',
    },
  },
  // projectdetails
  {
    'ma36oj6m': {
      'en': 'Cost Power Prognator',
      'fr': 'Pronateur de puissance de coût',
      'ru': 'Стоимость мощности Прогнатор',
      'zh_Hans': '成本功率预测器',
      'zu': 'I-Cost Power Prognator',
    },
    'tmloekq1': {
      'en': 'Project Manager:',
      'fr': 'Chef de projet:',
      'ru': 'Руководитель проекта:',
      'zh_Hans': '专案经理：',
      'zu': 'Umphathi wephrojekthi:',
    },
    'ra9um0td': {
      'en': 'Project Description:',
      'fr': 'Description du projet:',
      'ru': 'Описание Проекта:',
      'zh_Hans': '项目介绍：',
      'zu': 'Incazelo Yephrojekthi:',
    },
    'o9gkp9xe': {
      'en': 'Budget:',
      'fr': 'Budget:',
      'ru': 'Бюджет:',
      'zh_Hans': '预算：',
      'zu': 'Isabelomali:',
    },
    'xjxbaz9f': {
      'en': '\$',
      'fr': '\$',
      'ru': '\$',
      'zh_Hans': '\$',
      'zu': '\$',
    },
    'u0vso3zy': {
      'en': 'Duration:',
      'fr': 'Durée:',
      'ru': 'Продолжительность:',
      'zh_Hans': '期间：',
      'zu': 'Ubude besikhathi:',
    },
    'p5uacb8n': {
      'en': ' years',
      'fr': 'années',
      'ru': 'годы',
      'zh_Hans': '年',
      'zu': 'iminyaka',
    },
    'h5w01o1n': {
      'en': 'Update',
      'fr': 'Mise à jour',
      'ru': 'Обновлять',
      'zh_Hans': '更新',
      'zu': 'Buyekeza',
    },
    'o4sxlqmb': {
      'en': 'Project Details',
      'fr': 'détails du projet',
      'ru': 'Детали проекта',
      'zh_Hans': '项目细节',
      'zu': 'Imininingwane Yephrojekthi',
    },
  },
  // Authentication
  {
    'a6d4wboe': {
      'en': 'Cost Power Prognator',
      'fr': 'Pronateur de puissance de coût',
      'ru': 'Стоимость мощности Прогнатор',
      'zh_Hans': '成本功率预测器',
      'zu': 'I-Cost Power Prognator',
    },
    '3heyrqrh': {
      'en': 'Sign In',
      'fr': 'Se connecter',
      'ru': 'Войти',
      'zh_Hans': '登入',
      'zu': 'Ngena ngemvume',
    },
    'a6n8vh13': {
      'en': 'Welcome Construction engineer; please log in to continue',
      'fr':
          'Bienvenue Ingénieur en construction ; Merci de vous connecter pour continuer',
      'ru':
          'Добро пожаловать Инженер-строитель; Пожалуйста, войдите, чтобы продолжить',
      'zh_Hans': '欢迎建筑工程师；请登录继续',
      'zu':
          'Welcome Construction engineer; sicela ungene ngemvume ukuze uqhubeke',
    },
    'jjjis8l4': {
      'en': 'Email',
      'fr': 'E-mail',
      'ru': 'Электронная почта',
      'zh_Hans': '电子邮件',
      'zu': 'I-imeyili',
    },
    'jwi0xql5': {
      'en': 'Password',
      'fr': 'Mot de passe',
      'ru': 'Пароль',
      'zh_Hans': '密码',
      'zu': 'Iphasiwedi',
    },
    '44vpvqfg': {
      'en': 'Sign In',
      'fr': 'Se connecter',
      'ru': 'Войти',
      'zh_Hans': '登入',
      'zu': 'Ngena ngemvume',
    },
    'z8blhq1c': {
      'en': 'Sign Up',
      'fr': 'S\'inscrire',
      'ru': 'Зарегистрироваться',
      'zh_Hans': '报名',
      'zu': 'Bhalisela',
    },
    'fhfjf77u': {
      'en': 'Let\'s get started by filling out the form below.',
      'fr': 'Commençons par remplir le formulaire ci-dessous.',
      'ru': 'Начнем с заполнения формы ниже.',
      'zh_Hans': '让我们从填写下面的表格开始。',
      'zu': 'Ake siqale ngokugcwalisa leli fomu elingezansi.',
    },
    'upqhj3rt': {
      'en': 'Email',
      'fr': 'E-mail',
      'ru': 'Электронная почта',
      'zh_Hans': '电子邮件',
      'zu': 'I-imeyili',
    },
    'x7m8z7rv': {
      'en': 'Password',
      'fr': 'Mot de passe',
      'ru': 'Пароль',
      'zh_Hans': '密码',
      'zu': 'Iphasiwedi',
    },
    'touixiib': {
      'en': 'Confirm Password',
      'fr': 'Confirmez le mot de passe',
      'ru': 'Подтвердите пароль',
      'zh_Hans': '确认密码',
      'zu': 'Qinisekisa Iphasiwedi',
    },
    'ld22fuef': {
      'en': 'Create Account',
      'fr': 'Créer un compte',
      'ru': 'Зарегистрироваться',
      'zh_Hans': '创建账户',
      'zu': 'Yenza i-akhawunti',
    },
    'e7hj497o': {
      'en': 'Home',
      'fr': 'Maison',
      'ru': 'Дом',
      'zh_Hans': '家',
      'zu': 'Ikhaya',
    },
  },
  // profile
  {
    '8x4dpyh0': {
      'en': 'Update Project Details',
      'fr': 'Mettre à jour les détails du projet',
      'ru': 'Обновить детали проекта',
      'zh_Hans': '更新项目详细信息',
      'zu': 'Buyekeza Imininingwane Yephrojekthi',
    },
    'wjj7aqma': {
      'en': 'Manager\'s Name',
      'fr': 'Nom du gérant',
      'ru': 'Имя менеджера',
      'zh_Hans': '经理姓名',
      'zu': 'Igama lomphathi',
    },
    'rp1ueha1': {
      'en': 'Enter manager\'s name',
      'fr': 'Entrez le nom du responsable',
      'ru': 'Введите имя менеджера',
      'zh_Hans': '输入经理姓名',
      'zu': 'Faka igama lomphathi',
    },
    '004l7gcs': {
      'en': 'Project Description',
      'fr': 'Description du projet',
      'ru': 'Описание Проекта',
      'zh_Hans': '项目介绍',
      'zu': 'Incazelo Yephrojekthi',
    },
    'v1bvgj7y': {
      'en': 'Enter project description',
      'fr': 'Entrez la description du projet',
      'ru': 'Введите описание проекта',
      'zh_Hans': '输入项目描述',
      'zu': 'Faka incazelo yephrojekthi',
    },
    'tv8pg49d': {
      'en': 'Budgeted Amount',
      'fr': 'Montant budgété',
      'ru': 'Запланированная сумма',
      'zh_Hans': '预算金额',
      'zu': 'Inani Lesabelomali',
    },
    'acmb9h9w': {
      'en': 'Enter budgeted amount',
      'fr': 'Saisissez le montant budgétisé',
      'ru': 'Введите бюджетную сумму',
      'zh_Hans': '输入预算金额',
      'zu': 'Faka inani elibekelwe isabelomali',
    },
    'n6s28xiq': {
      'en': 'Email',
      'fr': 'E-mail',
      'ru': 'Электронная почта',
      'zh_Hans': '电子邮件',
      'zu': 'I-imeyili',
    },
    'ujrqqy0y': {
      'en': 'Enter Email',
      'fr': 'Entrez l\'e-mail',
      'ru': 'Введите адрес электронной почты',
      'zh_Hans': '输入电子邮箱',
      'zu': 'Faka I-imeyili',
    },
    '4ifzzfyo': {
      'en': 'Project Duration',
      'fr': 'Durée du projet',
      'ru': 'Продолжительность проекта',
      'zh_Hans': '项目持续时间',
      'zu': 'Ubude bephrojekthi',
    },
    'iexkxf7j': {
      'en': 'Enter Duration in years',
      'fr': 'Entrez la durée en années',
      'ru': 'Введите продолжительность в годах',
      'zh_Hans': '输入持续时间（年）',
      'zu': 'Faka Ubude besikhathi ngeminyaka',
    },
    'dv5x7rns': {
      'en': 'Upload Picture',
      'fr': 'Charger une photo',
      'ru': 'Загрузить изображение',
      'zh_Hans': '上传图片',
      'zu': 'Layisha Isithombe',
    },
    '7pahhsgp': {
      'en': 'Update Details',
      'fr': 'Détails de la mise à jour',
      'ru': 'Обновить детали',
      'zh_Hans': '更新详细信息',
      'zu': 'Buyekeza Imininingwane',
    },
  },
  // pricepredictionpage
  {
    'q1lcgo9w': {
      'en': 'Material Price Prediction',
      'fr': 'Prévision du prix des matériaux',
      'ru': 'Прогноз цен на материалы',
      'zh_Hans': '材料价格预测',
      'zu': 'I-Material Price Prediction',
    },
    'sq6q62if': {
      'en': 'Inflation Rate (%)',
      'fr': 'Taux d\'inflation (%)',
      'ru': 'Уровень инфляции (%)',
      'zh_Hans': '通货膨胀率 （％）',
      'zu': 'I-Inflation Rate (%)',
    },
    '4zb228om': {
      'en': 'Enter current inflation rate',
      'fr': 'Entrez le taux d\'inflation actuel',
      'ru': 'Введите текущий уровень инфляции',
      'zh_Hans': '输入当前通货膨胀率',
      'zu': 'Faka izinga lokwehla kwamandla emali lamanje',
    },
    '3auu0r75': {
      'en': 'Imports (in million \$)',
      'fr': 'Importations (en millions \$)',
      'ru': 'Импорт (в миллионах долларов)',
      'zh_Hans': '进口额（百万美元）',
      'zu': 'Okungeniswayo (ngesigidi sama-\$)',
    },
    'ot59hdxq': {
      'en': 'Enter value of imports',
      'fr': 'Entrez la valeur des importations',
      'ru': 'Введите стоимость импорта',
      'zh_Hans': '输入进口价值',
      'zu': 'Faka inani lempahla engenisiwe',
    },
    '4xttntto': {
      'en': 'Exports (in million \$)',
      'fr': 'Exportations (en millions \$)',
      'ru': 'Экспорт (в миллионах долларов)',
      'zh_Hans': '出口额（百万美元）',
      'zu': 'Ukuthunyelwa ngaphandle (ngesigidi sama-\$)',
    },
    '6cc1qnnl': {
      'en': 'Enter value of exports',
      'fr': 'Entrez la valeur des exportations',
      'ru': 'Введите стоимость экспорта',
      'zh_Hans': '输入出口额',
      'zu': 'Faka inani lokuthunyelwa ngaphandle',
    },
    'xuj8xy42': {
      'en': 'Money Supply (in million \$)',
      'fr': 'Masse monétaire (en millions de dollars)',
      'ru': 'Денежная масса (в миллионах долларов)',
      'zh_Hans': '货币供应量（百万美元）',
      'zu': 'Ukunikezwa Kwemali (ngesigidi sama-\$)',
    },
    'jy9tnm2t': {
      'en': 'Enter total money supply',
      'fr': 'Entrez la masse monétaire totale',
      'ru': 'Введите общую денежную массу',
      'zh_Hans': '输入货币供应总量',
      'zu': 'Faka imali ephelele',
    },
    'qj3o2k79': {
      'en': 'Predict Prices',
      'fr': 'Prédire les prix',
      'ru': 'Прогнозировать цены',
      'zh_Hans': '预测价格',
      'zu': 'Qagela Amanani',
    },
    'rgrwr6n5': {
      'en': 'Predicted Material Costs',
      'fr': 'Coûts des matériaux prévus',
      'ru': 'Прогнозируемые материальные затраты',
      'zh_Hans': '预计材料成本',
      'zu': 'Izindleko Zezinto Ezibikezelwe',
    },
    'h96nxaku': {
      'en': 'Cement:',
      'fr': 'Ciment:',
      'ru': 'Цемент:',
      'zh_Hans': '水泥：',
      'zu': 'Usimende:',
    },
    'ir4ey3x2': {
      'en': '\$',
      'fr': '0,00 \$',
      'ru': '\$0,00',
      'zh_Hans': '\$0.00',
      'zu': '\$0.00',
    },
    'vi0v14ut': {
      'en': '5',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '000nv5zc': {
      'en': '\$0.00',
      'fr': '0,00 \$',
      'ru': '\$0,00',
      'zh_Hans': '\$0.00',
      'zu': '\$0.00',
    },
    '3byanak2': {
      'en': 'Quarry:',
      'fr': 'Carrière:',
      'ru': 'Карьер:',
      'zh_Hans': '采石场：',
      'zu': 'Inkwali:',
    },
    'rqkfy88o': {
      'en': '\$',
      'fr': '0,00 \$',
      'ru': '\$0,00',
      'zh_Hans': '\$0.00',
      'zu': '\$0.00',
    },
    '3xyv21pt': {
      'en': '23',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'wf1uxxch': {
      'en': '\$0.00',
      'fr': '0,00 \$',
      'ru': '\$0,00',
      'zh_Hans': '\$0.00',
      'zu': '\$0.00',
    },
    'h4td98w4': {
      'en': 'Pit Sand:',
      'fr': 'Sable de fosse :',
      'ru': 'Пит-песок:',
      'zh_Hans': '坑砂：',
      'zu': 'Isihlabathi Somgodi:',
    },
    'dlctitot': {
      'en': '\$',
      'fr': '0,00 \$',
      'ru': '\$0,00',
      'zh_Hans': '\$0.00',
      'zu': '\$0.00',
    },
    'zgj8b9wq': {
      'en': '20',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'a8bhhfpr': {
      'en': '\$0.00',
      'fr': '0,00 \$',
      'ru': '\$0,00',
      'zh_Hans': '\$0.00',
      'zu': '\$0.00',
    },
    '56p0fcra': {
      'en': 'River Sand:',
      'fr': 'Sable de rivière :',
      'ru': 'Речной песок:',
      'zh_Hans': '河沙：',
      'zu': 'River Sand:',
    },
    '2lf85oqx': {
      'en': '\$',
      'fr': '0,00 \$',
      'ru': '\$0,00',
      'zh_Hans': '\$0.00',
      'zu': '\$0.00',
    },
    '51uxky6r': {
      'en': '34',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '7lhg78y9': {
      'en': '\$0.00',
      'fr': '0,00 \$',
      'ru': '\$0,00',
      'zh_Hans': '\$0.00',
      'zu': '\$0.00',
    },
    '0tdx2brg': {
      'en': 'Suggest Materials Supplier',
      'fr': 'Suggérer un fournisseur de matériaux',
      'ru': 'Предложить поставщика материалов',
      'zh_Hans': '推荐材料供应商',
      'zu': 'Phakamisa Umhlinzeki Wezinto',
    },
    'j5tnv2we': {
      'en': 'Cost Power Prognator',
      'fr': 'Pronateur de puissance de coût',
      'ru': 'Стоимость мощности Прогнатор',
      'zh_Hans': '成本功率预测器',
      'zu': 'I-Cost Power Prognator',
    },
  },
  // sampl1
  {
    '3vl9924b': {
      'en': 'Construction Finance Advice',
      'fr': 'Conseils en financement de construction',
      'ru': 'Консультации по финансированию строительства',
      'zh_Hans': '建筑融资建议',
      'zu': 'Iseluleko Sezezimali Zokwakha',
    },
    '5h6i3jk5': {
      'en': 'Expert tips for managing your project\'s finances effectively:',
      'fr':
          'Conseils d\'experts pour gérer efficacement les finances de votre projet :',
      'ru':
          'Советы экспертов по эффективному управлению финансами вашего проекта:',
      'zh_Hans': '有效管理项目财务的专家提示：',
      'zu':
          'Amathiphu ochwepheshe okuphatha izimali zephrojekthi yakho ngempumelelo:',
    },
    'iuziezd1': {
      'en':
          '1. Plan your budget meticulously and account for unexpected costs.',
      'fr':
          '1. Planifiez méticuleusement votre budget et tenez compte des coûts imprévus.',
      'ru':
          '1. Тщательно планируйте свой бюджет и учитывайте непредвиденные расходы.',
      'zh_Hans': '1. 周密规划您的预算，并考虑意外开支。',
      'zu':
          '1. Hlela ibhajethi yakho ngokucophelela futhi ubale izindleko ezingalindelekile.',
    },
    'hsh6v9sf': {
      'en': '2. Regularly review and update your financial forecasts.',
      'fr':
          '2. Examinez et mettez à jour régulièrement vos prévisions financières.',
      'ru':
          '2. Регулярно просматривайте и обновляйте свои финансовые прогнозы.',
      'zh_Hans': '2.定期审查并更新您的财务预测。',
      'zu': '2. Hlala ubuyekeza futhi ubuyekeze izibikezelo zakho zezimali.',
    },
    'axagfmfy': {
      'en': '3. Use technology to track expenses and manage invoices.',
      'fr':
          '3. Utilisez la technologie pour suivre les dépenses et gérer les factures.',
      'ru':
          '3. Используйте технологии для отслеживания расходов и управления счетами.',
      'zh_Hans': '3. 使用技术来跟踪费用和管理发票。',
      'zu':
          '3. Sebenzisa ubuchwepheshe ukulandelela izindleko nokuphatha ama-invoyisi.',
    },
    '51i6ulh6': {
      'en': '4. Negotiate payment terms with suppliers to improve cash flow.',
      'fr':
          '4. Négocier les conditions de paiement avec les fournisseurs pour améliorer la trésorerie.',
      'ru':
          '4. Обсудите условия оплаты с поставщиками для улучшения денежного потока.',
      'zh_Hans': '4. 与供应商协商付款条件，以改善现金流。',
      'zu':
          '4. Xoxisana ngemibandela yokukhokha nabahlinzeki-mpahla ukuze kuthuthukiswe ukuhamba nokuphuma kwemali.',
    },
    '630pzhd7': {
      'en':
          '5. Train your team on cost management and financial accountability.',
      'fr':
          '5. Formez votre équipe à la gestion des coûts et à la responsabilité financière.',
      'ru':
          '5. Обучите свою команду управлению затратами и финансовой отчетности.',
      'zh_Hans': '5.对您的团队进行成本管理和财务责任培训。',
      'zu':
          '5. Qeqesha ithimba lakho ngokuphathwa kwezindleko kanye nokuziphendulela kwezezimali.',
    },
    'c0luz4l8': {
      'en':
          '6. Explore financing options like loans or lines of credit for large expenses.',
      'fr':
          '6. Explorez les options de financement comme les prêts ou les marges de crédit pour les dépenses importantes.',
      'ru':
          '6. Изучите варианты финансирования, такие как кредиты или кредитные линии для крупных расходов.',
      'zh_Hans': '6. 探索融资选择，例如用于大额开支的贷款或信用额度。',
      'zu':
          '6. Hlola izinketho zezimali njengemalimboleko noma imigqa yekhredithi yezindleko ezinkulu.',
    },
    'e0bt0kwh': {
      'en':
          '7. Consider the long-term operational costs when making purchasing decisions.',
      'fr':
          '7. Tenez compte des coûts opérationnels à long terme lorsque vous prenez des décisions d\'achat.',
      'ru':
          '7. При принятии решения о покупке учитывайте долгосрочные эксплуатационные расходы.',
      'zh_Hans': '7. 做出购买决策时要考虑长期运营成本。',
      'zu':
          '7. Cabangela izindleko zokusebenza zesikhathi eside lapho wenza izinqumo zokuthenga.',
    },
    'exl7whgl': {
      'en':
          '8. Regularly communicate with your stakeholders about the financial status of the project.',
      'fr':
          '8. Communiquez régulièrement avec vos parties prenantes sur la situation financière du projet.',
      'ru':
          '8. Регулярно сообщайте заинтересованным сторонам о финансовом состоянии проекта.',
      'zh_Hans': '8.定期与利益相关者沟通项目的财务状况。',
      'zu':
          '8. Xhumana njalo nababambe iqhaza mayelana nesimo sezimali sephrojekthi.',
    },
    '2rws9p15': {
      'en':
          '9. Implement a robust change order process to handle scope changes effectively.',
      'fr':
          '9. Mettre en œuvre un processus d\'ordre de modification robuste pour gérer efficacement les modifications de portée.',
      'ru':
          '9. Внедрите надежный процесс заказа изменений для эффективной обработки изменений содержания.',
      'zh_Hans': '9. 实施强大的变更单流程，以有效处理范围变更。',
      'zu':
          '9. Sebenzisa inqubo ye-oda yoshintsho oluqinile ukuze uphathe izinguquko zesikophu ngempumelelo.',
    },
    'cqqhu9ey': {
      'en': '10. Always maintain a contingency fund for unforeseen events.',
      'fr':
          '10. Maintenez toujours un fonds de prévoyance pour les événements imprévus.',
      'ru':
          '10. Всегда имейте резервный фонд на случай непредвиденных событий.',
      'zh_Hans': '10. 始终保留一笔应急基金，以应对不可预见的事件。',
      'zu':
          '10. Ngaso sonke isikhathi gcina isikhwama sezimo ezingalindelekile ngezehlakalo ezingalindelekile.',
    },
    'q3srztdw': {
      'en': 'For personalized advice, use our tools:',
      'fr': 'Pour des conseils personnalisés, utilisez nos outils :',
      'ru':
          'Для получения индивидуальной консультации воспользуйтесь нашими инструментами:',
      'zh_Hans': '如需个性化建议，请使用我们的工具：',
      'zu': 'Ukuze uthole iseluleko somuntu siqu, sebenzisa amathuluzi ethu:',
    },
    'odcpcqtz': {
      'en': 'Cost Prediction',
      'fr': 'Prévision des coûts',
      'ru': 'Прогнозирование затрат',
      'zh_Hans': '成本预测',
      'zu': 'Izindleko Ukubikezela',
    },
    'g1t0ufne': {
      'en': 'Expense Tracking',
      'fr': 'Suivi des dépenses',
      'ru': 'Отслеживание расходов',
      'zh_Hans': '费用追踪',
      'zu': 'Ukulandelela Izindleko',
    },
    'ow524z96': {
      'en': 'Financial Analysis',
      'fr': 'Analyse financière',
      'ru': 'Финансовый анализ',
      'zh_Hans': '财务分析',
      'zu': 'Ukuhlaziywa Kwezimali',
    },
    '5gvr60i4': {
      'en': 'View Projects',
      'fr': 'Voir les projets',
      'ru': 'Посмотреть проекты',
      'zh_Hans': '查看项目',
      'zu': 'Buka Amaphrojekthi',
    },
    'aehpuu0c': {
      'en': 'Finance Advice',
      'fr': 'Conseils financiers',
      'ru': 'Финансовый совет',
      'zh_Hans': '财务建议',
      'zu': 'Iseluleko Ngezezimali',
    },
  },
  // Chatbot
  {
    'm1szpw57': {
      'en': 'ChatBot',
      'fr': 'ChatBot',
      'ru': 'ЧатБот',
      'zh_Hans': '聊天机器人',
      'zu': 'I-ChatBot',
    },
    '8mky6g77': {
      'en': 'VoiceBot',
      'fr': 'Robot vocal',
      'ru': 'Голосовой бот',
      'zh_Hans': '语音机器人',
      'zu': 'I-VoiceBot',
    },
    '83abgw6a': {
      'en': 'AI Construction Advicer',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '22ymert0': {
      'en': 'ChatGPT Project Manager.',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '7fgwo0j0': {
      'en': 'COST POWER PROGNATOR',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '3izdpvr6': {
      'en': 'Home',
      'fr': 'Maison',
      'ru': 'Дом',
      'zh_Hans': '家',
      'zu': 'Ikhaya',
    },
  },
  // chat_ai_Screen
  {
    'ui3k7vgp': {
      'en': 'Ai Chat',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'wp3z9023': {
      'en': 'Home',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
  },
  // projectprogress
  {
    'hhll0q9d': {
      'en': 'Project Budget Overview',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'uvy1498z': {
      'en': 'Total Budget',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '3kcd23d4': {
      'en': '\$10,000',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '5ytcac3k': {
      'en': 'Currently Spent',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'csufc63k': {
      'en': '\$4,500',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'm16ggpk6': {
      'en': 'Chart Placeholder',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'iucyk2xu': {
      'en': 'Add New Entry',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'ha2d76d4': {
      'en': 'Task Label',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'xqbnruo5': {
      'en': 'Enter task label',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    's1czioy2': {
      'en': 'Cost',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'djo1m84o': {
      'en': 'Enter cost',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'rzu5an4l': {
      'en': 'Update',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '5rzhu45l': {
      'en': 'Project Progress Overview',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
  },
  // suppliers
  {
    '529u5smt': {
      'en': 'Search suppliers...',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    's686vuw9': {
      'en': 'Suppliers',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'g91fc5hm': {
      'en': 'ABC Construction Supplies',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    't36olm0c': {
      'en': '\$1000/ton',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'f6xltvuw': {
      'en': 'Cement, Bricks, Steel',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'scqrzisv': {
      'en': 'XYZ Building Materials',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'jdsrv5fq': {
      'en': '\$750/ton',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '6xrau2u8': {
      'en': 'Sand, Gravel, Concrete',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'nvfmlj2p': {
      'en': 'LMN Hardware',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'uql3p08j': {
      'en': '\$500/ton',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'dbz0jrah': {
      'en': 'Nails, Screws, Bolts',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'yoo8dyxx': {
      'en': 'OPQ Construction Depot',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'gdwtydv0': {
      'en': '\$850/ton',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '4f0nzs79': {
      'en': 'Pipes, Fittings, Insulation',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '23pdw0j1': {
      'en': 'RST Building Supplies',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'xkkmvjvc': {
      'en': '\$950/ton',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'nyxprs1d': {
      'en': 'Tiles, Flooring, Paint',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'xlvtrzwz': {
      'en': 'UVW Construction Mart',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '476m6rh9': {
      'en': '\$1100/ton',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'zbt4cn4d': {
      'en': 'Wood, Lumber, Plywood',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'z5mvg6ww': {
      'en': 'Suppliers',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
  },
  // emptyList
  {
    'fuc7vo4x': {
      'en': 'Ai Chat Active!',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'pf3ele6y': {
      'en':
          'IMPORTANT!!! Need to do:\nGo to the action below and update your API Key in order for this chat to function.\n\nYou can get an API key at:',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'm9f8pmew': {
      'en': 'https://platform.openai.com',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'csspu0gw': {
      'en': 'Watch Tutorial',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
  },
  // aiChat_Component
  {
    'ktsjgnv9': {
      'en': 'Copy response',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '52xvmux2': {
      'en': 'Type something...',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
  },
  // Miscellaneous
  {
    'ezzwq2zy': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'e8z1xqne': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'iteyeo83': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'mef2y8sa': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '6wv7l6bc': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '1ndx1n2y': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'hikbeun3': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'im4ha1jm': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'n8j24hsh': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'c8r6luxh': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '7hr7swm0': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '8s3g3vm7': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '2kmt6fs5': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '5oxq5rmo': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '0261zxje': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'g4qjvztb': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'hwe2rsya': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'yzleobb1': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'f8sh5ky4': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'vv7o0gxg': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '39pzex1z': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'l4e7lmrj': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'psz7zb9o': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    '8fov51m6': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'klh1eozc': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'cfm7v3cn': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
    'gmakwtfm': {
      'en': '',
      'fr': '',
      'ru': '',
      'zh_Hans': '',
      'zu': '',
    },
  },
].reduce((a, b) => a..addAll(b));
