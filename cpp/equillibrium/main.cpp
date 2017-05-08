#include <iostream>
#include <vector>
#include "src/Finder.h"

static const std::vector<int> data {-1, 3, -4, 5, 1, -6, 2, 1 };

int main() {
    Finder* f = new Finder(data);
    std::vector<int> *result = f->find();
    std::cout << "Equilibrium Results: [";
    for (auto const element: *result) {
        std::cout << element << ", ";
    }
    std::cout << "]";
    return 0;
}

