require "spec_helper"

describe TripMailer do
  describe "trip_purchase_confirmation" do
    let(:mail) { TripMailer.trip_purchase_confirmation }

    it "renders the headers" do
      mail.subject.should eq("Trip purchase confirmation")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
