//
// Created by Konstantin Gredeskoul on 5/7/17.
//

#include <iostream>
#include "equilibrium.h"
#include <algorithm> // std::min_element
#include <iterator>  // std::begin, std::end

Equilibrium::Equilibrium(const std::vector<int> &data_v) {
    data = data_v;
}

std::vector<int> &Equilibrium::find() {
    int len = data.size();
    int last = len - 1;

    results = std::vector<int>(0);
    int left_sum = 0, right_sum = 0, sum = 0;

    for (auto const &element: data)
        sum += element;

    for (auto i = 0; i < len; i++) {
        int n = data[i];
        if (i > 0) left_sum += data[i - 1];
        if (i < last) right_sum = sum - n - left_sum;
        if ((left_sum == right_sum) ||
            (i == 0 && right_sum == 0) ||
            (i == last && left_sum == 0)) {
            results.push_back(i);
        }
    }
    return results;
}


auto solution(std::vector<int> &A) {
    Equilibrium *f = new Equilibrium(A);
    const std::vector<int> &result = f->find();
    auto min = std::min_element(std::begin(result), std::end(result));
    return min;
}
