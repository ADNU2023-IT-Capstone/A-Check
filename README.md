# A-Check

Github repository for fulfilling the requirements of IT Capstone Project 2.

This is a Flutter project specifically made for Android. It is an offline attendance management system with face recognition feature (thanks to MobileFaceNet) for checking attendance.

## Project Members
- Samantha Mae De Las Nieves
- Alejandro Miguel Monge
- Aaron Serrano

## Dependencies

[**Hive**](https://github.com/isar/hive)  
Hive is used as the app's database management. It is a No-SQL key-value database.

[**Google ML Kit for Flutter**](https://github.com/flutter-ml/google_ml_kit_flutter)  
Google ML Kit is used for face detection.

[**Tensorflow Lite**](https://github.com/tensorflow/flutter-tflite)  
Tensorflow Lite is used as the machine-learning interpreter to run MobileFaceNet. It is a version of Tensorflow that is focused on running in mobile devices.

[**MobileFaceNet**](https://arxiv.org/abs/1804.07573)  
MobileFaceNet is the model used in Tensorflow Lite to run face recognition in the app.