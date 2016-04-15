require 'spec_helper'
describe Api::V1::EventsController do
  render_views
  let!(:event) { FactoryGirl.create(:event) }
  describe "GET index" do
    before { get :index, :format => :json }
    it "should return a 200 status code" do
      expect(response.code).to eq("200")
    end
    describe "response" do
      subject { JSON.parse(response.body).first }
      it { have_key("venue")}
      it { have_key("contact")}
      it { have_key("flayers")}
    end
  end

  describe "GET show" do
    before { get :show, :id => event.id, :format => :json }
    it "should return a 200 status code" do
      expect(response.code).to eq("200")
    end
    describe "response" do
      subject { JSON.parse(response.body) }
      it { have_key("venue")}
      it { have_key("contact")}
      it { have_key("flayers")}
    end
  end

  describe "POST create" do
    let(:event_json) { {:date => Time.now , :description => "A description", :name => "A name", :price => "1234"}.to_json }
    context "when request json is valid" do
      subject { post :create, :event => event_json, :format => :json }
      it "should return a 200 status code" do
        subject
        expect(response.code).to eq("200")
      end
      it "should create an event object" do
        expect{subject}.to change{Event.count}.by(1)
      end
    end
  end

  describe "PUT update" do
    context "when request json is valid" do
      let(:event_json) { {:date => Time.now , :description => "Another description", :name => "A name", :price => "1234"}.to_json }
      subject { put :update, :id => event.id, :event => event_json, :format => :json }
      it "should return a 200 status code" do
        subject
        expect(response.code).to eq("200")
      end
      it "should return a success message" do
        subject
        JSON.parse(response.body)["message"].should == "Event updated"
      end
      it "should change event attributes" do
        expect{subject}.to change{event.reload.description}.from('A random description').to('Another description')
      end
    end
  end

  describe "DELETE destroy" do
    context "when request json is valid" do
      before { delete :destroy, :id => event.id }
      it "should return a 200 status code" do
        expect(response.code).to eq("200")
      end
      it "should return a success message" do
        JSON.parse(response.body)["message"].should == "Event deleted"
      end
      it "should delete event object" do
        expect{Event.find(event.id)}.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

end