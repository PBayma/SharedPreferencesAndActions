import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_pref_bloc/utils/shared_preferences.dart';
import 'package:shared_pref_bloc/widgets/homepage/bloc/homepage_event.dart';
import 'package:shared_pref_bloc/widgets/homepage/bloc/homepage_state.dart';

class HomePageBloc extends Bloc<EntrarPageEvent, HomePageState> {
  HomePageBloc(HomePageState initialState) : super(initialState);

  RememberLoginData data = RememberLoginData();

  @override
  Stream<HomePageState> mapEventToState(EntrarPageEvent event) async* {
    if (event is HomePageStart) {
      try {
        yield LoadingState();
        final email = await data.getRememberedEmail();
        final password = await data.getRememberedPassword();
        yield LoadedSucessState(email, password, false);
      } catch (error) {
        yield ErrorState('Erro ao carregar página');
      }
    } else if (event is LembrarDados) {
      try {
        yield LoadingState();
        yield* _updateRememberLogIn(event);
      } catch (e) {}
    } else if (event is SalvarDados) {
      try {
        yield LoadingState();
        yield* _validadeSignIn(event);

        await Future.delayed(const Duration(seconds: 5));
        final email = await data.getRememberedEmail();
        final password = await data.getRememberedPassword();
        yield LoadedSucessState(email, password, false);
      } catch (error) {
        yield ErrorState('Erro ao salvar dados');
      }
    }
  }

  Stream<HomePageState> _updateRememberLogIn(LembrarDados event) async* {
    bool value = !event.lembrarDados;
    print(value);
    yield LoadedSucessState('', '', value);
  }

  Stream<HomePageState> _validadeSignIn(event) async* {
    String email = event.email;
    String password = event.password;

    try {
      data.setRememberEmail(email);
      data.setRememberPassword(password);
    } catch (e) {
      yield ErrorState('Erro');
    }
  }
}
