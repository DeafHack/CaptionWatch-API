namespace :db do
  desc "Fill DB with sample data"
  task populate: :environment do
    make_complaints
    make_templates
    make_companies
    make_products
    make_product_types
  end

  def make_complaints
    20.times do |n|
      custom_blurb = Faker::Lorem.paragraph
      product_id = Random.rand(1..6)
      address = Faker::Address.street_address
      zipcode = Faker::Address.zip_code
      url = Faker::Internet.url
      Complaint.create!(custom_blurb: custom_blurb, product_id: product_id,
                       address: address, zipcode: zipcode, url: url)
    end
  end

  def make_templates
    4.times do |n|
      blurb = Faker::Company.bs
      product_type_id = Random.rand(1..4)
      Template.create!(blurb: blurb, product_type_id: product_type_id)
    end
  end

  def make_companies
    10.times do |n|
      name = Faker::Company.name
      url = Faker::Internet.url
      Company.create!(name: name, url: url)
    end
  end

  def make_products
    15.times do |n|
      name = Faker::Company.name
      product_type_id = Random.rand(1..4)
      Product.create!(name: name, product_type_id: product_type_id)
    end
  end

  def make_product_types
    4.times do |n|
      label = Faker::Lorem.word
      ProductType.create!(label: label)
    end
  end
end
