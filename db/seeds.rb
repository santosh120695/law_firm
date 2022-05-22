# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "admin@blankspace.com", password: "1linkwok@", password_confirmation: "1linkwok@")
StatusMaster.create(name: "Pending", status_type: "Title", initial: true)
StatusMaster.create(name: "New Published", status_type: "Title", initial: false)
StatusMaster.create(name: "Title Generated", status_type: "Title", initial: false)
StatusMaster.create(name: "Payment Clear", status_type: "Title", initial: false)


StatusMaster.create(name: "Pending", status_type: "Dastavej", initial: true)
StatusMaster.create(name: "New Published", status_type: "Dastavej", initial: false)
StatusMaster.create(name: "Title Generated", status_type: "Dastavej", initial: false)
StatusMaster.create(name: "Payment Clear", status_type: "Dastavej", initial: false)

PaymentMode.create(name: "UPI")
PaymentMode.create(name: "Cash")
PaymentMode.create(name: "Debit Card")

StageMaster.create(name: 'City Survey')
StageMaster.create(name: 'Corporqation')
StageMaster.create(name: 'Gas Bill')
StageMaster.create(name: 'GEB')

# rails g scaffold client name uuid active:boolean location contact_no

# rails g scaffold title client:references block_no pincode village taluka description

# rails g scaffold pricing_detail base_price:float additional_amount:float discount_type:integer tax_class:string  vat_amount:float title:references

# rails g scaffold StatusMaster name color active uuid 

# rails g scaffold payment_mode name uuid active:boolean

# rails g scaffold payment_status payment_mode:references payment_detail amount:float uuid

# rails g model projects name client:references

# rails g model Tower name 
# rails g model Floor name tower:references 
# rails g model Unit name rera_carpet_area:float exclusive_area:float open_terrace:float  total_area:float undivided_share_of_land:float jantri  jantri_amount:float tower:references floor:references
