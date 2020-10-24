part of 'pages.dart';

class AccountConfirmationPage extends StatefulWidget {
  final RegistrationData registrationData;

  AccountConfirmationPage(this.registrationData);

  @override
  _AccountConfirmationPageState createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isSigningUp = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context
              .bloc<PageBloc>()
              .add(GoToPreferencePage(widget.registrationData));
          return;
        },
        child: Scaffold(
          body: Container(
            color: bgColor,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 90),
                      child: Stack(
                        children: <Widget>[
                          Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                  onTap: () {
                                    context
                                        .bloc<PageBloc>()
                                        .add(GoToSplashPage());
                                  },
                                  child: Icon(Icons.arrow_back,
                                      color: Colors.white))),
                          Center(
                            child: Text(
                              "Confirm\nNew Account",
                              style: whiteKanitFont.copyWith(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 150,
                      margin: EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image:
                                  (widget.registrationData.profileImage == null)
                                      ? AssetImage("assets/user_pic.png")
                                      : FileImage(
                                          widget.registrationData.profileImage),
                              fit: BoxFit.cover)),
                    ),
                    Text("Welcome",
                        style: whiteKanitFont.copyWith(
                            fontSize: 16, fontWeight: FontWeight.w300)),
                    Text(
                      "${widget.registrationData.name}",
                      textAlign: TextAlign.center,
                      style: whiteKanitFont.copyWith(fontSize: 24),
                    ),
                    SizedBox(height: 110),
                    (isSigningUp)
                        ? SpinKitFadingCircle(color: mutedMainColor, size: 45)
                        : SizedBox(
                            width: 250,
                            height: 45,
                            child: RaisedButton(
                                color: mainColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text("Create My Account",
                                    style:
                                        whiteKanitFont.copyWith(fontSize: 16)),
                                onPressed: () async {
                                  setState(() {
                                    isSigningUp = true;
                                  });
                                  //titipan upload image file
                                  imageFileToUpload =
                                      widget.registrationData.profileImage;

                                  SignInSignUpResult result =
                                      await AuthServices.signUp(
                                          widget.registrationData.email,
                                          widget.registrationData.password,
                                          widget.registrationData.name,
                                          widget
                                              .registrationData.selectedGenres,
                                          widget.registrationData.selectedLang);

                                  if (result.user == null) {
                                    setState(() {
                                      isSigningUp = false;
                                    });

                                    Flushbar(
                                      duration: Duration(microseconds: 1500),
                                      flushbarPosition: FlushbarPosition.TOP,
                                      backgroundColor: mainColor,
                                      message: result.message,
                                    )..show(context);
                                  }
                                }))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
