import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ghmedic/bloc.dart';
import 'package:ghmedic/empleado.dart';
import 'package:ghmedic/textstyles.dart';
import 'package:ghmedic/utils.dart';

class UserApiProvider {
  final String _endpoint = "http://erpghmedic.com.mx/flutter/";
  final Dio _dio = Dio();

  Future<Empleado> getData() async {
    try {
      Response response = await _dio.get(_endpoint);
      return Empleado.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      // return Empleado.withError("$error");<>>>>>>>>//
    }
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder(
                stream: bloc.subject.stream,
                builder: (context, AsyncSnapshot<Empleado> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.error != null) {
                      return Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Error occured: ${snapshot.error}",
                            style: germanico,
                          ),
                        ],
                      ));
                    }
                    return Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(snapshot.error),
                      ],
                    ));
                  } else if (snapshot.hasError) {
                    return Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Error occured: ${snapshot.error}"),
                      ],
                    ));
                  } else {
                    return Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Loading data from API..."),
                        CircularProgressIndicator(
                          backgroundColor: primaryColor,
                        )
                      ],
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        splashColor: Colors.white,
        backgroundColor: primaryColor,
        child: Icon(Icons.person_add),
      ),
    );
  }
}

class PersonCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -160,
            right: -120,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(160))),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
