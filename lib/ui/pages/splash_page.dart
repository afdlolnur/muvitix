part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/logo.png"))),
                ),
                Container(
                  margin: EdgeInsets.only(top: 70, bottom: 10),
                  child: Text(
                    "New Experience",
                    style: whiteKanitFont.copyWith(fontSize: 20),
                  ),
                ),
                Text(
                  "Watch a new movie much\neasier than any before",
                  style: greyKanitFont.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
                Container(
                    width: 250,
                    height: 46,
                    margin: EdgeInsets.only(top: 70, bottom: 19),
                    child: RaisedButton(
                        child: Text(
                          "Get Started",
                          style: whiteKanitFont.copyWith(
                            fontSize: 16,
                          ),
                        ),
                        color: mainColor,
                        onPressed: () {
                          context.bloc<PageBloc>().add(GoToRegistrationPage(RegistrationData()));
                        })),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account?",
                        style: greyKanitFont.copyWith(
                            fontWeight: FontWeight.w300)),
                    GestureDetector(
                        onTap: () {
                          context.bloc<PageBloc>().add(GoToLoginPage());
                        },
                        child: Text(" Sign In", style: pinkKanitFont)
                    ),
                  ],
                )
              ],
            )));
  }
}
