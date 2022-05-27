class Character {
  final String name;
  final String img;
  final String textContent;
  final int baseProduction;
  final double productionUpgradeMultiplier;
  final double priceToUpgradeMultiplier;

  Character(
      {required this.name,
      required this.textContent,
      required this.img,
      required this.baseProduction,
      required this.productionUpgradeMultiplier,
      required this.priceToUpgradeMultiplier});
}
