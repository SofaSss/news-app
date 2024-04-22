import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:news_app/bloc/tabs/tabs_bloc.dart';
import 'package:news_app/pages/likes_list.dart';
import 'package:news_app/pages/log_in.dart';
import 'package:news_app/pages/news_list.dart';
import 'package:news_app/pages/sign_up.dart';

import '../generated/l10n.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  static const List<Widget> _widgetOptions = <Widget>[
    NewsList(),
    LikesList(),
    RegisterForm(),
    LoginFormForm(),
  ];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthBloc>(context).add(GetUserFromPrefs());
  }

  void _onItemTapped(int index) {
    BlocProvider.of<TabsBloc>(context).add(ChangeTabs(index));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabsBloc, TabsState>(
      builder: (context, state) {
        return BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromRGBO(8, 108, 201, 1.0),
              centerTitle: true,
              title: Text(
                state.tabIndex == 0
                    ? AppLocalizations.of(context).allNews
                    : state.tabIndex == 1
                        ? 'Избранные'
                        : " ",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            body: Center(
              child: _widgetOptions[state.tabIndex],
            ),
            drawer: Drawer(
              backgroundColor: const Color.fromRGBO(217, 234, 250, 1.0),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 75,
                    child: DrawerHeader(
                      child: Text(
                        AppLocalizations.of(context).Menu,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context).News),
                    trailing: const Icon(Icons.newspaper),
                    selected: state.tabIndex == 0,
                    onTap: () {
                      _onItemTapped(0);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text('Избранное'),
                    trailing: const Icon(Icons.favorite),
                    selected: state.tabIndex == 1,
                    onTap: () {
                      if (authState.user == null) {
                        _onItemTapped(3);
                        Navigator.pop(context);
                        return;
                      }
                      _onItemTapped(1);
                      Navigator.pop(context);
                    },
                  ),
                  authState.user == null
                      ? ListTile(
                          title: const Text('Войти'),
                          trailing: const Icon(Icons.login),
                          selected: state.tabIndex == 2,
                          onTap: () {
                            _onItemTapped(3);
                            Navigator.pop(context);
                          },
                        )
                      : ListTile(
                          title: const Text('Выйти'),
                          trailing: const Icon(Icons.login),
                          selected: false,
                          onTap: () {
                            BlocProvider.of<AuthBloc>(context)
                                .add(CleanUserEvent());
                            _onItemTapped(0);
                            Navigator.pop(context);
                          },
                        ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
