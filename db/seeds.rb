FarmProduct.destroy_all
Farm.destroy_all
Product.destroy_all

el_dorado = Farm.create(name: "El Dorado")
raisin_roots = Farm.create(name: "Raisin Roots", website: "https://raisinroots.com/")
sunspot = Farm.create(name: "Sunspot", website: "http://sunspoturbanfarm.squarespace.com/the-farm-1")

tomato = Product.create(name: "Tomatoes")
eggs = Product.create(name: "Eggs")
chicken = Product.create(name: "Chicken")
spinach = Product.create(name: "Spinach")
apples = Product.create(name: "Apples")
kale = Product.create(name: "Lucinado Kale")
peaches = Product.create(name: "Peaches")
beets = Product.create(name: "Beets")


FarmProduct.create(farm: el_dorado, product: tomato, quantity: 300)
FarmProduct.create(farm: el_dorado, product: eggs, quantity: 500)
FarmProduct.create(farm: el_dorado, product: chicken, quantity: 50)
FarmProduct.create(farm: el_dorado, product: spinach, quantity: 450)
FarmProduct.create(farm: el_dorado, product: apples, quantity: 450)
FarmProduct.create(farm: el_dorado, product: peaches, quantity: 200)

FarmProduct.create(farm: raisin_roots, product: tomato, quantity: 40)
FarmProduct.create(farm: raisin_roots, product: eggs, quantity: 20)
FarmProduct.create(farm: raisin_roots, product: chicken, quantity: 10)
FarmProduct.create(farm: raisin_roots, product: spinach, quantity: 45)
FarmProduct.create(farm: raisin_roots, product: apples, quantity: 70)

FarmProduct.create(farm: sunspot, product: tomato, quantity: 4)
FarmProduct.create(farm: sunspot, product: eggs, quantity: 2)
FarmProduct.create(farm: sunspot, product: chicken, quantity: 14)
FarmProduct.create(farm: sunspot, product: beets, quantity: 300)
FarmProduct.create(farm: sunspot, product: kale, quantity: 500)

# FarmProduct.create(farm_id: 3, product_id: 4, quantity: 0)
# FarmProduct.create(farm_id: 3, product_id: 5, quantity: 0)