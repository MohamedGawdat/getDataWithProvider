import 'package:flutter/material.dart';
import 'package:ibtikar_test/data/models/person/people_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibtikar_test/data/providers/person_details_provider.dart';
import 'package:ibtikar_test/style/app_text_style.dart';
import 'package:ibtikar_test/ui/person_details/person_details_screen.dart';
import 'package:ibtikar_test/utilities/images_handler/image_view.dart';
import 'package:ibtikar_test/utilities/navigation.dart';
import 'package:provider/provider.dart';

class SinglePersonCard extends StatefulWidget {
  final PopularPersonResults personData;
  const SinglePersonCard({Key? key, required this.personData})
      : super(key: key);

  @override
  _SinglePersonCardState createState() => _SinglePersonCardState();
}

class _SinglePersonCardState extends State<SinglePersonCard> {
  var concatenate = StringBuffer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.personData.knownFor.forEach((item) {
      concatenate.write(item.title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
        child: InkWell(
          onTap: () => NavigateUtil.navigate(
              context,
              ChangeNotifierProvider(
                  create: (context) => PersonDetailsProvider(),
                  builder: (context, child) =>
                      PersonDetailsScreen(personData: widget.personData))),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageView(
                url: widget.personData.profilePath,
                width: .45.sw,
                height: .5.sw,
              ),
              Text(
                widget.personData.name,
                style: normalTextBold,
              ),
              Flexible(
                  child: Text(
                concatenate.toString(),
                style: smallGreyText,
                maxLines: 2,
                textAlign: TextAlign.center,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
