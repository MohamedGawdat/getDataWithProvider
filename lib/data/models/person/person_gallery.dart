import 'package:ibtikar_test/constants/constants.dart';

class PersonGallery {
  late int id;
  late List<ProfileGallery> profiles;

  PersonGallery({required this.id, required this.profiles});

  PersonGallery.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['profiles'] != null) {
      profiles = [];
      json['profiles'].forEach((v) {
        profiles.add(new ProfileGallery.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.profiles != null) {
      data['profiles'] = this.profiles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProfileGallery {
  late double aspectRatio;
  late String filePath;
  late int height;
  late Null iso6391;
  late double voteAverage;
  late int voteCount;
  late int width;

  ProfileGallery(
      {required this.aspectRatio,
      required this.filePath,
      required this.height,
      required this.iso6391,
      required this.voteAverage,
      required this.voteCount,
      required this.width});

  ProfileGallery.fromJson(Map<String, dynamic> json) {
    aspectRatio = json['aspect_ratio'];
    filePath = AppConst.imageBaseUrl + json['file_path'];
    height = json['height'];
    iso6391 = json['iso_639_1'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aspect_ratio'] = this.aspectRatio;
    data['file_path'] = this.filePath;
    data['height'] = this.height;
    data['iso_639_1'] = this.iso6391;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['width'] = this.width;
    return data;
  }
}
