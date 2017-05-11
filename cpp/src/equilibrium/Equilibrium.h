//
// Created by Konstantin Gredeskoul on 5/7/17.
//

#ifndef EQUILLIBRIUM_H
#define EQUILLIBRIUM_H

#include <vector>

class Equilibrium {
public:
    Equilibrium(const std::vector<int> &data_v);
    std::vector<int> *find();
private:
    std::vector<int> data;
    std::vector<int> results;
};


#endif //EQUILLIBRIUM_H
