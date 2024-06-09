import 'package:flutter/material.dart';
import 'package:qiita_api_search/models/article.dart';
import 'package:intl/intl.dart';

class ArticleContainer extends StatelessWidget {
  const ArticleContainer({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 16,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        decoration: const BoxDecoration(
          color: Color(0xFF55C500), 
          borderRadius: BorderRadius.all(
            Radius.circular(32), // 角丸
          ),
        ),
        // コンテナ内 表示要素 --start--
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // createdAt
            Text(
              DateFormat('yyyy/MM/dd').format(article.createdAt),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
              ),
            ),
            // title
            Text(
              article.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis, // overflowプロパティで文字数制御
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            // tags
            Text(
              '#${article.tags.join(' #')}', // 文字列の配列を結合
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontStyle: FontStyle.italic, // イタリック
              ),
            ),
            const SizedBox(height: 6),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // ハートアイコン＆いいね
                Column(
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    Text(
                      article.likesCount.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                // プロフィール画像
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundImage: NetworkImage(article.user.profileImageUrl),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      article.user.id,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        // コンテナ内 表示要素 --end--

      ),
    );
  }
}