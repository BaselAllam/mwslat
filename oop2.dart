

class H extends Inter with Y, W{

  int x;
  static int counter = 0;

  H(this.x) {
    counter++;
  }

  test() {
    print('im test');
  }
}

class Inter{}

mixin Y on Inter{

  int p = 300;

}


mixin W on Inter{

  int u = 10;

}


main() {

  H inter = H();

  inter.

}



// Research StatelessWidget & StatefullWidget