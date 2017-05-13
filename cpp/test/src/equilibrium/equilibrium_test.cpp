//
// Created by Konstantin Gredeskoul on 1/23/16.
//

#include "gtest/gtest.h"
#include "../../../src/equilibrium/equilibrium.h"

void verifyExpectations(const std::vector<int> &inputData,
                        const std::vector<int> &expected) {

  Equilibrium *f = new Equilibrium(inputData);

  const std::vector<int> &result = f->find();

  EXPECT_EQ(expected.size(), result.size());
  EXPECT_EQ(expected, result);

  for (auto i = 0; i < expected.size(); i++) {
    EXPECT_EQ(expected[i], result.at(i));
  }
}

TEST(FinderTest, ReturnsCorrectIndicesA) {
  std::vector<int> inputData {-1, 3, -4, 5, 1, -6, 2, 1};
  std::vector<int> expected {1, 3, 7};
  verifyExpectations(inputData, expected);
}

TEST(FinderTest, ReturnsCorrectIndicesB) {
  std::vector<int> inputData1 {1, -2, 1, 1};
  std::vector<int> expected1 {0, 3};
  verifyExpectations(inputData1, expected1);
}

