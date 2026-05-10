# Statistic Project - Team Workflow Guide

## 1. Cài đặt cần thiết

Mỗi thành viên cần cài:

- Git
- R
- RStudio

### Git Download

- Windows: https://git-scm.com/downloads

Sau khi cài xong, mở terminal và kiểm tra:

```bash
git --version
```

---

# 2. Clone project về máy

Mỗi người chỉ cần làm bước này 1 lần.

Mở terminal trong RStudio:

```txt
Tools -> Terminal -> New Terminal
```

Chạy:

```bash
git clone https://github.com/PhuDongMinh/statistic_project.git
```

Ví dụ:

```bash
git clone https://github.com/PhuDongMinh/statistic_project.git
```

Sau đó mở file:

```txt
statistic-project.Rproj
```

---

# 3. Đồng bộ package R

Trong RStudio Console:

```r
install.packages("renv")
renv::restore()
```

Lệnh này sẽ tự cài đúng package cho project.

---

# 4. Quy tắc làm việc nhóm

## Không code trực tiếp trên `main`

`main` là phiên bản ổn định của project.

Để tránh:
- ghi đè code của nhau
- mất thay đổi
- conflict khi nhiều người sửa cùng một file

mỗi người sẽ làm việc trên branch(nhánh,là bản copy của code) riêng, sau đó mới merge(ghép) vào `main`.

---

## Tạo branch riêng cho task của mình

Ví dụ:

```bash
git checkout -b feature/report
``` 

Hoặc:

```bash
git checkout -b feature/data-cleaning
```

Tên branch nên mô tả công việc đang làm.

---

# 5. Workflow mỗi lần làm việc

## Bước 1 — Pull code mới nhất

Trước khi code:

```bash
git checkout main
git pull
```

---

## Bước 2 — Chuyển sang branch cá nhân

```bash
git checkout feature
```

---

## Bước 3 — Code

Làm phần được giao.

---

## Bước 4 — Add + Commit

```bash
git add .
git commit -m "Commit message"
```

Commit message phải mô tả rõ đã làm gì.

Ví dụ tốt:

```txt
Add data visualization
Fix regression bug
Write methodology section
```

Ví dụ xấu:

```txt
update
fix
done
```

---

## Bước 5 — Push lên GitHub

```bash
git push origin feature/report
```

---

## Bước 6 — Tạo Pull Request

Lên GitHub:

- Chọn branch
- Bấm "Compare & Pull Request"
- Merge vào `main`

---

# 6. Nếu bị conflict

KHÔNG tự ý sửa nếu chưa hiểu.

Hãy:

```bash
git pull
```

Nếu conflict xuất hiện:

- báo cho nhóm
- cùng sửa conflict

---

# 7. Cấu trúc project

```txt
project/
│
├── data/          # dataset
├── code/          # file R
├── report/        # report, optimal
├── figures/       # graph/result
├── renv/          # renv config
├── renv.lock
└── project.Rproj
```

---

# 8. Những file KHÔNG được chỉnh tùy tiện

Không sửa nếu không cần:

```txt
renv.lock
.gitignore
```

---

# 9. Những file KHÔNG được push

Đã được ignore:

```txt
.Rproj.user
.Rhistory
.RData
renv/library/
```

---

# 10. Một số lệnh Git quan trọng

## Kiểm tra trạng thái

```bash
git status
```

---

## Xem branch hiện tại

```bash
git branch
```

---

## Chuyển branch

```bash
git checkout BRANCH_NAME
```

---

## Tạo branch mới

```bash
git checkout -b NEW_BRANCH
```

---

## Pull code mới

```bash
git pull
```

---

## Push code

```bash
git push
```

---

# 11. Rule của team

- Không push trực tiếp vào `main`
- Commit message phải rõ ràng
- Pull trước khi bắt đầu code
- Không sửa code người khác nếu chưa trao đổi
- Không upload file rác / file nặng
- Mỗi người phụ trách folder/phần riêng

---

# 12. Khi gặp lỗi

Chụp màn hình lỗi + gửi terminal/log vào group.

Không tự xóa file lung tung trong project.

# 13. Coding Rules

## Rule 1 — Script phải chạy độc lập

Mọi script phải có thể chạy trực tiếp từ root project.

Đúng:

```r
source("code/utils.R")

df <- read.csv("data/processed/clean_data.csv")
```

Sai:

```r
setwd("C:/Users/...")
```

Không dùng `setwd()`.

Project phải hoạt động giống nhau trên mọi máy.

---

## Rule 2 — Không hardcode path

Sai:

```r
read.csv("C:/desktop/project/data.csv")
```

Đúng:

```r
read.csv("data/processed/clean_data.csv")
```

Luôn dùng relative path.

---

## Rule 3 — Comment theo block

Script phải chia block rõ ràng.

Ví dụ:

```r
# ====================================
# Normality checking
# ====================================

shapiro.test(df$tension_strength)
```

Không viết toàn bộ script thành một khối dài.

---

## Rule 4 — Figure export standardized

Mọi figure phải export bằng code.

Ví dụ:

```r
png("figures/fig_histogram.png")

hist(df$tension_strength)

dev.off()
```

Không screenshot figure thủ công từ RStudio.