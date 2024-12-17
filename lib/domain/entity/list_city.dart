import 'package:hive/hive.dart';
import 'package:weather_app/utils/cities_loader.dart';
part 'list_city.g.dart';

@HiveType(typeId: 1)
class City {
  @HiveField(0)
  final String name;

  @HiveField(1)
  bool isSelected;

  @HiveField(2)
  String country;

  @HiveField(3)
  bool isDefault;

  City({required this.name,
    required this.isSelected,
    required this.country,
    required this.isDefault});


  City copyWith(
      {bool? isSelected, String? name, String? country, bool? isDefault}) {
    return City(
      isSelected: isSelected ?? this.isSelected,
      name: name ?? this.name,
      country: country ?? this.country,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}

