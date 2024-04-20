import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math' as math;
import '../bloc/news_details_screen_bloc/news_details_screen_bloc.dart';
import '../generated/l10n.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsDetailsScreenBloc, NewsDetailsScreenState>(
      builder: (context, state) {
        if (state is NewsDetailsScreenLoaded) {
          return ElevatedButton(
            onPressed: () {
              launchUrl(Uri.parse(state.newsById.url));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(217, 234, 250, 1.0),
              fixedSize: const Size(236, 40),
              shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: Row(
              children: [
                Transform.rotate(
                  angle: -math.pi / 4.0,
                  child: const Icon(
                    Icons.link,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    AppLocalizations.of(context).goToTheSource,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
