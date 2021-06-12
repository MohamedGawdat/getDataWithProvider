import '../../../constants.dart';

class PeopleApiResponse {
  late int page;
  late List<PopularPersonResults> results;
  late int totalPages;
  late int totalResults;

  PeopleApiResponse(
      {required this.page,
      required this.results,
      required this.totalPages,
      required this.totalResults});

  PeopleApiResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results
            .add(new PopularPersonResults.fromJson(v as Map<String, dynamic>));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}

class PopularPersonResults {
  late bool adult;
  late int gender;
  late int id;
  late List<KnownFor> knownFor;
  late String knownForDepartment;
  late String name;
  late double popularity;
  late String profilePath;

  PopularPersonResults(
      {required this.adult,
      required this.gender,
      required this.id,
      required this.knownFor,
      required this.knownForDepartment,
      required this.name,
      required this.popularity,
      required this.profilePath});

  PopularPersonResults.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    if (json['known_for'] != null) {
      knownFor = [];
      json['known_for'].forEach((v) {
        knownFor.add(new KnownFor.fromJson(v as Map<String, dynamic>));
      });
    }
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    popularity = json['popularity'];
    profilePath =AppConst.imageBaseUrl+ json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['gender'] = this.gender;
    data['id'] = this.id;
    if (this.knownFor != null) {
      data['known_for'] = this.knownFor.map((v) => v.toJson()).toList();
    }
    data['known_for_department'] = this.knownForDepartment;
    data['name'] = this.name;
    data['popularity'] = this.popularity;
    data['profile_path'] = this.profilePath;
    return data;
  }
}

class KnownFor {
  late bool adult;
  late String backdropPath;
  late List<dynamic> genreIds;
  late int id;
  late String mediaType;
  late String originalLanguage;
  late String originalTitle;
  late String overview;
  late String posterPath;
  late String releaseDate;
  late String title;
  late bool video;
  late double voteAverage;
  late int voteCount;
  late String firstAirDate;
  late String name;
  late String originCountry;
  late String originalName;

  KnownFor(
      {required this.adult,
      required this.backdropPath,
      required this.genreIds,
      required this.id,
      required this.mediaType,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.title,
      required this.video,
      required this.voteAverage,
      required this.voteCount,
      required this.firstAirDate,
      required this.name,
      required this.originCountry,
      required this.originalName});

  KnownFor.fromJson(Map<String, dynamic> json) {
    adult = json['adult'] ?? false;
    backdropPath = json['backdrop_path']??'No Data';
    genreIds = json['genre_ids'];
    id = json['id'];
    mediaType = json['media_type'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'] ?? 'No Data';
    overview = json['overview'] ?? 'No Data';
    posterPath = json['poster_path'] ?? 'No Data';
    releaseDate = json['release_date'] ?? 'No Data';
    title = json['title'] ?? 'No Data';
    video = json['video'] ?? false;
    voteAverage = double.parse(json['vote_average'].toString());
    voteCount = json['vote_count'];
    firstAirDate = json['first_air_date'] ?? 'No Data';
    name = json['name'].toString();
    originCountry = json['origin_country'].toString();
    originalName = json['original_name'] ?? 'No Data';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['media_type'] = this.mediaType;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['first_air_date'] = this.firstAirDate;
    data['name'] = this.name;
    data['origin_country'] = this.originCountry;
    data['original_name'] = this.originalName;
    return data;
  }
}
