import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/news_list_bloc/news_list_bloc.dart';
import '../generated/l10n.dart';

class ErrorNewsListWidget extends StatelessWidget {
  const ErrorNewsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${AppLocalizations.of(context).error} ',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton(
            onPressed: () async {
              context.read<NewsAppBloc>();
            },
            child: Text(
              AppLocalizations.of(context).tryAgain,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ],
      ),
    );
  }
}
