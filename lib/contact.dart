import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  final String phoneNumber = "+212601985315"; // دير رقمك هنا

  void _launchWhatsApp() async {
    final url = "https://wa.me/$phoneNumber";
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('اتصل بـ رضا للأسماك')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.contact_phone, size: 80, color: Colors.blue),
            SizedBox(height: 20),
            Text('عندك شي تساؤل؟ تواصل معانا', style: TextStyle(fontSize: 18)),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: _launchWhatsApp,
              icon: Icon(Icons.message),
              label: Text('تواصل عبر WhatsApp'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
