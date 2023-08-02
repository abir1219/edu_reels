class ReelsModel {
  List<Images>? images;
  List<Videos>? videos;
  List<Mcq>? mcq;

  ReelsModel({this.images, this.videos, this.mcq});

  ReelsModel.fromJson(Map<String, dynamic> json) {
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(Videos.fromJson(v));
      });
    }
    if (json['mcq'] != null) {
      mcq = <Mcq>[];
      json['mcq'].forEach((v) {
        mcq!.add(Mcq.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    if (mcq != null) {
      data['mcq'] = mcq!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? imageUrl;

  Images({this.imageUrl});

  Images.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageUrl'] = imageUrl;
    return data;
  }
}

class Videos {
  String? videoUrl;

  Videos({this.videoUrl});

  Videos.fromJson(Map<String, dynamic> json) {
    videoUrl = json['videoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['videoUrl'] = videoUrl;
    return data;
  }
}

class Mcq {
  String? question;
  List<String>? options;
  int? correctAnswerIndex;

  Mcq({this.question, this.options, this.correctAnswerIndex});

  Mcq.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    options = json['options'].cast<String>();
    correctAnswerIndex = json['correctAnswerIndex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    data['options'] = options;
    data['correctAnswerIndex'] = correctAnswerIndex;
    return data;
  }
}