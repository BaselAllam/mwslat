// 1- Conditions
// 2- Loops => For, While, DoWhile
// 3- Operators => Logical ( in ), Arth, Comp ( == , != , < , > , <= , >=, && , || )


main() {

  // Header 
  // Body

  List x = [10, 20, 30];

  // x[0] += 10;
  // x[1] += 10;
  // x[2] += 10;

  for(int i = 0; i < x.length; i++) {
    if(x[i] < 20) {
      x[i] += 5;
    }else{
      x[i] += 10;
    }
  } // index loop

  for(int i in x) {
    if(i < 20) {
      i += 5;
    }else{
      i += 10;
    }
  }

  x.forEach((i) {
    if(i < 20) {
      i += 5;
    }else{
      i += 10;
    }
  });

  // print(x);
}