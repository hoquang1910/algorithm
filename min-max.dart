import 'dart:ffi';
import 'dart:io';

void main(List<String> args) {
  print("Give your input: ");
  //input String
  String? input = stdin.readLineSync();
  final regexp = RegExp(r'(?: |, |,)');
  //change String into Array
  final listOfNumbers = input!.split(regexp).map(int.parse).toList();
  //sort Array
  for (int i = 0; i < listOfNumbers.length - 1; i++) {
    for (int j = i + 1; j < listOfNumbers.length; j++)
      if (listOfNumbers[i] > listOfNumbers[j]) {
        int temp = listOfNumbers[i];
        listOfNumbers[i] = listOfNumbers[j];
        listOfNumbers[j] = temp;
      }
  }
  int min = 0, max = 0, total = 0;
  final evenList = [], oddList = [];
  for (int i = 0; i < listOfNumbers.length; i++) {
    //total 4 first number is min
    if (i != listOfNumbers.length - 1) {
      min = min + listOfNumbers[i];
    }
    //total 4 last number is max
    if (i != 0) {
      max = max + listOfNumbers[i];
    }
    if (listOfNumbers[i] % 2 == 0) {
      evenList.add(listOfNumbers[i]);
    } else {
      oddList.add(listOfNumbers[i]);
    }
    //total list
    total = listOfNumbers[i] + total;
  }
  //min of array
  int minValue = listOfNumbers[0];
  //max of array
  int maxValue = listOfNumbers[listOfNumbers.length - 1];
  print("$min  $max");
  int n = -1;
  while (n != 0) {
    print("Choose your option:");
    print("0. Exit");
    print("1. Total of all list");
    print("2. Min of array");
    print("3. Max of array");
    print("4. Even array");
    print("5. Odd array");
    n = int.parse(stdin.readLineSync()!);
    switch (n) {
      case 1:
        {
          print("Total of all list: $total");
        }
        break;
      case 2:
        {
          print("Min of array: $minValue");
        }
        break;
      case 3:
        {
          print("Max of array: $maxValue");
        }
        break;
      case 4:
        {
          print("Even array: $evenList");
        }
        break;
      case 5:
        {
          print("Odd array: $oddList");
        }
        break;
      default:
        break;
    }
  }
}
