# تطبيق Dio - واجهة تسجيل الدخول

مشروع Flutter لواجهة تسجيل الدخول الظاهرة في الصورة، بألوان الهوية الأبيض والأحمر.

## محتويات المشروع

```text
dio_app/
├── .github/
│   └── workflows/
│       └── build-apk.yml
├── assets/
│   └── images/
│       └── dio_logo.png
├── lib/
│   ├── main.dart
│   └── screens/
│       └── login_screen.dart
├── .gitignore
├── pubspec.yaml
└── README.md
```

## البيانات الأساسية

- اسم المشروع: `dio_app`
- اسم التطبيق الظاهر: `Dio`
- لغة البرمجة: Dart
- إطار العمل: Flutter
- رقم الإصدار: `1.0.0+1`
- معرف Android الذي ينشئه مسار البناء: `com.dio.dio_app`
- ملف الشعار: `assets/images/dio_logo.png`

## تشغيل المشروع محلياً

ثبّت Flutter وAndroid Studio، ثم افتح الطرفية داخل مجلد المشروع ونفّذ:

```bash
flutter create --platforms=android --org com.dio --project-name dio_app .
flutter pub get
flutter run
```

## إنشاء APK محلياً

```bash
flutter build apk --release
```

ستجد ملف التطبيق بعد نجاح البناء في:

```text
build/app/outputs/flutter-apk/app-release.apk
```

## البناء من GitHub

1. أنشئ مستودعاً جديداً في GitHub.
2. ارفع جميع ملفات هذا المشروع إلى المستودع، وتأكد أن ملف `pubspec.yaml` في الجذر.
3. اجعل اسم الفرع الأساسي `main`.
4. افتح تبويب **Actions** في GitHub.
5. سيبدأ البناء تلقائياً بعد رفع الملفات إلى `main`، ويمكنك أيضاً تشغيل **Build Dio APK** يدوياً.
6. بعد انتهاء المهمة بنجاح، افتح تشغيل البناء ثم قسم **Artifacts** ونزّل `Dio-Android-APK`.

## ملاحظة مهمة عن تسجيل الدخول

الواجهة تتحقق من أن اسم المستخدم وكلمة المرور غير فارغين فقط. لم يتم ربطها بخادم أو قاعدة بيانات، لذلك لن تتحقق من الحسابات بعد. لتفعيل الدخول الحقيقي، يلزم تزويد المشروع بعنوان API وطريقة المصادقة المطلوبة، ثم ربطها بدالة `_login()` في الملف:

`lib/screens/login_screen.dart`
