40.times do |i|
  Item.create(
      title: "Title ##{i+1}",
      description: "Description ##{i+1}",
      price: i+1
  )
end