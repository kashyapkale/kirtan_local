import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_kirthan/view_models/main_page_view_model.dart';
import 'package:flutter_kirthan/views/widgets/users_panel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  final MainPageViewModel viewModel;

  MainPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  TabController tabController;

  Future loadData() async {
    await widget.viewModel.setUserdetails();
    await widget.viewModel.setUserdetails();
    await widget.viewModel.setUserdetails();
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Star Wars',
          style: TextStyle(
            fontFamily: 'Distant Galaxy',
          ),
        ),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3.0,
          tabs: <Widget>[
            Tab(icon: Icon(FontAwesomeIcons.film)),
            Tab(icon: Icon(FontAwesomeIcons.users)),
            Tab(icon: Icon(FontAwesomeIcons.globeAmericas))
          ],
        ),
      ),
      body: ScopedModel<MainPageViewModel>(
        model: widget.viewModel,
        child: TabBarView(
          controller: tabController,
          children: <Widget>[
            UsersPanel(),
            UsersPanel(),
            UsersPanel(),
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }
}