Dir[File.expand_path(File.join(File.dirname(File.absolute_path(__FILE__)), './lib')) + '/**/*.rb'].each do |file|
  require file
end

require 'pry'

standard = DeliveryProduct.new 'Standard', 10
express = DeliveryProduct.new 'Express', 20

discount_list = DiscountList.new
discount_list.add Discount.new(ExpressMultipurchaseDiscount.new(express))
discount_list.add Discount.new(Over30Discount.new)

broadcasters = {}
broadcasters['Viacom'] = Broadcaster.new 'Viacom'
broadcasters['Disney'] = Broadcaster.new 'Disney'
broadcasters['Discovery'] = Broadcaster.new 'Discovery'
broadcasters['ITV'] = Broadcaster.new 'ITV'
broadcasters['Channel 4'] = Broadcaster.new 'Channel 4'
broadcasters['Bike Channel'] = Broadcaster.new 'Bike Channel'
broadcasters['Horse and Country'] = Broadcaster.new 'Horse and Country'

order_1 = Order.new Material.new('WNP/SWCL001/010'), discount_list, DeliveryList.new
order_1.add_delivery(Delivery.new(broadcasters[:disney], standard))
order_1.add_delivery(Delivery.new(broadcasters[:discovery], standard))
order_1.add_delivery(Delivery.new(broadcasters[:viacom], standard))
order_1.add_delivery(Delivery.new(broadcasters[:horse_and_country], express))

order_2 = Order.new Material.new('ZDW/EOWW005/010'), discount_list, DeliveryList.new
order_2.add_delivery(Delivery.new(broadcasters[:disney], express))
order_2.add_delivery(Delivery.new(broadcasters[:discovery], express))
order_2.add_delivery(Delivery.new(broadcasters[:viacom], express))

binding.pry
