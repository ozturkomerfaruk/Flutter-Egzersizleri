import 'package:denemelerdunyasi/news_data.dart';
import 'package:denemelerdunyasi/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoriesPage extends StatelessWidget {
  const StoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<NewsData>().fetchData;
    return Scaffold(
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<NewsData>().initialValues();
          context.read<NewsData>().fetchData;
        },
        child: Center(
          child: Consumer<NewsData>(
            builder: ((context, value, child) {
              return value.map.isEmpty && !value.error
                  ? const CircularProgressIndicator()
                  : value.error
                      ? Text(
                          'Oops, something went wrong. ${value.errorMessage}',
                          textAlign: TextAlign.center,
                        )
                      : ListView.builder(
                          itemCount: value.map['stories'].length,
                          itemBuilder: (context, index) {
                            return NewsCard(map: value.map['stories'][index]);
                          },
                        );
            }),
          ),
        ),
      ),
    );
  }
}
