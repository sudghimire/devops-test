require 'spec_helper'

describe Event do
  it { should have_many(:flayers) }
  it { should have_one(:contact) }
  it { should have_one(:venue) }
end
