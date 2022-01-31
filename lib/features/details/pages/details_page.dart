import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/core/theme/app_theme.dart';

import '/features/details/controller/details_controller.dart';
import '/features/details/widgets/form_details_widget.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({ Key? key }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> with TickerProviderStateMixin {
  TabController? tabController;
  int indexTabController = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
    tabController!.addListener(() {
      setState(() {
        indexTabController = tabController!.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final detailsController = Provider.of<DetailsController>(context);
    detailsController.changeIndexTabBarDetailsPage(indexTabController);

    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Viagem', style: TextStyle(color: Color(0xFF000000))),
          iconTheme: IconThemeData(color: Color(0xFF000000)),
          bottom: TabBar(
            controller: tabController,
            tabs: [
              Tab(
                text: "1. Orçado",
              ),
              Tab(
                text: "2. Previsto",
              ),
              Tab(
                text: "3. Realizado",
              ),
            ],
            labelStyle: TextStyle(color: Color(0xFF000000)),
            labelColor: AppTheme.colors.title,
          ),
          actions: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Pesquisar por viagem',
                  hintStyle: TextStyle(fontSize: 13),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.search, size: 25),
            )
          ],
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            FormDetailsWidget(),
            FormDetailsWidget(),
            FormDetailsWidget(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

}