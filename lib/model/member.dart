

class Member{
  late final String adId;
  late final String adPw;
  late final String adProfileImg;

  Member({required this.adId, required this.adPw, required this.adProfileImg});

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      adId: json['adId'],
      adPw: json['adPw'],
      adProfileImg: json['adProfileImg'],
    );
  }

}
