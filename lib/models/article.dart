import 'package:qiita_api_search/models/user.dart';

class Article {
  // コンストラクタ
  // MEMO: title,user,url,createdAtは必ず必要なのでrequired || likesCount,tagsは存在しない場合があるので、デフォルト値を設定
  Article({
    required this.id, // これ取ってこなくとも良いかも（暫定残し）
    required this.title,
    required this.user,
    this.likesCount = 0, // いいね数
    this.tags = const [], // 記事ごと登録できるタグ（例：rails, flutter, 初心者）
    required this.createdAt,
    required this.url,
  });

  // プロパティ
  final String id;
  final String title;
  final User user; // User型
  final int likesCount;
  final List<String> tags; // List<String>型
  final DateTime createdAt;
  final String url;

  // JSONからUserを生成するファクトリコンストラクタ(.fromJsonは任意のメソッド名 dartの標準ライブラリでない)
  factory Article.fromJson(dynamic json) {
    return Article(
      id: json['id'] as String, 
      title: json['title'] as String, 
      user: User.fromJson(json['user']), // User.fromJson()を使ってUserを生成
      url: json['url'] as String,
      createdAt: DateTime.parse(json['created_at'] as String), //DateTime.perseを使って文字列をDateTime型に変換
      likesCount: json['likes_count'] as int, 
      tags: List<String>.from(json['tags'].map((tag) => tag['name'])), // List<String>.from()を使ってList<String>に変換 連想配列を'name'だけの配列に作り変えるイメージ
    );
  }
}