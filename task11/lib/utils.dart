import 'package:flutter/material.dart';

abstract class TestAppColors {  
  static const secondary = Color(0xFFBA68C8);  
  static const icon = Colors.white;  
  static const textMe = Color(0xff222222);
  static const textAboutMe = Colors.white;
  static const secondaryText = Colors.grey;  
  static const avatarBorder = Colors.white24;  
  static final shadow = Colors.black.withOpacity(0.1);  
}  

abstract class TestAppStrings {  
  static const aboutMeTitle = "О себе";
  static const aboutMeInfo = "27 лет, разработчик встраиваемых систем";
  static const interestTitle = "Увлечения";
  static const interestInfo = "спорт, фотография, стартапы";
  static const expTitle = "Опыт в разработке";
  static const expInfo = """4 года разработки ПО для микроконтроллеров STM32, ESP32, NRF, GD32, FreeRTOS, Zephyr, Bluetooth (Mesh), интерфейсы связи (SPI, UART, I2C, CAN)""";
}  

abstract class TestAppMocks {  
  static const name = 'Больщиков Виталий\nАндреевич';  
  static const status = 'Я бы рассказал Вам анекдот про UDP, но он до Вас не дойдет';  
  static const avatarPath =  
      'assets/images/me.jpg'; 
  static const iconAboutPath =
      'assets/images/ufo.svg';
  static const iconInterestsPath = 
      'assets/images/star.svg';
  static const iconExperiencePath = 
    'assets/images/rocket.svg';
  
}  