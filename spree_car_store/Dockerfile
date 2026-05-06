# 1. Khóa cứng bản Ruby 3.2.11 ngay từ lõi hệ điều hành
FROM ruby:3.2.11

# 2. Cài đặt các thư viện C, PostgreSQL và Vips (xử lý ảnh cho Spree)
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential libpq-dev nodejs libvips

# 3. Đặt thư mục làm việc bên trong container
WORKDIR /app

# 4. Copy các file cấu hình thư viện vào trước để tận dụng cache
COPY Gemfile Gemfile.lock ./

# 5. Khóa đúng bản Bundler 2.4.19 và cài đặt
RUN gem install bundler -v 2.4.19
RUN bundle _2.4.19_ install

# 6. Copy toàn bộ mã nguồn còn lại vào container
COPY . .

# 7. Nén tài nguyên (CSS, JS, Hình ảnh)
RUN bundle exec rails assets:precompile

# 8. Khởi tạo file tmp (Tránh lỗi từ phía host)
RUN mkdir -p tmp/pids

# 9. Mở cổng mạng
EXPOSE 3000

# 10. Lệnh khởi động: Tự động chạy Migrate database sau đó bật Server
CMD bash -c "bundle exec rails db:migrate && AUTO_ACCEPT=true bundle exec rails db:seed && bundle exec puma -C config/puma.rb"