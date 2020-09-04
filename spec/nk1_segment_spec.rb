# encoding: UTF-8
require 'spec_helper'

describe HL7::Message::Segment::NK1 do
  context 'general' do
    before :all do
      @base_nk1 = 'NK1|1|Mum^Martha^M^^^^L|MTH^Mother^HL70063^^^^2.5.1| 444 Home Street^Apt B^Ann Arbor^MI^99999^USA^H|^PRN^PH^^1^555^5552006'
    end

    it 'creates an NK1 segment' do
      expect do
        nk1 = HL7::Message::Segment::NK1.new( @base_nk1 )
        expect(nk1).not_to be_nil
        expect(nk1.to_s).to eq @base_nk1
      end.not_to raise_error
    end

    it 'allows access to an NK1 segment' do
      expect do
        nk1 = HL7::Message::Segment::NK1.new( @base_nk1 )
        expect(nk1.name['origin']).to eq 'Mum^Martha^M^^^^L'
        expect(nk1.name['family_name']).to eq 'Mum'
        expect(nk1.name['given_name']).to eq 'Martha'
        expect(nk1.name.size).to eq 8
        expect(nk1.phone_number['origin']).to eq '^PRN^PH^^1^555^5552006'
        expect(nk1.phone_number['use_code']).to eq 'PRN'
        expect(nk1.phone_number['area_or_city_code']).to eq '555'
        expect(nk1.phone_number['local_number']).to eq '5552006'
      end.not_to raise_error
    end
  end
end
