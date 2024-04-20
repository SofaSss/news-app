import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/news_details_screen_bloc/news_details_screen_bloc.dart';
import '../generated/l10n.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsDetailsScreenBloc, NewsDetailsScreenState>(
        builder: (context, state) {
      if (state is NewsDetailsScreenLoaded) {
        return Image.network(
          state.newsById.image_url,
          width: 397,
          height: 215,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(
              //container
              child: SizedBox(
                width: 397,
                height: 215,
                child: Icon(Icons.image),
              ),
            );
          },
        );
      }
      if (state is NewsDetailsScreenError) {
        return Text(AppLocalizations.of(context).eror);
      }
      return const SizedBox.shrink();
    });
  }
}
