describe CrystalProxy::Delay do
  it "basics" do
    d = CrystalProxy::Delay.new(1, 2)
    10.times{(1..2.includes? d.get).should eq true}
    d = CrystalProxy::Delay.new(0.0, 1.0)
    10.times{(0.0 .. 1.0.includes? d.get).should eq true}
    (d.delay_to {} < 0.1).should eq true
    (d.delay_to {sleep 0.1} > 0.1).should eq true
    (d.wait(0.1) {d.delay_to {sleep 0.1}} > 0.2).should eq true
  end
end
