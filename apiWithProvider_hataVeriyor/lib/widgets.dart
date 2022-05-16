import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final Map<String, dynamic> map;

  const NewsCard({
    Key? key,
    required this.map,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network('${map['image']}'),
              const SizedBox(height: 10),
              Text(
                '${map['heading']}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                '${map['heading']}',
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
