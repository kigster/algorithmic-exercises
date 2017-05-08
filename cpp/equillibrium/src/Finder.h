//
// Created by Konstantin Gredeskoul on 5/7/17.
//

#ifndef EQUILLIBRIUM_FINDER_H
#define EQUILLIBRIUM_FINDER_H

#include <vector>

class Finder {
public:
    Finder(const std::vector<int> &data_v);
    std::vector<int> *find();
private:
    std::vector<int> data;
    std::vector<int> results;
};


#endif //EQUILLIBRIUM_FINDER_H
