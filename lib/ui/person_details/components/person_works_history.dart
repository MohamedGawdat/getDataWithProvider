import 'package:flutter/material.dart';
import 'package:ibtikar_test/data/models/person/people_model.dart';
import 'package:ibtikar_test/style/app_text_style.dart';
import 'package:ibtikar_test/utilities/images_handler/image_view.dart';

class PersonWorks extends StatelessWidget {
  final List<KnownFor> knownFor;

  const PersonWorks({Key? key, required this.knownFor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
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
              knownFor[index].title,
              style: blueText,
            ),
            children: [
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Release Date' + knownFor[index].releaseDate,
                    style: smallGreyText,
                  ),
                  Text(
                    'Rating' + knownFor[index].voteAverage.toString(),
                    style: smallGreyText,
                  ),
                ],
              ),
              Text(
                knownFor[index].overview,
                style: normalTextSemiBold,
              ),
            ],
            leading: ImageView(
              url: knownFor[index].posterPath,
              height: 100,
              width: 100,
            ),
            childrenPadding: EdgeInsets.all(12),
          ),
          itemCount: knownFor.length,
        ),
      ],
    );
  }
}
