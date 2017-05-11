require 'delivery_list'

describe DeliveryList do
  let(:broadcaster) { double('broadcaster') }
  let(:delivery_product) { double('delivery_product') }

  describe '#list' do
    it 'is initially empty' do
      expect(subject.list).to eq []
    end

    it 'returns a single delivery that has been passed into a list' do
      subject.add broadcaster, delivery_product
      expect(subject.list).to eq [{ broadcaster: broadcaster, delivery_product: delivery_product }]
    end

    it 'returns two deliveries that have been passed into an order' do
      broadcaster_2 = double('broadcaster_2')
      subject.add broadcaster, delivery_product
      subject.add broadcaster_2, delivery_product
      expect(subject.list).to eq [{ broadcaster: broadcaster, delivery_product: delivery_product },
                                  { broadcaster: broadcaster_2, delivery_product: delivery_product }]
    end
  end

  describe '#add' do
    it 'accepts a broadcaster and standard delivery method argument' do
      expect { subject.add broadcaster, delivery_product }.to_not raise_error
    end
  end

  describe '#count' do
    it 'counts 3 of the provided delivery_product and not 2 others' do
      delivery_product_2 = double('delivery_product_2')
      2.times { subject.add broadcaster, delivery_product_2 }
      3.times { subject.add broadcaster, delivery_product }
      expect(subject.count(delivery_product)).to eq 3
    end

    it 'returns 0 for an empty delivery list' do
      expect(subject.count(delivery_product)).to eq 0
    end
  end
end
