// 3. How to create your own “type identity (alias)”, like String. Please describe
// it on code and implement extension on it.

//
// answer: I have never used this typedef stuff.
// source: https://dart.dev/guides/language/language-tour#typedefs
void main() {
  _printIt();
}

// I define an alias for String type using typedef
typedef Product = String;

// Implementing an extension to print the value of the typedef variable
extension PrintProduct on Product {
  void printProduct() {
    print('Nama produknya adalah $this');
  }
}

Product product = 'Obat kuat';

void _printIt() {
  return product.printProduct();
}
