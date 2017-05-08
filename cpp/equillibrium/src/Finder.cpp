//
// Created by Konstantin Gredeskoul on 5/7/17.
//

#include <iostream>
#include "Finder.h"

Finder::Finder(const std::vector<int> &data_v) {
    data = data_v;
}

std::vector<int> *Finder::find() {
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
    std::sort (results.begin(), results.end());
    return &results;
}
