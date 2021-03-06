require 'docking_station.rb'

describe DockingStation do

  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    it 'releases working bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq(bike)
    end

    it 'we cant release a bike if we dont dock one first' do
      expect { subject.release_bike }.to raise_error("No bikes available")
    end

  end

  describe '#dock' do

    it 'bike is docked' do 
      bike = Bike.new
      subject.dock(bike)
      expect(bike).to eq bike
    end

    it 'if one bike is docked you cannot dock another' do
      subject.dock(Bike.new)
      expect { subject.dock(Bike.new) }.to raise_error("Docking station full")
    end
  
  end

end