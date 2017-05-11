#include <iostream>
#include <vector>
#include "Equilibrium.h"

void equilibrium() {
    std::vector<int> data{-1, 3, -4, 5, 1, -6, 2, 1};

    Equilibrium *f = new Equilibrium(data);

    std::vector<int> *result = f->find();
    std::cout << "Equilibrium Results: [";
    for (auto const element: *result) {
        std::cout << element;
        if (element != result->at(result->size() - 1))
            std::cout << ", ";

    }
    std::cout << "]\n";
}

int main() {
    equilibrium();
    return 0;
}
