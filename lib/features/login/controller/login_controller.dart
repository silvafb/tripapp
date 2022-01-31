import 'package:flutter/material.dart';

import '/features/login/repositories/login_repository.dart';

import '/core/state/app_state.dart';

import '/infra/cache/local_storage_imp.dart';

abstract class LoginController extends ChangeNotifier {
  String get email;
  String get password;
  void onChange({String? email, String? password});
  bool validate();
  Future<void> login();
  void update(AppState state);
  AppState get appState;
  GlobalKey<FormState> get formKey;
}

class LoginControllerImp extends ChangeNotifier implements LoginController{
  AppState _state = AppState.empty();
  static final _formKey = GlobalKey<FormState>();
  LoginRepository loginRepository;
  String _email = "";
  String _password = "";
  TextEditingController loginTextController = TextEditingController();
  final localStorage = LocalStorageImp();

  LoginControllerImp(LoginRepository this.loginRepository);

  Future<void> loadingUserStorage() async {
    final Map<String, dynamic> result = await localStorage.getStorageMap('lastlogin');
    Map<String, dynamic>? userMap = result == {} ? null : result;
    if(userMap!["login"] != null){
      loginTextController.text = userMap["login"];
      _email = userMap["login"];
    }
  }

  @override
  GlobalKey<FormState> get formKey => _formKey;

  @override
  String get email => _email;

  @override
  String get password => _password;

  @override
  AppState get appState => _state;

  @override
  Future<void> login() async {
    update(AppState.loading());
    await Future.delayed(Duration(seconds: 1));
    update(AppState.success<Map<String, dynamic>>({}));
    await localStorage.setStorageMap('user', {});
    // if (validate()) {
    //   try {
    //     update(AppState.loading());
    //     final response = await loginRepository.authentication(login: _email, password: _password);
    //     update(AppState.success<Map<String, dynamic>>(response));
    //     await localStorage.setStorageMap('user', response);
    //   } on HttpError catch (e) {
    //     update(AppState.error("Não foi possível realizar login $e"));
    //   }
    // }
  }

  @override
  void update(AppState state) {
    _state = state;
    notifyListeners();
  }

  @override
  void onChange({String? email, String? password}) {
    _email = email ?? _email;
    _password = password ?? _password;
  }

  @override
  bool validate() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}