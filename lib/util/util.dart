import 'package:intl/intl.dart';

class ClimataUtil {
  String getFormattedCurrentDate() {
    DateTime currentUnformattedDate = DateTime.now();
    return DateFormat.yMMMMEEEEd().format(currentUnformattedDate);
  }

  static String formatProviderDate(String providedDate) {
    DateTime inputDateTime = DateFormat("yyyy-MM-dd'T'hh:mm:ss").parse(providedDate);

    return DateFormat("hh:mm a").format(inputDateTime);
  }

  static String getWeatherDescription(int? weatherCode, bool? isDay) {
    if (weatherCode == null || isDay == null) return "-";
    String meridian = (isDay == true ? "day" : "night");

    if (weatherCode < 230) {
      return 'Its a $meridian of thunderstorm with light rain';
    } else if (weatherCode < 300) {
      return '$meridian of thunders';
    } else if (weatherCode < 500) {
      return 'Its a drizzly $meridian';
    } else if (weatherCode == 501) {
      return 'Its a rainy $meridian, take an umbrella with you';
    } else if (weatherCode < 511) {
      return '$meridian with heavy rain, don\'t go out';
    } else if (weatherCode < 520) {
      return 'Its a $meridian of snowy rain';
    } else if (weatherCode < 600) {
      return 'Its a $meridian of shower rain';
    } else if (weatherCode < 610) {
      return 'Let there be a snowy $meridian!, ho ho ho';
    } else if (weatherCode < 700) {
      return 'Its a $meridian of snowy rain';
    } else if (weatherCode < 711) {
      return 'Its a misty $meridian';
    } else if (weatherCode < 750) {
      return 'Its a foggy $meridian';
    } else if (weatherCode == 800) {
      return 'Its a clear sky, the perfect $meridian';
    } else if (weatherCode < 900) {
      return 'Its a cloudy $meridian';
    }


    return "Its an un-predictable $meridian";
  }

  static String getWeatherIcon(int? weatherCode, bool? isDay) {
    if (weatherCode == null || isDay == null) return "4";

    if (weatherCode < 230) {
      return (isDay ? "16" : "11");
    } else if (weatherCode < 300) {
      return (isDay ? "25" : "20");
    } else if (weatherCode < 500) {
      return (isDay ? "8" : "21");
    } else if (weatherCode == 501) {
      return "7";
    } else if (weatherCode < 511) {
      return (isDay ? "30" : "1");
    } else if (weatherCode < 520) {
      return (isDay ? "24" : "21");
    } else if (weatherCode < 600) {
      return "22";
    } else if (weatherCode < 610) {
      return (isDay ? "18" : "19");
    } else if (weatherCode < 700) {
      return (isDay ? "23" : "40");
    } else if (weatherCode < 711) {
      return (isDay ? "33" : "32");
    } else if (weatherCode < 750) {
      return (isDay ? "4" : "41");
    } else if (weatherCode == 800) {
      return (isDay ? "26" : "10");
    } else if (weatherCode < 900) {
      return (isDay ? "27" : "31");
    }
    return (isDay ? "4" : "2");
  }
}
