# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# if Spree::Product.count == 0
#   puts "🌱 Bắt đầu gieo hạt (Seed) dữ liệu..."

#   Spree::Core::Engine.load_seed if defined?(Spree::Core)
#   Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

#   # === Tạo Danh mục sản phẩm ===
#   store = Spree::Store.default || Spree::Store.first
#   taxonomy = Spree::Taxonomy.find_or_create_by!(name: 'Phụ kiện xe hơi', store: store)
#   root_taxon = taxonomy.root

#   categories = [
#     'Lốp xe & Mâm',
#     'Đèn xe',
#     'Camera hành trình',
#     'Phụ kiện nội thất',
#     'Dầu nhớt & Bảo dưỡng'
#   ]

#   taxons = {}
#   categories.each do |cat_name|
#     taxons[cat_name] = root_taxon.children.find_or_create_by!(name: cat_name, taxonomy: taxonomy)
#   end

#   # === Tạo Sản phẩm mẫu ===
#   default_shipping_category = Spree::ShippingCategory.find_or_create_by!(name: 'Default')

#   products_data = [
#     { name: 'Camera hành trình Vietmap', price: 1500000, category: 'Camera hành trình' },
#     { name: 'Đèn LED xe hơi', price: 800000, category: 'Đèn xe' },
#     { name: 'Lốp Michelin 205/55R16', price: 2200000, category: 'Lốp xe & Mâm' },
#     { name: 'Thảm lót sàn 5D', price: 1200000, category: 'Phụ kiện nội thất' },
#     { name: 'Dầu nhớt Castrol 5W-40', price: 350000, category: 'Dầu nhớt & Bảo dưỡng' }
#   ]

#   products_data.each do |pd|
#     product = Spree::Product.find_or_create_by!(name: pd[:name]) do |p|
#       p.price = pd[:price]
#       p.shipping_category = default_shipping_category
#       p.sku = "SKU-#{pd[:name].parameterize.upcase}"
#       p.available_on = Time.current
#       p.stores << store
#     end

#     # === CODE THÊM HÌNH ẢNH ===
#     # Khai báo đường dẫn tới file ảnh trong máy tính của bạn
#     image_path = Rails.root.join('storage', 'seeds', "#{pd[:name].parameterize}.jpg")
    
#     # Kiểm tra xem file ảnh có tồn tại ở thư mục đó không
#     if File.exist?(image_path) && product.images.empty?
#       product.images.create!(
#         attachment: {
#           io: File.open(image_path),
#           filename: File.basename(image_path)
#         }
#       )
#     end
#     # ============================
    
#     # Thêm vào danh mục
#     taxon = taxons[pd[:category]]
#     unless product.taxons.include?(taxon)
#       product.taxons << taxon
#     end
#   end

#   puts "✅ Đã seed dữ liệu thành công!"
# else
#   # Nếu đếm thấy lớn hơn 0, nghĩa là đã có dữ liệu rồi
#   puts "⏩ Dữ liệu đã tồn tại trong Database. Bỏ qua bước Seed để tránh trùng lặp!"
# end


# Thêm thư viện này ở đầu file để hỗ trợ mở link tải ảnh
require 'open-uri' 

if Spree::Product.count == 0
  puts "🌱 Bắt đầu gieo hạt (Seed) dữ liệu..."

  Spree::Core::Engine.load_seed if defined?(Spree::Core)
  Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

  # === Tạo Danh mục sản phẩm ===
  store = Spree::Store.default || Spree::Store.first
  taxonomy = Spree::Taxonomy.find_or_create_by!(name: 'Phụ kiện xe hơi', store: store)
  root_taxon = taxonomy.root

  categories = [
    'Lốp xe & Mâm',
    'Đèn xe',
    'Camera hành trình',
    'Phụ kiện nội thất',
    'Dầu nhớt & Bảo dưỡng'
  ]

  taxons = {}
  categories.each do |cat_name|
    taxons[cat_name] = root_taxon.children.find_or_create_by!(name: cat_name, taxonomy: taxonomy)
  end

  # === Tạo Sản phẩm mẫu ===
  default_shipping_category = Spree::ShippingCategory.find_or_create_by!(name: 'Default')

  # Đã thêm trường image_url vào mỗi sản phẩm. Bạn hãy thay link ví dụ bằng link ảnh thật nhé!
  products_data = [
    { name: 'Camera hành trình Vietmap', price: 1500000, category: 'Camera hành trình', image_url: "https://res.cloudinary.com/dv2mes9by/image/upload/v1778077289/camera-hanh-trinh-vietmap_jn9grd.jpg" },
    { name: 'Đèn LED xe hơi', price: 800000, category: 'Đèn xe', image_url: "https://res.cloudinary.com/dv2mes9by/image/upload/v1778077788/z7798244645119_6833fce7608f60615719bc9e8b82282a_ibtslm.jpg" },
    { name: 'Lốp Michelin 205/55R16', price: 2200000, category: 'Lốp xe & Mâm', image_url: "https://res.cloudinary.com/dv2mes9by/image/upload/v1778077787/z7798242170911_9964cdf1f08ed4c13ab88f53d1ee1c71_gxw235.jpg" },
    { name: 'Thảm lót sàn 5D', price: 1200000, category: 'Phụ kiện nội thất', image_url: "https://res.cloudinary.com/dv2mes9by/image/upload/v1778077762/z7798232066808_421937fc49c1e65a7b2e453e1b914a43_zbdphj.jpg" },
    { name: 'Dầu nhớt Castrol 5W-40', price: 350000, category: 'Dầu nhớt & Bảo dưỡng', image_url: "https://res.cloudinary.com/dv2mes9by/image/upload/v1778077753/z7798230096807_a44006f72443eed8bc6dde03b5825eb5_s0dmjr.jpg" }
  ]

  products_data.each do |pd|
    product = Spree::Product.find_or_create_by!(name: pd[:name]) do |p|
      p.price = pd[:price]
      p.shipping_category = default_shipping_category
      p.sku = "SKU-#{pd[:name].parameterize.upcase}"
      p.available_on = Time.current
      p.status = 'active'
      p.stores << store
    end
    
    # Thêm vào danh mục
    taxon = taxons[pd[:category]]
    unless product.taxons.include?(taxon)
      product.taxons << taxon
    end

    # === CODE THÊM HÌNH ẢNH TRỰC TUYẾN TÍCH HỢP ===
    if pd[:image_url].present? && product.images.empty?
      begin
        puts "  ⏳ Đang tải ảnh cho: #{product.name}..."
        
        # Tải ảnh từ đường link URL
        downloaded_image = URI.open(pd[:image_url])
        
        # Gắn ảnh vào master variant của sản phẩm
        spree_image = Spree::Image.new(viewable: product.master)
        spree_image.attachment.attach(
          io: downloaded_image, 
          filename: "#{pd[:name].parameterize}.jpg"
        )
        spree_image.save!
        
        puts "  ✅ Đã gắn ảnh thành công!"
      rescue => e
        puts "  ❌ Bỏ qua ảnh của #{product.name} vì lỗi tải link: #{e.message}"
      end
    end
    # ============================
    
  end

  puts "✅ Đã seed dữ liệu thành công!"
else
  # Nếu đếm thấy lớn hơn 0, nghĩa là đã có dữ liệu rồi
  puts "⏩ Dữ liệu đã tồn tại trong Database. Bỏ qua bước Seed để tránh trùng lặp!"
end