import 'package:flutter/material.dart';
import 'package:ibtikar_test/data/models/person/person_module.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ibtikar_test/style/app_text_style.dart';
import '../../../constants.dart';

class SinglePersonCard extends StatefulWidget {
  final PopularPeopleResults data;
  const SinglePersonCard({Key? key, required this.data}) : super(key: key);

  @override
  _SinglePersonCardState createState() => _SinglePersonCardState();
}

class _SinglePersonCardState extends State<SinglePersonCard> {
  var concatenate = StringBuffer();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.data.knownFor.forEach((item){
      concatenate.write(item.title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 5),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              AppConst.imageBaseUrl +
                  widget.data.profilePath,
              width: .45.sw,
              height: .5.sw,
              fit: BoxFit.fill,
            ),
            Text(widget.data.name,style: normalTextBold,),
            Flexible(child: Text(concatenate.toString(),style: smallGreyText,maxLines: 2,textAlign: TextAlign.center,))
          ],
        ),
      ),
    );
  }
}
