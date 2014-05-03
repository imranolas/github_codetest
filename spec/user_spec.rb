require_relative '../environment.rb'
require 'spec_helper'


describe User do

  describe 'valid username' do
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
      its(:languages) { should be_a Hash }
      its(:languages) { should include 'Ruby' }
      its(:languages) { should eql({"CSS"=>3, "Ruby"=>9, nil=>1}) }
    end

    describe '#favourite_language' do
      it { should respond_to 'favourite_language' }
      its(:favourite_language) { should eql 'Ruby' }
    end
  end

   describe 'invalid username' do
    subject(:user) { User.new('invalid_user') }
    its(:repos) { should eq [] }
    its(:languages) { should eq({}) }
    its(:favourite_language) { should eq 'Not Found' }
  end


end