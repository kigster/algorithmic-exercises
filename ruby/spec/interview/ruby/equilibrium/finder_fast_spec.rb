require 'spec_helper'
require_relative 'shared_examples'

RSpec.describe Interview::Ruby::Equilibrium::FinderFast do
  include_examples :equilibrium, Interview::Ruby::Equilibrium::FinderFast, 1000
end

