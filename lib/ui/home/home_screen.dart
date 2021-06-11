import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ibtikar_test/data/providers/home_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeScreenProvider>(context, listen: false)
        .getPopularPersonsList(page: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<HomeScreenProvider>(
        builder: (context, provider, child) => StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: provider.peopleResults.length,
          itemBuilder: (BuildContext context, int index) => Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: new Column(
                children: [
                  Image.network(
                    AppConst.imageBaseUrl +
                        provider.peopleResults[index].profilePath,
                    width: .45.sw,
                    height: .5.sw,
                    fit: BoxFit.fill,
                  ),
                  Text(provider.peopleResults[index].name)
                ],
              ),
            ),
          ),
          staggeredTileBuilder: (int index) => new StaggeredTile.count(1, 1.5),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      ),
    );
  }
}
