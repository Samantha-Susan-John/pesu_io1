import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pesu_io1/models/student.dart';
import 'package:pesu_io1/screens/input.dart';
import 'package:pesu_io1/screens/profile/profile.dart';

import '../../redux/store.dart';

class Landing extends StatefulWidget {
  static const routeName = '/';
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  List<Student> students = [
    Student(name: 'Sam', srn: 'PES2UG21CS463', phoneNo: '9916199772'),
    Student(name: 'Susan', srn: 'PES2UG21CS463', phoneNo: '9916199772'),
    Student(name: 'John', srn: 'PES2UG21CS463', phoneNo: '9916199772')
  ];

  late BuildContext appStateContext;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        appStateContext = context;
        return Scaffold(
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.05,
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ),
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: [
                  Image.asset(
                    '/assets/images/abstract_art.png',
                    height: MediaQuery.of(context).size.width * 0.5,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  ...state.students!
                      .map(
                    //...students.map(
                        (fun) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Profile(
                              name: fun.name,
                              srn: fun.srn,
                              phoneNo: fun.phoneNo,
                            ),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(fun.name),
                        subtitle: Text(fun.srn),
                        trailing: FaIcon(
                          FontAwesomeIcons.user,
                        ),
                      ),
                    ),
                  )
                      .toList(),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //Navigator.pushNamed(context, Input.routeName);
              Navigator.pushReplacementNamed(context, Input.routeName);
            },
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}

// StoreConnector(
// converter: (store) => store.state,
// builder: (context, state) {
// return ;
// },
// )