import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class GovernmentScreen extends StatefulWidget {
  const GovernmentScreen({Key? key}) : super(key: key);

  @override
  State<GovernmentScreen> createState() => _GovernmentScreenState();
}

class _GovernmentScreenState extends State<GovernmentScreen> {
  @override
  Widget build(BuildContext context) {
    List Services =[
      "https://services.india.gov.in/service/listing?cat_id=4&ln=en" //birth service
      "https://services.india.gov.in/service/listing?cat_id=1&ln=en" //Education Service
      "https://services.india.gov.in/service/listing?cat_id=5&ln=en" //Health and Wealth Service
      "https://services.india.gov.in/service/listing?cat_id=7&ln=en" // Tax and Money Services
      "https://services.india.gov.in/service/listing?cat_id=2&ln=en" // Job Services
      "https://services.india.gov.in/service/listing?cat_id=10&ln=en" // Justice Law services
      "https://services.india.gov.in/service/listing?cat_id=6&ln=en" // Travel and Tourism Services
      "https://services.india.gov.in/service/listing?cat_id=16&ln=en" // buisness and self-employeed services
      "https://services.india.gov.in/service/listing?cat_id=8&ln=en" // pension and benefits services
      "https://services.india.gov.in/service/listing?cat_id=9&ln=en" // Transport and Infrastructure
      "https://services.india.gov.in/service/listing?cat_id=11&ln=en" // Citizenship, passport services
      "https://services.india.gov.in/service/listing?cat_id=12&ln=en" // Agriculture and Rural Environment
      "https://services.india.gov.in/service/listing?cat_id=14&ln=en"  // Science IT and Comunication
      "https://services.india.gov.in/service/listing?cat_id=13&ln=en" // Youth Sport Culture
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("List Of Government",style: TextStyle(
          fontSize:25,
          fontWeight: FontWeight.bold,
          color: Colors.brown,
        ),
        ),
      ),
      body: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, i) {
        return Card(
          child: ListTile(
            onTap: () {

            },
            leading: CircleAvatar(
              radius: 30,

            ),
            title: Text(""),
            subtitle: Text("+91 "),
            trailing: IconButton(
                icon: Icon(
                  Icons.phone,
                  color: Colors.green,
                ),
                onPressed: () {}
            ),
          ),
        );
      }
      ),
    );
  }
}
