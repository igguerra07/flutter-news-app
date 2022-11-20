import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/details/detais_page_params.dart';
import 'package:newsapp/src/app/features/news/presentation/pages/details/widgets/news_details_header.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NewsDetailsPage extends StatelessWidget {
  final DetailsPageParams params;

  const NewsDetailsPage({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NewsDetailsHeader(news: params.news),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(params.news.description),
                        const SizedBox(height: 8),
                        Text(params.news.content),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: _openInBrowser,
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(48),
                                ),
                                child: const Text("Ler matéria completa"),
                              ),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: _shareNews,
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(48, 48),
                              ),
                              child: const Icon(Icons.share_rounded),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openInBrowser() {
    launchUrlString(
      params.news.originalLink,
      mode: LaunchMode.platformDefault,
    );
  }

  void _shareNews() {
    FlutterShare.share(
      text: 'Olha essa notícia que eu encontrei',
      title: params.news.title,
      linkUrl: params.news.originalLink,
    );
  }
}
