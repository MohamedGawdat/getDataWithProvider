import 'package:flutter/material.dart';
import 'package:ibtikar_test/data/models/person/people_model.dart';
import 'package:ibtikar_test/data/providers/person_details_provider.dart';
import 'package:ibtikar_test/style/app_text_style.dart';
import 'package:ibtikar_test/utilities/images_handler/image_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibtikar_test/widgets/sized_boxes.dart';
import 'package:provider/provider.dart';
import 'components/person_gallery.dart';
import 'components/person_works_history.dart';

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
        .fetchPersonImages(widget.personData.id);
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
          Hero(
            tag: widget.personData.profilePath + 'hero',
            child: ImageView(
                url: widget.personData.profilePath,
                width: 0.8.sw,
                height: 0.8.sw),
          ),
          SizedBoxConst.sizedBoxH10,
          Text(
            widget.personData.name,
            textAlign: TextAlign.center,
            style: hugeTextBold,
          ),
          SizedBoxConst.sizedBoxH5,
          Text(
            widget.personData.knownForDepartment,
            textAlign: TextAlign.center,
            style: bigTextBold,
          ),
          SizedBoxConst.sizedBoxH10,
          PersonWorks(
            knownFor: widget.personData.knownFor,
          ),
          SizedBoxConst.sizedBoxH10,
          PersonGallery(),
        ],
      ),
    );
  }
}
