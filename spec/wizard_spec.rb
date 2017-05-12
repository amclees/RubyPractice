require_relative '../wizard.rb'

RSpec.describe Wizard, '#magic' do
  context 'in freezing cold weather' do
    it 'shivers' do
      wizard = Wizard.new
      wizard.temperature = 0.2
      expect(wizard.shivering?).to be_truthy
    end

    it 'does not mess with its elements' do
      wizard = Wizard.new
      wizard.temperature = 0.2
      array = []
      (0...1000).each do |num|
        random = rand * 100
        wizard[num] = random
        array[num] = random
      end
      same = true
      array.each_with_index do |expected, index|
        same = false unless expected == array[index]
      end
      expect(same).to be true
    end
  end

  context 'at approximately room temperature' do
    it 'changes its elements to 4' do
      wizard = Wizard.new
      wizard.temperature = 23
      (0...1000).each do |num|
        random = 0
        loop do
          random = rand * 100
          break if random != 4
        end
        wizard[num] = random
      end
      has_fours = false
      wizard.each do |num|
        has_fours = true if num == 4
      end
      expect(has_fours).to be true
    end
  end
end
