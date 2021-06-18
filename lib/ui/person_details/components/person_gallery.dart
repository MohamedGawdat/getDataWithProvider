import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ibtikar_test/data/providers/person_details_provider.dart';
import 'package:ibtikar_test/utilities/images_handler/image_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonGallery extends StatelessWidget {
  const PersonGallery({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PersonDetailsProvider>(
      builder: (context, provider, child) => StaggeredGridView.countBuilder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        crossAxisCount: 2,
        itemCount: provider.profileGallery.length,
        itemBuilder: (BuildContext context, int index) => Hero(
          tag: provider.profileGallery[index].filePath,
          child: ImageView(
            url: provider.profileGallery[index].filePath,
            width: .45.sw,
            height: .5.sw,
            downloadableImg: true,
          ),
        ),
        staggeredTileBuilder: (int index) => new StaggeredTile.count(1, 1.5),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}
