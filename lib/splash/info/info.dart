import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:test/splash/info/constants/colors.dart';

class CompanyInfo extends StatelessWidget {
  const CompanyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'SpaceX',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.info,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildHeaderText('Elon Mask', 35),
              _buildHeaderText('CEO of SpaceX', 15),
              SizedBox(height: 35),
              Row(
                children: [
                  Expanded(child: _buildInfoColumn('8000', 'employees')),
                  Expanded(child: _buildInfoColumn('3', 'launch')),
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.globe, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 25),
              Image.asset('assets/elon_mask.png'),
            ],
          ),
        ));
  }

  Widget _buildHeaderText(String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: fontSize),
    );
  }

  Widget _buildInfoColumn(String value, String label) {
    return Column(
      children: [
        Text(value, style: TextStyle(color: Colors.white, fontSize: 25)),
        Text(label, style: TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
      // SingleChildScrollView(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       const Text(
      //         'Elon mask',
      //         style: TextStyle(color: Colors.white, fontSize: 35),
      //       ),
      //       const Text(
      //         'ceo of spacex',
      //         style: TextStyle(color: Colors.white, fontSize: 15),
      //       ),
      //       const SizedBox(
      //         height: 35,
      //       ),
      //       const Row(
      //         children: [
      //           Expanded(
      //             child: Column(
      //               children: [
      //                 Text(
      //                   '8000',
      //                   style: TextStyle(color: Colors.white, fontSize: 25),
      //                 ),
      //                 Text(
      //                   'employees',
      //                   style: TextStyle(color: Colors.white, fontSize: 12),
      //                 ),
      //               ],
      //             ),
      //           ), Expanded(
      //             child: Column(
      //               children: [
      //                 Text(
      //                   '3',
      //                   style: TextStyle(color: Colors.white, fontSize: 25),
      //                 ),
      //                 Text(
      //                   'launch',
      //                   style: TextStyle(color: Colors.white, fontSize: 12),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Expanded(
      //             child: Column(
      //               children: [
      //                 Text(
      //                   '2002',
      //                   style: TextStyle(color: Colors.white, fontSize: 25),
      //                 ),
      //                 Text(
      //                   'founded',
      //                   style: TextStyle(color: Colors.white, fontSize: 12),
      //                 ),
      //               ],
      //             ),
      //           ),
               
      //         ],
      //       ),
      //       const SizedBox(
      //         height: 30,
      //       ),
      //       // Row(
      //       //   mainAxisAlignment: MainAxisAlignment.center,
      //       //   children: [
      //       //     IconButton(
      //       //         icon: const FaIcon(
      //       //           FontAwesomeIcons.twitter,
      //       //           color: Colors.white,
      //       //         ),
      //       //         onPressed: () {
      //       //         }),
      //       //     IconButton(
      //       //         icon: const FaIcon(
      //       //           FontAwesomeIcons.globe,
      //       //           color: Colors.white,
      //       //         ),
      //       //         onPressed: () {
      //       //         }),
      //       //     IconButton(
      //       //         icon: const FaIcon(
      //       //           FontAwesomeIcons.flickr,
      //       //           color: Colors.white,
      //       //         ),
      //       //         onPressed: () {
      //       //         }),
      //       //   ],
      //       // ),
      //       const SizedBox(
      //         height: 25,
      //       ),
      //       Image.asset('assests/elon_mask.png')
      //     ],
      //   ),
      // ),
//     );
//   }
// }
