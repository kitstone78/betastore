require './config/environment'

50.times do
  p = Product.new
    p.name = Faker::Commerce.product_name
   p.price = Faker::Commerce.price

  p.save
end

Product.order('price desc').limit(10).each do |p|
  puts "%s $%0.2f" % [p.name, p.price.to_f]
end

puts 
puts "Total number of products: %d" % Product.count
puts "Average product price: $%0.2f" % Product.average(:price)


