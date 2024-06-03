// 参考：Qiita APIレスポンスの user に説明あり
class User {
  // コンストラクタ
  User({
    required this.id,
    required this.profileImageUrl,
  });

  // プロパティ
  final String id;
  final String profileImageUrl;

  // JSONからUserを生成するファクトリコンストラクタ(.fromJsonは任意のメソッド名 dartの標準ライブラリでない)
  factory User.fromJson(dynamic json) {
    return User(
      id: json['id'] as String, 
      profileImageUrl: json['profile_image_url'] as String,
      );
  }
}