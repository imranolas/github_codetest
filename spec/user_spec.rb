require_relative '../environment.rb'
require 'spec_helper'


describe User do

    subject(:user) { User.new('imranolas') }
    it { should_not be_nil }
    its(:username) { should eql 'imranolas' }

    describe '#repos' do

      it { should respond_to :repos }
      its(:repos) { should be_an Array }

      describe 'array' do
        its "length should be 13" do
          user.repos.length.should eql 13
        end

        it 'should contain a repo hash' do
           user.repos.first.should be_a Hash
        end

        its 'first hash should have a language key' do
           user.repos.first['language'].should_not be_nil
           user.repos.first['language'].should eql "CSS"
        end
      end
    end

    describe '#languages' do
      its(:languages) { should be_an Hash }
      its(:languages) { should include 'Ruby' }
      its(:languages) { should eql({"CSS"=>3, "Ruby"=>9, nil=>1}) }
    end

end