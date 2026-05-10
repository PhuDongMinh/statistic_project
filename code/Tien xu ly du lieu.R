## 3.Tien xu ly du lieu

# 3.1 Đọc dữ liệu và xem trước 
# Đọc dữ liệu từ file CSV
printer_data <- read.csv("~/Máy tính/data.csv")
head(printer_data ,10) #In kết quả 10 dòng đầu tiên

# 3.2.CHỌN BIẾN CẦN PHÂN TÍCH

# Lấy các biến liên quan đến độ nhám (roughness)
new_DF <- printer_data[,c("layer_height","wall_thickness","infill_density",
                          "infill_pattern","nozzle_temperature","bed_temperature","print_speed",
                          "material","fan_speed","roughness")]
head(new_DF,10)

# 3.3. KIỂM TRA DỮ LIỆU KHUYẾT

# Kiểm tra giá trị thiếu (NA)
colSums(is.na(new_DF))
# 3.4. KIỂM TRA NGOẠI LAI (OUTLIERS)x
# Chọn các biến liên tục
continous_data <- new_DF[,c("layer_height","wall_thickness","infill_density",
                            "nozzle_temperature","bed_temperature","print_speed",
                            "fan_speed","roughness")]

# Dùng IQR để phát hiện ngoại lai
sapply(continous_data, function(x) {
  out <- x < quantile(x,0.25) - 1.5*IQR(x) |
    x > quantile(x,0.75) + 1.5*IQR(x)
  
  c(count = sum(out),        # số lượng outlier
    rate = round(mean(out)*100,2)) # tỷ lệ %
})
# Kiểm tra dữ liệu print_speed
table(new_DF$print_speed)

# 3.5. KIỂM TRA DỮ LIỆU TRÙNG LẶP

# Kiểm tra bản ghi trùng lặp
sum(duplicated(new_DF))

# 3.6. KHAI BÁO BIẾN PHÂN LOẠI

# Chuyển biến phân loại sang factor
new_DF$infill_pattern <- as.factor(new_DF$infill_pattern)
new_DF$material <- as.factor(new_DF$material)

#Cấu trúc và kiểu dữ liệu của các bước sau tiền xử lý
str(new_DF)

