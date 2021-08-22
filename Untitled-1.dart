
main() {

Map<int, List> std = {
  1 : [
    '500',
    600,
    900.5
  ],
  2 : [
    500,
    600.66,
    '900.5'
  ],
  3 : [
    500,
    600,
    900.5
  ],
};


std[1]![0] = int.parse(std[1]![0]);
std[2]![2] = double.parse(std[2]![2]);

std[1]![2] = std[1]![2].toInt();
std[2]![1] = std[2]![1].toInt();
std[2]![2] = std[2]![2].toInt();
std[3]![2] = std[3]![2].toInt();


num sum = std[1]!.reduce((value, element) => value + element);
num avg = sum / std[1]!.length;
print(avg);



}