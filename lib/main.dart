import 'package:flutter/material.dart';
import 'package:flutter_kirthan/services/data_services.dart';
import 'package:flutter_kirthan/view_models/main_page_view_model.dart';
import 'package:flutter_kirthan/views/pages/main_page.dart';
import 'package:flutter_kirthan/theme/theme_manager.dart';
import 'package:provider/provider.dart';


final MainPageViewModel mainPageVM = MainPageViewModel(apiSvc: RestAPIServices());
//updated by anuj machine
void main() => runApp(KirthanApp(mainPageVM: mainPageVM));

class KirthanApp extends StatelessWidget {
  final MainPageViewModel mainPageVM;

  KirthanApp({@required this.mainPageVM});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ThemeNotifier(),
    child: Consumer<ThemeNotifier>(
    builder: (context, ThemeNotifier notifier, child) {

    return new MaterialApp(
      title: 'Kirthan Application',
    theme: notifier.darkTheme ? dark : light,
      home: MainPage(viewModel: mainPageVM),
      debugShowCheckedModeBanner: false,
    );
    } ,
    ),
    );
  }
}
