require 'spec_helper'
require_relative 'shared_examples'

RSpec.describe Interview::Ruby::Equilibrium::FinderSlow do
  include_examples :equilibrium, Interview::Ruby::Equilibrium::FinderSlow, 10
end


