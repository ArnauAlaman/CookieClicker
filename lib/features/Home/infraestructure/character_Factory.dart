import '../../../shared/character.dart';

class CharacterFactory {
  List<Character> fromJson({required var json}) {
    List<Character> characters = [];
    List<String> originalCharacters = ["Grandma", "Farm", "Mine", "Factory"];
    Character character;

    for (var i = 0; i < 4; i++) {
      var currentCharacter = json["characters"][0][originalCharacters[i]];
      character = Character(
          textContent: currentCharacter[0]["textContent"],
          name: originalCharacters[i],
          img: currentCharacter[0]["img"],
          baseProduction: currentCharacter[0]["baseProduction"],
          productionUpgradeMultiplier: currentCharacter[0]
              ["productionUpgradeMultiplier"],
          priceToUpgradeMultiplier: currentCharacter[0]
              ["priceToUpgradeMultiplier"]);

      characters.add(character);
    }
    return characters;
  }
}
