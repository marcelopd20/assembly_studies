#include <iostream>

using namespace std;

extern "C" int Test1(int valor1, int valor2);
extern "C" int Test2(int valor1);

int testA(int valor1, int valor2) {
    if (valor1 > valor2) {
        return valor1;
    } else {
        return valor2;
    }
}

int testB(int valor1) {
    switch (valor1)
    {
    case 1:
        return 5;
        break;
    case 2:
        return 6;
        break;
    case 3:
        return 7;
        break;
    }
    return 0;
}

int main() {
    cout << "Do Teste1 em C foi retornado " << testA(30, 20) << endl;
    cout << "Do Teste1 em asm foi retornado " << Test1(15, 16) << endl;
    cout << "Do Teste2 em C foi retornado " << testB(1) << endl;
    cout << "Do Teste2 em asm foi retornado " << Test2(1) << endl;
}

