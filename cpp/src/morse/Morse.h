//
// Created by Konstantin Gredeskoul on 5/9/17.
//

#ifndef MORSE_H
#define MORSE_H

#include <string>
#include <map>
#include <utility>

#define MORSE_CODE {{".-", "A"}, {"-...", "B"}, {"-.-.", "C"}, {"-..", "D"}, {".", "E"}, {"..-.", "F"}, {"--.", "G"}, {"....", "H"}, {"..", "I"}, {".---", "J"}, {"-.-", "K"}, {".-..", "L"}, {"--", "M"}, {"-.", "N"}, {"---", "O"}, {".--.", "P"}, {"--.-", "Q"}, {".-.", "R"}, {"...", "S"}, {"-", "T"}, {"..-", "U"}, {"...-", "V"}, {".--", "W"}, {"-..-", "X"}, {"-.--", "Y"}, {"--..", "Z"}, {"-----", "0"}, {".----", "1"}, {"..---", "2"}, {"...--", "3"}, {"....-", "4"}, {".....", "5"}, {"-....", "6"}, {"--...", "7"}, {"---..", "8"}, {"----.", "9"}, {".-.-.-", "."}, {"--..--", ","}, {"..--..", "?"}, {".----.", "'"}, {"-.-.--", "!"}, {"-..-.", "/"}, {"-.--.", "("}, {"-.--.-", ")"}, {".-...", "&"}, {"---...", "=>"}, {"-.-.-.", ";"}, {"-...-", "="}, {".-.-.", "+"}, {"-....-", "-"}, {"..--.-", "_"}, {".-..-.", "\""}, {"...-..-", "$"}, {".--.-.", "@"}, {"...---...", "SOS"}}

static const std::map<std::string, std::string> MorseCode = MORSE_CODE;

#define DECODE_MORSE(x) (new Morse(x))->decode()

class Morse {
 public:
  Morse(std::string codedInput);
  std::string decode();
  
 private:
  std::string coded, decoded;

  void flush(std::string &character);
  std::string &ltrim(std::string &s);
  std::string &rtrim(std::string &s);
  std::string &trim(std::string &s);
};

#endif //MORSE_H
