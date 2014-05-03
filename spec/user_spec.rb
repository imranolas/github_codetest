require_relative '../environment.rb'
require 'spec_helper'


describe User do

    subject(:user) { User.new('imranolas') }
    it { should_not be_nil }
    its(:username) { should eql 'imranolas' }




end