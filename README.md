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
git clone https://github.com/USERNAME/REPO_NAME.git
```

Ví dụ:

```bash
git clone https://github.com/phu/statistic-project.git
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

## KHÔNG commit trực tiếp vào main

Mỗi người phải tạo branch riêng.

Ví dụ:

```bash
git checkout -b feature/report
```

Hoặc:

```bash
git checkout -b feature/data-cleaning
```

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
git commit -m "Finish introduction section"
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
├── report/        # report
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