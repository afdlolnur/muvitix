part of 'pages.dart';

class Moviepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //note: header
        Container(
            decoration: BoxDecoration(
                color: mutedbgColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 20),
            child: BlocBuilder<UserBloc, UserState>(
              builder: (_, userState) {
                if (userState is UserLoaded) {
                  return Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xFF5F5588), width: 1),
                        ),
                        child: Stack(
                          children: <Widget>[
                            SpinKitFadingCircle(
                              color: mutedMainColor,
                              size: 50,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: (userState.user.profilePicture == "" 
                                  ? AssetImage("assets/user_pic.png") 
                                  : NetworkImage(
                                    userState.user.profilePicture)),
                                    fit: BoxFit.cover)
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Text("data"),
                          Text("data"),
                        ],
                      )
                    ],
                  );
                } else {
                  return SpinKitFadingCircle(
                    color: mutedMainColor,
                    size: 50,
                  );
                }
              },
            ))
      ],
    );
  }
}
