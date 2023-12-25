import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_app/cubits/user_login/user_login_cubit.dart'; // Import the UserLoginCubit

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserLoginCubit(),
      child: LoginView(),
    );
  }
}

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocConsumer<UserLoginCubit, UserLoginState>(
        listener: (context, state) {
          // Handle state changes here, such as navigation based on success
          if (state is UserLoginSuccess) {
            Navigator.of(context).pushReplacementNamed('/home');
          } else if (state is UserLoginFailure) {
            // Display an error message to the user
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login Failed: ${state.errorMessage}'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          // Build the UI based on the current state
          if (state is UserLoginLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return LoginForm();
          }
        },
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: context.read<UserLoginCubit>().emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: context.read<UserLoginCubit>().passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              context.read<UserLoginCubit>().validate();
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
