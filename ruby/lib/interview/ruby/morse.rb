# encoding: utf-8
require 'json'
module Interview
  module Ruby
    class Morse

      MORSE_CODE_JSON = %Q#{".-":"A","-...":"B","-.-.":"C","-..":"D",".":"E","..-.":"F","--.":"G","....":"H","..":"I",".---":"J","-.-":"K",".-..":"L","--":"M","-.":"N","---":"O",".--.":"P","--.-":"Q",".-.":"R","...":"S","-":"T","..-":"U","...-":"V",".--":"W","-..-":"X","-.--":"Y","--..":"Z","-----":"0",".----":"1","..---":"2","...--":"3","....-":"4",".....":"5","-....":"6","--...":"7","---..":"8","----.":"9",".-.-.-":".","--..--":",","..--..":"?",".----.":"'","-.-.--":"!","-..-.":"/","-.--.":"(","-.--.-":")",".-...":"&","---...":"=>","-.-.-.":";","-...-":"=",".-.-.":"+","-....-":"-","..--.-":"_",".-..-.":"\\"","...-..-":"$",".--.-.":"@","...---...":"SOS"}#
      MORSE_CODE      = JSON.load(MORSE_CODE_JSON)

      def self.decode(encoded)
        Scanner.new(encoded).decode
      end

      class Scanner
        attr_accessor :encoded, :decoded

        def initialize(encoded)
          self.encoded = encoded.strip
          self.decoded = ''
        end

        def decode
          space_count             = 0
          non_space_count         = 0
          single_character_buffer = ''
          self.encoded.chars.each do |c|
            case c
              when ' '
                space_count += 1
                if space_count == 1 && non_space_count > 0 && !single_character_buffer.empty?
                  flush(coded: single_character_buffer)
                  single_character_buffer.clear
                elsif space_count == 3 && non_space_count > 0
                  flush(plain: ' ')
                end
              when '/'
                flush(plain: ' ') if non_space_count > 0
              when '.', '-'
                space_count = 0
                non_space_count +=1
                single_character_buffer << c
              else
                raise "Invalid character in input stream: '#{c}'"
            end
          end

          flush(coded: single_character_buffer) unless single_character_buffer.empty?

          self.decoded
        end

        def flush(coded: nil, plain: nil)
          if coded
            c = MORSE_CODE[coded]
            raise ArgumentError, "Do not have a mapping for '#{coded}'" unless c
          elsif plain
            c = plain
          end

          raise ArgumentError, 'Either coded or plain input is required' unless c

          self.decoded << c
        end
      end
    end
  end
end

