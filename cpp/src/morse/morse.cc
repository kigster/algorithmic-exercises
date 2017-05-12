//
// Created by Konstantin Gredeskoul on 5/9/17.
//

#include <string>
#include <map>
#include <iostream>
#include "morse.h"

Morse::Morse(std::string codedInput) {
  coded = std::move(codedInput);
}

std::string Morse::decode() {
  std::string &trimmed = Morse::trim(coded);
  std::string charBuffer;

  int counter_spaces = 0,
      counter_non_spaces = 0;

  for (auto p : coded) {
    if (p == ' ') {
      counter_spaces++;
      if (counter_spaces == 1 && counter_non_spaces > 0) {
        flush(charBuffer);
      } else if (counter_spaces == 3) {
        // three spaces indicate a word boundary.
        decoded += " ";
        counter_non_spaces = 0;
      }
    } else if (p == '/' ) {
      // slashes are sometimes used instead of 3-spaces to indicate word boundary.
      decoded += " ";
    } else {
      counter_non_spaces++;
      charBuffer += p;
      counter_spaces = 0;
    }
  }

  Morse::flush(charBuffer);
  return decoded;
}

void Morse::flush(std::string &character) {
  if (!character.empty()) {
    if (MorseCode.count(character) == 0) {
      std::cout << "Unknown character " << character << "in the Morse Code library\n";
    } else {
      decoded += MorseCode.at(character);
    }
    character.clear();
  }
}

std::string &Morse::ltrim(std::string &s) {
  s.erase(s.begin(), std::find_if(s.begin(), s.end(), std::not1(std::ptr_fun<int, int>(std::isspace))));
  return s;
}

std::string &Morse::rtrim(std::string &s) {
  s.erase(std::find_if(s.rbegin(), s.rend(), std::not1(std::ptr_fun<int, int>(std::isspace))).base(), s.end());
  return s;
}

std::string &Morse::trim(std::string &s) {
  return ltrim(rtrim(s));
}
