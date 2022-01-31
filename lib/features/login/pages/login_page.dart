import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:validators/validators.dart';

import '/core/theme/app_theme.dart';
import '/core/widgets/custom_button_outline_widget.dart';
import '/core/widgets/custom_button_widget.dart';
import '/core/widgets/custom_input_widget.dart';
import '/core/widgets/error_bottomsheet.dart';
import '/core/widgets/loading_widget.dart';

import '/features/login/controller/login_controller.dart';
import '/features/login/repositories/login_repository.dart';

import '/infra/cache/local_storage_imp.dart';
import '/infra/http/http_imp.dart';

class LoginAuthenticationPage extends StatefulWidget {
  const LoginAuthenticationPage({ Key? key }) : super(key: key);

  @override
  _LoginAuthenticationPageState createState() => _LoginAuthenticationPageState();
}

class _LoginAuthenticationPageState extends State<LoginAuthenticationPage> {

  final loginController = LoginControllerImp(
    loginRepository: LoginRepositoryImp(
      httpClient: HttpClientImp(),
    )
  );

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final localStorage = LocalStorageImp();
  bool obscurePassword = true;
  String? user;

  changeObscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  @override
  void initState() {
    loginController.loadingUserStorage();
    loginController.addListener(() {
      loginController.appState.when(
        success: (data) {
          Navigator.pushNamed(context, '/details');
          localStorage.setItem('lastlogin', 'login', loginController.email);
        },
        error: (message, _) => showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.r),
              topRight: Radius.circular(32.r),
            ),
          ),
          builder: (context) => ErrorBottomSheet(labelError: "E-mail ou senha incorretos."),
        ),
        orElse: () {},
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    loginController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 29.0),
          child: SingleChildScrollView(
            child: Form(
              key: loginController.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50, bottom: 50),
                    child: Center(
                      child: Text("Logo", style: TextStyle(fontSize: 40),)
                    ),
                  ),
                  CustomInputWidget(
                    label: "E-mail",
                    hintText: "Digite seu email",
                    controller: loginController.loginTextController,
                    validator: (value) => value != '' ?  null : "Digite um e-mail válido",
                    onChanged: (value) => loginController.onChange(email: value),
                  ),
                  SizedBox(height: 22.0),
                  CustomInputWidget(
                    label: "Senha",
                    hintText: "Digite sua senha",
                    validator: (value) => isLength(value ?? "", 3) ? null : "Digite uma senha mais forte",
                    obscure: obscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscurePassword ? Icons.visibility : Icons.visibility_off,
                        color: AppTheme.colors.iconInactive,
                      ),
                      onPressed: () => changeObscurePassword(),
                    ),
                    onChanged: (value) => loginController.onChange(password: value),
                  ),
                  SizedBox(height: 18.0),
                  AnimatedBuilder(
                    animation: loginController,
                    builder: (context, _) => loginController.appState.when(
                      loading: () => const LoadingComponent(),
                      orElse: () => CustomButtonWidget(
                        label: "Entrar",
                        onTap: () {
                          loginController.login();
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 58.0),
                  CustomButtonOutlineWidget(
                    label: "Criar uma conta",
                    onTap: (){},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}