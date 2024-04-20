import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                const SizedBox(height: 20.0),
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
                      SizedBox(height: 16.0),
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
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // Валидация успешна, можно выполнить действие по регистрации
                              // Можно отправить данные на сервер или выполнить другие действия
                              // Например, Navigator.push для перехода на другую страницу
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
                          child: const Text('Войти'),
                        ),
                      ),
                      Positioned(
                        top: 400,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              // Действие, которое происходит при нажатии на кнопку
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
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
