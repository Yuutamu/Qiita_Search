import 'package:flutter/material.dart';
import 'dart:convert'; // json変換
import 'package:http/http.dart' as http; // http通信で利用 | httpという変数を通して、httpパッケージにアクセス
import 'package:flutter_dotenv/flutter_dotenv.dart'; // dotenv
import 'package:qiita_api_search/models/article.dart';
import 'package:qiita_search/models/article.dart'; // Articleクラス

Future<List<Article>> searchQiita(String keyword) async {
  // API のエンドポイントを指定 ||| Uri.https([baseUrl], [Urlパス], Map<String,dynamic>[クエリパラメータ])
  final uri = Uri.http('qiita.com', '/api/v2/items', {
    'query': 'title:$keyword', // title で検索可能にするため query フィールドにtitle を指定
    'per_page': '10', //  記事を10件取得
  });

  // アクセストークンを取得
  final String token = dotenv.env['QIITA_ACCESS_TOKEN'] ?? ''; // 返り値ない場合は ’’ を返す

  // アクセストークンとともにHTTP GETリクエストを送信
  // MEMO:res は、http.Response クラスの変数
  final http.Response res = await http.get(uri, headers: {
    'Authorization': 'Bearer $token', // アクセストークン
  });

  // ステータスコードに応じた処理
  if (res.statusCode == 200) {
    // レスポンスをモデルクラスに変換、配列にいれる
    final List<dynamic> body = jsonDecode(res.body); // レスポンスを List<dynamic>型に変換

    // 1. map()でList<dynamic>型の配列の中身を１つ１つ factory コンストラクタを使ってArticleオブジェクトに変換
    // 2. toList()で再度配列に格納し直し返す
    return body.map((dynamic json) => Article.fromJson(json)).toList();

  } else {
    print('APIレスポンスが正常にget出来ませんでした'); // デバックのため
    return [];
  }

  // 4. 変換したArticleクラスの配列を返す(returnする)
}