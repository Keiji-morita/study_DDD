import 'package:ddd/pages/sign_in/sign_in_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import '../../domain/user/user_repository.dart';
import '../app/states/app_notifire.dart';
import '../app/states/sign_in_state.dart';

class SignInPage extends StatelessWidget {
  const SignInPage();

// wrapped()はbuild()よりも先に処理が走ります。
  static Widget wrapped() {
  // ここで使いたいnotifierをMultiProviderで包んで宣言します。
    return MultiProvider(
      providers: [
        StateNotifierProvider<SignInNotifier, SignInState>(
          create: (context) => SignInNotifier(
            repository: context.read<UserRepository>(),
            service: context.read<UserService>(),
            appNotifier: context.read<AppNotifier>(),
          ),
          child: const SignInPage(),
        ),
      ],
      child: const SignInPage(),
    );
  }
  
 // これより以下は元々あるコード等です。
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Instagram',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12.0),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Username'),
                      validator: (value) => value!.trim().isEmpty
                          ? 'Please enter a valid username.'
                          : null,
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Email'),
                      validator: (value) => value!.contains('@')
                          ? null
                          : 'Please enter a valid email.',
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Password'),
                      obscureText: true,
                      validator: (value) => value!.length < 6
                          ? 'Must be at least 6 characters.'
                          : null,
                    ),
                    const SizedBox(height: 28.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 1.0,
                        textStyle: TextStyle(
                          color: Colors.white,
                          backgroundColor: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: const Text('Sign Up'),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          }
                        }
                        )
                      ],
                      ),
                    )
                    )
              
                  )
              
                )
            
              )
              
          );
                      
                      }
                    
                    
                  // const SizedBox(height: 12.0),
                  
            
  }
  