import 'package:albums/entity/track_entity.dart';

class TracklListApiResponse {
  final int resultCount;
  final List<TrackEntity> results;

  TracklListApiResponse({
    this.resultCount,
    this.results,
  });

  factory TracklListApiResponse.fromJson(Map<String, dynamic> json) => TracklListApiResponse(
        resultCount: json["resultCount"],
        results:
            List<TrackEntity>.from(json["results"].map((x) => TrackEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resultCount": resultCount,
        "results": List<TrackEntity>.from(results.map((x) => x.toJson())),
      };
}
