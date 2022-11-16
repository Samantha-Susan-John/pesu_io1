import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  static const routeName='/profile';
  final String name;
  final String srn;
  Profile({Key? key, required this.name, required this.srn}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String phoneNo= '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.25,0.0,0.0,0.0),
          color: Colors.white,
          width: MediaQuery.of(context).size.width,    //or use width: double.infinity but not prefered
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'PESU',
                style: TextStyle(fontSize: 36.0, fontFamily: 'EB Garamond', color: Colors.blueGrey[700], ),
              ),
              Image.asset(
                '/assets/images/abstract_art.png',
                height: 200.0,
                width: 200.0,
              ),
              Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 26.0,
                    color: Color(0xff7A99AE),
                    fontFamily: 'EB Garamond',
                  )

              ),
              Container(
                margin: EdgeInsets, fromTRB(30.0, 0.0, 20.0, 0.0),
                color: Colors.red,
                child: Text(
                    widget.srn,
                    style: TextStyle(
                      fontSize: 26.0,
                      color: Color(0xff7A99AE),
                      fontFamily: 'EB Garamond',
                    )
                ),
              ),
              // Text(
              //     '9916199772',
              //     style: TextStyle(
              //       fontSize: 26.0,
              //       color: Color(0xff7A99AE),
              //       fontFamily: 'EB Garamond',
              //     )
              // ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.1,vertical: 0.0),
                child: TextField(
                  onChanged:(val){
                    setState(() {
                      phoneNo= val;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'please enter phone no.',
                    //focusedBorder:
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  print('Present');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[200],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text('Present'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}