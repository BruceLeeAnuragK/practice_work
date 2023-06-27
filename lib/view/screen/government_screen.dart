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
    List Services = [
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
          "https://services.india.gov.in/service/listing?cat_id=14&ln=en" // Science IT and Comunication
          "https://services.india.gov.in/service/listing?cat_id=13&ln=en" // Youth Sport Culture
    ];
    List Service_Name = [
      "Birth Service",
      "Education Service",
      "Health and Wealth Service",
      "Tax and Money Service",
      "Job Service",
      "Justice, Law Service",
      "Travel and Tourism Service",
      "Buisness and Self-Employeed Service",
      "Pension and Benefits Service",
      "Transport and Infrastucture Service",
      "Citizenship, Passport Service",
      "Agriculture and Rural Environmment",
      "Science IT and Communication",
      "Youth Sport Culture"
    ];
    List Services_Images = [
      "https://services.india.gov.in/uploads/category/banners/07199cc2f6fea88e_educationandlearning.jpg",
      "https://images.livemint.com/rf/Image-621x414/LiveMint/Period2/2018/12/18/Photos/Processed/school-kTNE--621x414@LiveMint.jpg",
      "https://www.india.gov.in/sites/upload_files/npi/files/spotlights/jan-dhan-yojna-inner-new.jpg",
      "https://blog.saginfotech.com/wp-content/uploads/2017/08/Tax-for-July.jpg",
      "https://english.cdn.zeenews.com/sites/default/files/styles/zm_700x400/public/2022/08/09/1075513-1178252-pjimage.jpg",
      "https://blog.ipleaders.in/wp-content/uploads/2019/10/Judiciary_logo.jpg",
      "https://images.hindustantimes.com/rf/image_size_630x354/HT/p2/2020/10/02/Pictures/_25991394-048a-11eb-b559-b799cd4220ef.jpg",
      "https://services.india.gov.in/assets/images/sabka-saath.jpg",
      "https://www.india.gov.in/sites/upload_files/npi/files/spotlights/pension-fund-new.jpg",
      "https://www.insightssuccess.in/wp-content/uploads/2017/11/Web-Img-For-news-Development-in-Indian-Transport.jpg",
      "https://www.india.gov.in/sites/upload_files/npi/files/spotlights/passport_seva01.jpg",
      "https://www.theindiaforum.in/sites/default/files/field/image/2022/06/21/ramkumar-radhakrishnan-wikimedia-1622193304-1622193304.jpeg",
      "https://indianpsu.com/wp-content/uploads/2022/06/5G-2.jpeg",
      "https://studywrap.com/wp-content/uploads/2020/02/Ministry-of-Youth-Affairs-and-Sports.jpg",
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Government Services",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
          itemCount: Service_Name.length,
          itemBuilder: (context, i) {
            return Card(
              child: ListTile(
                onTap: () {},
                leading: CircleAvatar(
                  radius: 30,
                  foregroundImage: NetworkImage(Services_Images[i]),
                ),
                title: Text(Service_Name[i]),
                trailing: IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.brown,
                    ),
                    onPressed: () {}),
              ),
            );
          }),
    );
  }
}
