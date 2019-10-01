import 'package:flutter/material.dart';
import 'Authentication.dart';

class LoginRegisterPage extends StatefulWidget // StatefulWidget 
{
  LoginRegisterPage({
    this.auth,
    this.onSignedIn, onSignedOut,
  });
  final AuthImplementaion auth;
  final VoidCallback onSignedIn;
  State<StatefulWidget> createState()
  {
    return _LoginRegisterState();
  }

}
enum FormType
{
  login,
  register
}

class _LoginRegisterState extends State<LoginRegisterPage>
{
  final formkey = new GlobalKey<FormState>();
  FormType _formType = FormType.login;
  String _email = "";
  String _password = "";
  //methods
  bool validateAndSave()
  {
    final form = formkey.currentState;
    if(form.validate())
    {
      form.save();
      return true;
    }
    else
    {
      return false;
  
    }
  }

 void validateAndSubmit() async
 {
   if(validateAndSave())
   {
     try
     {
        if(_formType == FormType.login)
        {
              String userId = await widget.auth.SignIn(_email, _password);
              print("Login UserID  =" + userId);
        }
        else
        {
                 String userId = await widget.auth.SignUp(_email, _password);
              print("Register UserID  =" + userId);
        }
        widget.onSignedIn();
     }
     catch(e)
     {  
       print("Error =" + e.toString());

     }
   }

 }
void moveToRegister()
{
  formkey.currentState.reset();
  setState(() {
    _formType = FormType.register;
  });
}

void moveToLogin()
{
  formkey.currentState.reset();
  setState(() {
    _formType =FormType.login;
  });
}
  //DESİGN
  @override
  Widget build(BuildContext context) {
    return new Scaffold
    (
      appBar: new AppBar
      (
        title : new Text("Public For iett",style: TextStyle(color: Colors.white)),
      ),
      body: new Container(
        margin: EdgeInsets.all(15.0),
        child: new Form(
          key: formkey,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: createInputs() + createButtons(),
          ),
        ),
      ),
      );
  }

  List<Widget> createInputs()
  {
    return [
      SizedBox(height: 10.0,),
        logo(),
              SizedBox(height: 20.0,),
      new TextFormField
      (
        decoration: new InputDecoration(labelText: "Email adresinizi giriniz"),
        validator: (value){
          return value.isEmpty ? 'Email Gereklidir' : null;
        },
        onSaved: (value)
        {
          return _email = value;
        },
      ),
      SizedBox(height: 10.0,),
      new TextFormField
      (
        decoration: new InputDecoration(labelText: "Şifrenizi giriniz"),
        obscureText: true,
          validator: (value){
          return value.isEmpty ? 'Şifre Gereklidir' : null;
        },
        onSaved: (value)
        {
          return _password = value;
        },
      ),
    SizedBox(height: 20.0,)

    ];
  }

  Widget logo()
{
  return new Hero(
    tag: 'hero',
    child: new CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 110.0,
      child: Image.asset('images/IETT.png')
    ),
  );
}
  List<Widget> createButtons()
  {
    if(_formType == FormType.login)
    {
      return [
          new RaisedButton(
            child: new Text("Giriş Yap", style: new TextStyle(fontSize: 20.0)),
            textColor: Colors.white,
            color: Colors.orange,
          onPressed: validateAndSubmit,
          ),
   new FlatButton
          (
            child: new Text("Hala bir hesabın yok mu? Hadi kayıt ol", style: new TextStyle(fontSize: 14.0, color: Colors.orange)),
            textColor: Colors.white,
            onPressed: moveToRegister,
          ),
    ];
    } //İf end
    else {
      return [
          new RaisedButton(
            child: new Text("Hesap Aç", style: new TextStyle(fontSize: 20.0)),
            textColor: Colors.white,
            color: Colors.orange,
          onPressed: validateAndSubmit,
          ),
   new FlatButton
          (
            child: new Text("Hesabın var mı ? Giriş yap" , style: new TextStyle(fontSize: 14.0, color: Colors.orange)),
            textColor: Colors.white,
            onPressed: moveToLogin,
          ),
    ];
    }
  }
  
}