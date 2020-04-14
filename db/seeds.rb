Farm.create(name: "El Dorado Farms")
Farm.create(name: "Raisin Roots")
Farm.create(name: "Sunspot")

Product.create(name: "Tomato")
Product.create(name: "Eggs")
Product.create(name: "Chicken")
Product.create(name: "Spinach")
Product.create(name: "Apples")


FarmProduct.create(farms_id: 1, products_id: 1, quantity: 300)
FarmProduct.create(farms_id: 1, products_id: 2, quantity: 500)
FarmProduct.create(farms_id: 1, products_id: 3, quantity: 450)
FarmProduct.create(farms_id: 1, products_id: 4, quantity: 450)
FarmProduct.create(farms_id: 1, products_id: 5, quantity: 450)

FarmProduct.create(farms_id: 2, products_id: 1, quantity: 40)
FarmProduct.create(farms_id: 2, products_id: 2, quantity: 20)
FarmProduct.create(farms_id: 2, products_id: 3, quantity: 10)
FarmProduct.create(farms_id: 2, products_id: 4, quantity: 45)
FarmProduct.create(farms_id: 2, products_id: 5, quantity: 70)

FarmProduct.create(farms_id: 3, products_id: 1, quantity: 4)
FarmProduct.create(farms_id: 3, products_id: 2, quantity: 2)
FarmProduct.create(farms_id: 3, products_id: 3, quantity: 1)
# FarmProduct.create(farm_id: 3, product_id: 4, quantity: 0)
# FarmProduct.create(farm_id: 3, product_id: 5, quantity: 0)