describe HttpDistributor::Delay do

  it "basics" do
    d = HttpDistributor::Delay.new(1, 2)
    10.times{((1..2).includes? d.get).should eq true}
    d = HttpDistributor::Delay.new(0.0, 1.0)
    10.times{((0.0 .. 1.0).includes? d.get).should eq true}
    (d.to {} < 0.1).should eq true
    (d.to {sleep 0.1} > 0.1).should eq true
    d = HttpDistributor::Delay.new(0.1, 0.1)
    (d.to {d.wait {sleep 0.1}} >= 0.2).should eq true

  end
end
