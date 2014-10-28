40.times do |i|
  Item.create(
      title: "Title ##{i}",
      description: "Description ##{i}",
  )
end