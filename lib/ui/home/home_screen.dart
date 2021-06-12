import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ibtikar_test/data/providers/home_screen_provider.dart';
import 'package:ibtikar_test/ui/home/components/single_person_card.dart';
import 'package:ibtikar_test/utilities/connictivity.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {

  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  void _onRefresh() async{
    Provider.of<HomeScreenProvider>(context, listen: false)
        .resetData();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{

    Provider.of<HomeScreenProvider>(context, listen: false)
        .getNextPage();

    _refreshController.loadComplete();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeScreenProvider>(context, listen: false)
        .getPopularPersonsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<HomeScreenProvider>(
          builder: (context, provider, child) =>  SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: WaterDropHeader(),
            footer: CustomFooter(
              builder: (BuildContext context, LoadStatus? mode){
                Widget body ;
                if(mode==LoadStatus.idle){
                  body =  Text("pull up load");
                }
                else if(mode==LoadStatus.loading){
                  body =  CupertinoActivityIndicator();
                }
                else if(mode == LoadStatus.failed){
                  body = Text("Load Failed!Click retry!");
                }
                else if(mode == LoadStatus.canLoading){
                  body = Text("release to load more");
                }
                else{
                  body = Text("No more Data");
                }
                return Container(
                  height: 55.0,
                  child: Center(child:body),
                );
              },
            ),
            controller: _refreshController,
            onRefresh: _onRefresh,
            onLoading: _onLoading,

            child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: provider.peopleResults.length,
            itemBuilder: (BuildContext context, int index) => SinglePersonCard(personData: provider.peopleResults[index]),
            staggeredTileBuilder: (int index) => new StaggeredTile.count(1, 1.5),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ),
        ),
      ),
    );
  }
}
