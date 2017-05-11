//
// Created by Konstantin Gredeskoul on 1/23/16.
//

#include "gtest/gtest.h"
#include <Morse.h>

void verifyExpectations(const std::string &codedInput,
                        const std::string &expectedOutput) {

  EXPECT_EQ((new Morse(codedInput))->decode(), expectedOutput);
}

TEST(MorseTest, character_SOS) {
  verifyExpectations("...---...", "SOS");
}

TEST(MorseTest, sentence_MORSE_CODE) {
  verifyExpectations("-- --- .-. ... .   -.-. --- -.. .", "MORSE CODE");
}

TEST(MorseTest, sentence_SEEMS) {
  EXPECT_EQ((new Morse("... . . -- ..."))->decode(), "SEEMS");
}

TEST(MorseTest, macroTest) {
  EXPECT_EQ(DECODE_MORSE(".-- .... .- - / .. ... / --. --- .. -. --. / --- -. / .-- .. - .... / - .... . / .-- --- .-. .-.. -.. / - --- -.. .- -.-- ..--.. / .-- .... -.-- / -.. --- / .-- . / .... .- ...- . / .- / -- --- -. -.- . -.-- / .- ... / .- / .--. .-. . ... .. -.. . -. - ..--.."), "WHAT IS GOING ON WITH THE WORLD TODAY? WHY DO WE HAVE A MONKEY AS A PRESIDENT?");
}

TEST(MorseTest, characters_S_M_O_E) {
  EXPECT_EQ(MorseCode.size(), 55);
  EXPECT_EQ(MorseCode.at("..."), "S");
  EXPECT_EQ(MorseCode.at("--"), "M");
  EXPECT_EQ(MorseCode.at("---"), "O");
  EXPECT_EQ(MorseCode.at("."), "E");
}

