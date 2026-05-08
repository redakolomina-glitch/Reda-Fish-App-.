# مشروع تطبيق رضا فيش (Reda Fish)

لقد تم تجميع الكود البرمجي المحدث مع تعليمات دمج الصورة.

## 1. الكود البرمجي (main.dart)

```dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
    ));

class HomeScreen extends StatelessWidget {
  final String phone = "212601985315";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000B18), // لون خلفية داكن يتناسب مع الشعار
      appBar: AppBar(
        title: Text("Reda Fish - رضا فيش"),
        backgroundColor: Color(0xFF0D47A1),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              // عرض الشعار
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/logo.png', // تأكد من إضافة الصورة في ملف pubspec.yaml
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => 
                      Icon(Icons.set_meal, size: 150, color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text(
                "مرحباً بك في تطبيق رضا فيش",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Text(
                "أجود أنواع الأسماك الطرية تصلك إلى باب منزلك",
                style: TextStyle(fontSize: 16, color: Colors.blueGrey[100]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: ElevatedButton.icon(
                  icon: Icon(Icons.shopping_cart, color: Colors.white),
                  label: Text(
                    "اطلب الحوت عبر الواتساب",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () async {
                    var whatsappUrl = "whatsapp://send?phone=$phone&text=السلام عليكم، بغيت نطلب الحوت";
                    var uri = Uri.parse(whatsappUrl);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      var webUrl = "https://wa.me/$phone?text=السلام عليكم، بغيت نطلب الحوت";
                      await launchUrl(Uri.parse(webUrl), mode: LaunchMode.externalApplication);
                    }
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

```

## 2. كيفية إضافة الصورة:
1. قم بإنشاء مجلد باسم `assets` في مشروعك.
2. ضع الصورة المرفقة داخل المجلد وقم بتسميتها `logo.png`.
3. افتح ملف `pubspec.yaml` وأضف الأسطر التالية:
```yaml
flutter:
  assets:
    - assets/logo.png
```

## 3. ملاحظات إضافية:
- تأكد من تثبيت مكتبة `url_launcher` عبر الأمر: `flutter pub add url_launcher`.
- الكود يدعم فتح الواتساب مباشرة أو عبر المتصفح في حال عدم توفر التطبيق.
