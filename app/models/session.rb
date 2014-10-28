class Session < ActiveRecord::Base
  def view(item)
    transaction do
      # viewed - items viewed in this session
      if viewed.length > 0 && viewed.index(item.id).nil?
        # mark all viewed that they are viewed with new item
        Item.find(viewed).each do |i|
          i.inc_viewed(item.id)
          i.save
        end

        # mark that new item is viewed with viewed earlier ones
        viewed.each { |v| item.inc_viewed(v) }
        item.save
      end

      # save that current items viewed in this session
      if viewed.index(item.id).nil?
        viewed << item.id
        viewed.uniq!
        viewed_will_change!
        save
      end
    end
  end
end
