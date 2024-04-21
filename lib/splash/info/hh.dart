import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CompanyInfo extends StatelessWidget {
  const CompanyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff061428),
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _textStyle('Elon Mask', 25),
            _textStyle('Elon Mask', 15),
            const SizedBox(height: 35),
            Row(
              children: [
                Expanded(child: _buildInfoColumn('8000', 'employees')),
                Expanded(child: _buildInfoColumn('3', 'launch')),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _iconButton(FontAwesomeIcons.twitter),
                _iconButton(FontAwesomeIcons.globe),
              ],
            ),
            const SizedBox(height: 25),
            Image.asset('assets/elon_mask.png'),
          ],
        ),
      ),
    );
  }

  _buildInfoColumn(String value, String label) {
    return Column(
      children: [
        _textStyle(value, 25),
        _textStyle(label, 12),
      ],
    );
  }
}

_appBar() {
  return AppBar(
    backgroundColor: Colors.transparent,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _textStyle('SpaceX', 20),
        _iconButton(FontAwesomeIcons.info, color: Colors.yellow),
      ],
    ),
  );
}

_iconButton(IconData icon, {Color color = Colors.white}) {
  return IconButton(
    icon: FaIcon(
      icon,
      color: color,
    ),
    onPressed: () {},
  );
}

_textStyle(String text, double fontSize, {Color color = Colors.white}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
    ),
  );
}