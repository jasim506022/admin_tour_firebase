import 'package:flutter/material.dart';

class ImageShowWidget extends StatelessWidget {
  const ImageShowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Web Image Example'),
        ),
        body: Center(
          child: Image.network(
            'https://firebasestorage.googleapis.com/v0/b/bd-tour-f37b7.appspot.com/o/tour_picture%2Fimages%2FNN%20Sir%20180.jpg_%201723358280372?alt=media&token=66a8ee17-4f48-4110-aea7-693b3a8337b4',
            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              }
            },
            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              return const Text('Failed to load image');
            },
          ),
        ),
      );
  }
}