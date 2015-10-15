puts "------Begin seed data--------"
puts "------Create User--------"
User.create(
  email: "tranhiep92@gmail.com", password: "123456789",
  name: "Hiep Tran", address: "227 Nguyen Thi Thap", gender: true,
  birthday: "1992-10-25", phone: "01643000680", admin: true
)
puts "------Create User Complete--------"



puts "------Create Category--------"
Category.create(
  id: 1, name: "Phone"
)
Category.create(
  id: 2, name: "Tablet"
)
Category.create(
  id: 3, name: "Laptop"
)
Category.create(
  id: 4, name: "Macbook"
)
puts "------Create Category Complete--------"

puts "------Create Brand--------"
brand_list = [
  [1, "Samsung", 1 ],
  [2, "Nokia", 1 ],
  [3, "Apple", 1 ],
  [4, "HTC", 1 ],
  [5, "Sony", 1 ],
  [6, "Apple", 2 ],
  [7, "Samsung", 2 ],
  [8, "Asus", 2 ],
  [9, "Acer", 2 ],
  [10, "Lenovo", 2 ],
  [11, "Dell", 3 ],
  [12, "Asus", 3 ],
  [13, "HP-Compad", 3 ],
  [14, "Acer", 3 ],
  [15, "Lenovo", 3 ]
]
brand_list.each do |id, name, cate_id|
  Brand.create(id: id, name: name, category_id: cate_id )
end
puts "------Create Brand Complete--------"


book = Spreadsheet.open("#{Rails.root}/db/data.xls")
bookSheet = book.worksheet("productSheet")
products = []

bookSheet.each do |row|
  break if row[0].nil?

  item = {
    :name => row[1],
    :stock => row[2],
    :price => row[3],
    :sale_price => row[4],
    :brand_id => row[5],
    :created_at => row[6],
    :description => row[7]
  }
  products.push(item)
end


products.each do |product_attrs|
  Product.create!(product_attrs)
end
puts "------End--------"

