import 'package:flutter/material.dart';
import 'package:test/splash/api/api_service.dart';
import 'package:test/splash/api/models.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SpaceX Company Info'),
      ),
      body: Center(
        child: FutureBuilder<CompanyInfor?>(
          future: getCompanyInfo(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final companyInfo = snapshot.data!;
              return Column(
                children: [
                  Text(
                    companyInfo.name ?? 'Company Name Unavailable',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  Text('CEO: ${companyInfo.ceo ?? 'N/A'}'),
                  Text('Founded: ${companyInfo.founded}'),
                  // ... Add more widgets to display other info
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            // Display a loading indicator while fetching data
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}