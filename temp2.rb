def print_farm_name_list
    puts ""

    prompt = TTY::Prompt.new
    selection = prompt.select("Farm List", list_farm_names)

    def farm_selection(selection)
        farm = Farm.all.find_by(name: selection)
        farm_id = farm.id
        farm_product_array = FarmProduct.where(farm_id: farm.id)

        farm_product_array.each do |n|
            product_id = n.product_id # 1
            product = Product.all.find_by(id: product_id) #product instance
            product_name = product.name #product name

            puts "#{n.quantity} #{product_name}"
        end
    end
    puts ""
    puts "#{selection} Inventory"
    farm_selection(selection)
end