require 'spec_helper'

RSpec.describe Interview::Ruby::Morse do
  shared_examples :morse do |encoded, expected_decoded|
    subject(:decoded) { described_class.decode(encoded) }
    context "decoding '#{encoded}'" do
      it ('should be correctly decoded') { expect(decoded).to eq(expected_decoded) }
    end

  end

  context('Decoding Morse Codes — SOS') {
    include_examples :morse, '...---... ', 'SOS'
  }
  context('Decoding Morse Codes — MORSE CODE') {
    include_examples :morse, '-- --- .-. ... .   -.-. --- -.. .', 'MORSE CODE'
  }
end
