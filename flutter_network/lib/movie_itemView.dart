import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MovieItem.dart';

class JXMovieItemView extends StatelessWidget {
  const JXMovieItemView({Key? key, required this.movie}) : super(key: key);
  final SubjectCollectionItem movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 8, color: Color(0xffcccccc)))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: buildContent(),
      ),
    );
  }

  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        imageContent(),
        const SizedBox(
          width: 8,
        ),
        infoContent(),
      ],
    );
  }

  Widget imageContent() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image(
        // color: Colors.red,
        image: NetworkImage(movie.cover!.url!),
        height: 150,
      ),
    );
  }

  Widget infoContent() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.title!,
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            movie.cardSubtitle!,
            textAlign: TextAlign.left,
          ),

          const SizedBox(
            height: 25,
          ),

          Text(
            movie.info!,
            textAlign: TextAlign.left,
            softWrap: true,
          )
        ],
      ),
    );
  }
}
