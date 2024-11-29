import 'package:hive/hive.dart';
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


  static List<City> citiesList = [
    City(
        isSelected: false,
        name: 'London',
        country: 'United Kindgom',
        isDefault: true),
    City(
        isSelected: false,
        name: 'Tokyo',
        country: 'Japan',
        isDefault: false),
    City(
        isSelected: false,
        name: 'Delhi',
        country: 'India',
        isDefault: false),
    City(
        isSelected: false,
        name: 'Beijing',
        country: 'China',
        isDefault: false),
    City(
        isSelected: false,
        name: 'Paris',
        country: 'Paris',
        isDefault: false),
    City(
        isSelected: false,
        name: 'Rome',
        country: 'Italy',
        isDefault: false),
    City(
        isSelected: false,
        name: 'Lagos',
        country: 'Nigeria',
        isDefault: false),
    City(
        isSelected: false,
        name: 'Amsterdam',
        country: 'Netherlands',
        isDefault: false),
    City(
        isSelected: false,
        name: 'Barcelona',
        country: 'Spain',
        isDefault: false),
    City(
        isSelected: false,
        name: 'Miami',
        country: 'United States',
        isDefault: false),
    City(
        isSelected: false,
        name: 'Vienna',
        country: 'Austria',
        isDefault: false),
    City(
        isSelected: false,
        name: 'Berlin',
        country: 'Germany',
        isDefault: false),
    City(
        isSelected: false,
        name: 'Toronto',
        country: 'Canada',
        isDefault: false),
    City(
        isSelected: false,
        name: 'Brussels',
        country: 'Belgium',
        isDefault: false),
    City(
        isSelected: false,
        name: 'Nairobi',
        country: 'Kenya',
        isDefault: false),
  ];
}

