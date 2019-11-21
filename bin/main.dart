// Challenge 1
// Minimum Removals to Make Two Strings Anagrams
// Create a function that returns the smallest number of letter removals so that
// two strings are anagrams of each other.
//  Examples
//  minRemovals("abcde", "cab") ➞ 2
int minRemovals(String firstString, String secondString) {
  List<String> firstList = [];
  List<String> secondList = [];
  List<int> indexListA = [];
  List<String> tempListA = [];
  List<int> indexListB = [];
  List<String> tempListB = [];
  for (int i = 0; i < firstString.length; i++) {
    firstList.add(firstString[i]);
  }
  for (int i = 0; i < secondString.length; i++) {
    secondList.add(secondString[i]);
  }
  for (int i = 0; i < firstList.length; i++) {
    if (secondList.contains(firstList[i])) {
      secondList.remove(firstList[i]);
    } else {
      indexListA.add(i);
    }
  }
  for (int i = 0; i < indexListA.length; i++) {
    tempListA.add(firstList[indexListA[i]]);
  }
  for (int i = 0; i < secondList.length; i++) {
    if (tempListA.contains(secondList[i])) {
      tempListA.remove(secondList[i]);
    } else {
      indexListB.add(i);
    }
  }
  for (int i = 0; i < indexListB.length; i++) {
    tempListB.add(secondList[indexListB[i]]);
  }
  return tempListA.length + tempListB.length;
}
// Challenge 2
// Farthest Hamming Anagrams
// The Hamming distance between two strings is the number of positions at which
// they differ. Hamming distances can only be calculated for strings of equal length.

/// String s1 = "eleven"
/// String s2 = "twelve"
/// They only have the third position (index 2) in common, giving them a Hamming
/// distance of 5.
/// As anagrams are of identical length, the Hamming distance between them can be
/// calculated.
// String s1 = "read"
// String s2 = "dear"
// These strings differ at the first and last positions, giving them a Hamming distance of 2.

/// Create a function that takes two strings, and returns:
// - true if they are anagrams of each other and their Hamming distance is equal to
//  their length (i.e. no letters in the same positions).
// - false if they aren't anagrams, or
// - Their Hamming distance if they are anagrams with >=1 letter at the same index.
hammingDistance(String firstString, String secondString) {
  if (!(isAnagram(firstString, secondString))) {
    return false;
  } else {
    if (calculateHammingDistance(firstString, secondString) ==
        firstString.length) {
      return true;
    } else {
      return calculateHammingDistance(firstString, secondString);
    }
  }
}

calculateHammingDistance(String firstString, String secondString) {
  int hammingCount = 0;
  //strings are of equal length so calculate hamming distance
  for (int i = 0; i < firstString.length; i++) {
    if (firstString[i] != secondString[i]) {
      hammingCount++;
    }
  }
  return hammingCount;
}

doesHammingDistanceEqualsLength(String string, int hammingCount) {
  return string.length == hammingCount;
}

main() {
  print(minRemovals("abcde", "abf"));
  print(minRemovals("abcde", "abc"));
  print(minRemovals("abcde", "fox"));
  print(minRemovals("", ""));
  print(minRemovals("abc", ""));
  print(hammingDistance("eleven", "tweleve"));
  print(hammingDistance("read", "dear"));
  print(hammingDistance("read", "root"));
  print(hammingDistance("read", "eadr"));
  print(isAnagram("ballon", "baloon"));
  print(isAnagram("ballon", "balonl"));
  print(isAnagram("", ""));
}

isAnagram(String firstString, String secondString) {
  List<dynamic> firstStringList = firstString.split('').toList();
  List<dynamic> secondStringList = secondString.split('').toList();
  if (firstStringList.length != secondStringList.length) {
    // if length of the lists is not equal return false
    return false;
  } else {
    for (int i = 0; i < firstStringList.length; i++) {
      //remove each matching element from the second list
      if (secondStringList.contains(firstStringList[i])) {
        //if the strings are anagrams,
        secondStringList.remove(firstStringList[
            i]); //the second string list should be empty at the end
      }
    }
  }
  return secondStringList.isEmpty;
}
