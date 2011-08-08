#include "../include/dlist.h"
#include <iostream>
using namespace std;

void processFn(double v)
{
    cout<<v<<" ";
}

int main()
{
    DoubleList dl;
    dl.add(2.1);
    dl.add(3.4);
    dl.add(4.5);
    dl.add(3.2);
    dl.print_all(processFn);
    return 0;
}

