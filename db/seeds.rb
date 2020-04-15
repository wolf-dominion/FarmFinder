FarmProduct.destroy_all
Farm.destroy_all
Product.destroy_all

el_dorado = Farm.create(name: "El Dorado Farms")
raisin_roots = Farm.create(name: "Raisin Roots")
sunspot = Farm.create(name: "Sunspot")

tomato = Product.create(name: "Tomato")
eggs = Product.create(name: "Eggs")
chicken = Product.create(name: "Chicken")
spinach = Product.create(name: "Spinach")
apples = Product.create(name: "Apples")


FarmProduct.create(farm: el_dorado, product: tomato, quantity: 300)
FarmProduct.create(farm: el_dorado, product: eggs, quantity: 500)
FarmProduct.create(farm: el_dorado, product: chicken, quantity: 450)
FarmProduct.create(farm: el_dorado, product: spinach, quantity: 450)
FarmProduct.create(farm: el_dorado, product: apples, quantity: 450)

FarmProduct.create(farm: raisin_roots, product: tomato, quantity: 40)
FarmProduct.create(farm: raisin_roots, product: eggs, quantity: 20)
FarmProduct.create(farm: raisin_roots, product: chicken, quantity: 10)
FarmProduct.create(farm: raisin_roots, product: spinach, quantity: 45)
FarmProduct.create(farm: raisin_roots, product: apples, quantity: 70)

FarmProduct.create(farm: sunspot, product: tomato, quantity: 4)
FarmProduct.create(farm: sunspot, product: eggs, quantity: 2)
FarmProduct.create(farm: sunspot, product: chicken, quantity: 1)
# FarmProduct.create(farm_id: 3, product_id: 4, quantity: 0)
# FarmProduct.create(farm_id: 3, product_id: 5, quantity: 0)