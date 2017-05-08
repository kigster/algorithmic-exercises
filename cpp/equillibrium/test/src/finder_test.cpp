//
// Created by Konstantin Gredeskoul on 1/23/16.
//

#include "gtest/gtest.h"
#include "helpers.h"
#include <Finder.h>

// Tests factorial of 0.
TEST(FinderTest, ReturnsCorrectData) {
  Finder* f = new Finder(testData);
  const std::vector<int> expected = {1, 3, 7};
  const std::vector<int> *result = f->find();
  int fsize = result->size();
  int esize = expected.size();
  EXPECT_EQ(fsize, esize);
  EXPECT_EQ(expected[0], result->at(0));
  EXPECT_EQ(expected[1], result->at(1));
  EXPECT_EQ(expected[2], result->at(2));
}
