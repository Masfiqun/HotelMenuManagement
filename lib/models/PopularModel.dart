class PopularDietModel{
  String name;
  String iconPath;
  String level;
  String calories;
  String duration;
  bool boxIsSelected;

  PopularDietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.calories,
    required this.duration,
    required this.boxIsSelected
  });

  static List<PopularDietModel> getPopularDiets(){
    List<PopularDietModel> popularDiets = [];

    popularDiets.add(
      PopularDietModel(
        name: 'Honey Pancake', 
        iconPath: 'assets/icons/pan.svg', 
        level: 'Medium', 
        calories: '230kCal', 
        duration: '30 min', 
        boxIsSelected: true
      )
    );

    popularDiets.add(
      PopularDietModel(
        name: 'Honey Pancake', 
        iconPath: 'assets/icons/pan.svg', 
        level: 'Medium', 
        calories: '230kCal', 
        duration: '30 min', 
        boxIsSelected: true
      )
    );

    return popularDiets;
  }
}