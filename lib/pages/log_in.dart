import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/auth_bloc/auth_bloc.dart';
import 'package:news_app/bloc/tabs/tabs_bloc.dart';
import 'package:news_app/repositories/dto/sign_in_dto.dart';

void main() {
  runApp(const MaterialApp(home: LoginFormForm()));
}

class LoginFormForm extends StatefulWidget {
  const LoginFormForm({super.key});

  @override
  _LoginFormFormState createState() => _LoginFormFormState();
}

class _LoginFormFormState extends State<LoginFormForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? errorMessage;
  bool isLoading = false;

  void setErrorMessage(String? m) {
    setState(() {
      errorMessage = m;
    });
  }

  void setLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 5,
            left: 0,
            right: 0,
            child: Transform.scale(
              scale: 0.6,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          Positioned(
            top: 310,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Center(
                  child: Text(errorMessage ?? "",
                      style: const TextStyle(
                        color: Colors.red,
                      )),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: CupertinoTextField(
                          controller: _emailController,
                          placeholder: 'Логин',
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromRGBO(8, 108, 201, 1.0),
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          placeholderStyle: const TextStyle(
                            color: Color.fromRGBO(217, 234, 250, 1.0),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: CupertinoTextField(
                          controller: _passwordController,
                          placeholder: 'Пароль',
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromRGBO(8, 108, 201, 1.0),
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          placeholderStyle: const TextStyle(
                            color: Color.fromRGBO(217, 234, 250, 1.0),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      Container(
                        padding: const EdgeInsets.only(left: 50, right: 50),
                        width: 10,
                        child: ElevatedButton(
                          onPressed: isLoading
                              ? null
                              : () {
                                  if (_formKey.currentState!.validate()) {
                                    String email = _emailController.text;
                                    String password = _passwordController.text;

                                    setLoading(true);
                                    setErrorMessage(null);
                                    BlocProvider.of<AuthBloc>(context).add(
                                        SignInEvent(SignInDto(email, password),
                                            () {
                                      BlocProvider.of<TabsBloc>(context)
                                          .add(ChangeTabs(0));
                                      setLoading(false);
                                    }, (m) {
                                      setLoading(false);
                                      setErrorMessage(m);
                                    }));
                                  }
                                },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(217, 234, 250, 1.0),
                            ),
                            foregroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(0, 70, 150, 1),
                            ),
                            textStyle: MaterialStateProperty.all<TextStyle>(
                              const TextStyle(fontSize: 16),
                            ),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                              const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 24),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          child: Text(isLoading ? 'Загрузка...' : 'Войти'),
                        ),
                      ),
                      Positioned(
                        top: 400,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              BlocProvider.of<TabsBloc>(context)
                                  .add(ChangeTabs(2));
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Color.fromRGBO(8, 108, 201, 1.0),
                                    width: 2,
                                  ),
                                ),
                              ),
                              child: const Text(
                                'У меня еще нет аккаунта',
                                style: TextStyle(
                                  color: Color.fromRGBO(8, 108, 201, 1.0),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
