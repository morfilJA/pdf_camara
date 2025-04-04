import 'dart:math';

class RaffleNumberGenerator {
  // Set to keep track of all generated number combinations
  final Set<String> usedCombinations = {};

  // Generate a random 9-digit number with format xxx-xxx-xxx
  String generateUniqueNumberCombination() {
    Random random = Random();
    String combination;

    do {
      // Generate 3 groups of 3-digit numbers (with leading zeros if needed)
      String part1 = random.nextInt(1000).toString().padLeft(3, '0');
      String part2 = random.nextInt(1000).toString().padLeft(3, '0');
      String part3 = random.nextInt(1000).toString().padLeft(3, '0');

      combination = '$part1-$part2-$part3';
    } while (usedCombinations.contains(combination));

    // Add to used combinations set
    usedCombinations.add(combination);
    return combination;
  }
}
