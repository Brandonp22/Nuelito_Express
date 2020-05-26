import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../pages/myaccountspage.dart';
import '../pages/homepage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
}

abstract class NavigationStates{}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates>{
  final FirebaseUser user;
  NavigationBloc(this.user);

  @override
  NavigationStates get initialState => HomePage(user: user);

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage(user: user);
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield MyAccountsPage(user: user);
        break;
    }
  }
}

