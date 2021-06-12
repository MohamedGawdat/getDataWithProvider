import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ibtikar_test/constants.dart';
import 'package:ibtikar_test/data/models/person/people_model.dart';
import 'package:ibtikar_test/data/providers/person_details_provider.dart';
import 'package:ibtikar_test/style/app_text_style.dart';
import 'package:ibtikar_test/utilities/images_handler/image_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PersonDetailsScreen extends StatefulWidget {
  final PopularPersonResults personData;
  const PersonDetailsScreen({Key? key, required this.personData})
      : super(key: key);

  @override
  _PersonDetailsScreenState createState() => _PersonDetailsScreenState();
}

class _PersonDetailsScreenState extends State<PersonDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PersonDetailsProvider>(context, listen: false)
        .getPersonImages(widget.personData.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.personData.name),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 0.01.sw, vertical: 0.012.sh),
        children: [
          ImageView(
              url: widget.personData.profilePath,
              width: 0.8.sw,
              height: 0.8.sw),
          AppConst.sizedBoxH10,
          Text(
            widget.personData.name,
            textAlign: TextAlign.center,
            style: hugeTextBold,
          ),
          AppConst.sizedBoxH5,
          Text(
            widget.personData.knownForDepartment,
            textAlign: TextAlign.center,
            style: bigTextBold,
          ),
          AppConst.sizedBoxH10,
          ExpansionTile(

            title: Text(
              'List of Works',
              style: hugeTextBold,
            ),
            children: [
              ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => ExpansionTile(

                  title: Text(
                    widget.personData.knownFor[index].title,
                    style: blueText,
                  ),
                  children: [
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Release Date' +
                              widget.personData.knownFor[index].releaseDate,
                          style: smallGreyText,
                        ),  Text(
                          'Rating' +
                              widget.personData.knownFor[index].voteAverage.toString(),
                          style: smallGreyText,
                        ),
                      ],
                    ),
                    Text(
                      widget.personData.knownFor[index].overview,
                      style: normalTextSemiBold,
                    ),
                  ],
                  leading: ImageView(
                    url: widget.personData.knownFor[index].posterPath,
                    height: 100,
                    width: 100,
                  ),
                  childrenPadding: EdgeInsets.all(12),
                ),
                itemCount: widget.personData.knownFor.length,
              ),
            ],
          ),
          AppConst.sizedBoxH10,
          Consumer<PersonDetailsProvider>(
            builder: (context, provider, child) =>
                StaggeredGridView.countBuilder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              crossAxisCount: 2,
              itemCount: provider.profileGallery.length,
              itemBuilder: (BuildContext context, int index) => ImageView(
                url: provider.profileGallery[index].filePath,
                width: .45.sw,
                height: .5.sw,
                downloadableImg: true,
              ),
              staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(1, 1.5),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        ],
      ),
    );
  }
}
