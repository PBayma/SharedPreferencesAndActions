import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_pref_bloc/widgets/homepage/bloc/homepage_bloc.dart';
import 'package:shared_pref_bloc/widgets/homepage/bloc/homepage_event.dart';
import 'package:shared_pref_bloc/widgets/homepage/bloc/homepage_state.dart';

class HomePage extends StatelessWidget {
  final HomePageBloc _bloc = HomePageBloc(EmptyState());
  final bool rememberData = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  HomePage() {
    _bloc.add(HomePageStart());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testando'),
      ),
      body: Center(
        child: BlocBuilder(
            bloc: _bloc,
            builder: (context, state) {
              if (state is LoadedSucessState) {
                _email.text = state.email;
                _password.text = state.password;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${state.email}',
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: _email,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        controller: _password,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          print(_email.text);
                          print(_password.text);
                          _bloc.add(SalvarDados(_email.text, _password.text));
                        },
                        child: Text('Salvar dados')),
                    SizedBox(height: 10),
                    Checkbox(
                        value: rememberData,
                        onChanged: (value) =>
                            _bloc.add(LembrarDados(rememberData)))
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
