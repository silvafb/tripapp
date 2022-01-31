abstract class EndPoints {
  String get loginauthentication;
  String get searchOrder;
}

class EndPointsImp implements EndPoints {

  static const _mainURL = "";

  @override
  String get loginauthentication => "$_mainURL/api/usuario/login";

  @override
  String get searchOrder => "$_mainURL/api/pedido";
}