# Movies — CRUD cá nhân

**Sinh viên:** Lê Thị Phương ANh 
**MSSV:** 24100148  
**Framework:** NestJS + TypeORM + MySQL  

---

##  Đối tượng phụ trách

Đối tượng: **Movie **

Movie quản lý thông tin các bộ phim đang chiếu và sắp chiếu tại rạp, bao gồm tên phim, thể loại, thời lượng, đạo diễn, diễn viên, ngày phát hành và mô tả.

---

##  Cấu trúc bảng CSDL

```sql
CREATE TABLE movies (
    movie_id     INT AUTO_INCREMENT PRIMARY KEY,
    title        VARCHAR(255) NOT NULL,
    genre        VARCHAR(100),
    duration     INT,
    director     VARCHAR(255),
    actors       TEXT,
    release_date DATE,
    description  TEXT,
    poster       VARCHAR(255)
);
```

---

##  Cấu trúc file

```
src/movies/
├── dto/
│   ├── create-movie.dto.ts 
│   └── update-movie.dto.ts   
├── movie.entity.ts          
├── movies.controller.ts     
├── movies.service.ts         
├── movies.module.ts          
└── READme-movies.md

---

##  API Endpoints

###  Create — Tạo phim mới

```http
POST /movies
Content-Type: application/json

{
  "title": "Avengers: Endgame",
  "genre": "Action",
  "duration": 181,
  "director": "Anthony Russo",
  "actors": "Robert Downey Jr., Chris Evans",
  "release_date": "2019-04-26",
  "description": "Siêu anh hùng đối đầu Thanos",
  "poster": "avengers.jpg"
}
```

**Phản hồi thành công (201 Created):**
```json
{
  "movie_id": 1,
  "title": "Avengers: Endgame",
  "genre": "Action",
  "duration": 181,
  "director": "Anthony Russo",
  "actors": "Robert Downey Jr., Chris Evans",
  "release_date": "2019-04-26",
  "description": "Siêu anh hùng đối đầu Thanos",
  "poster": "avengers.jpg"
}
```

**Phản hồi lỗi :**
```json
{
  "statusCode": 400,
  "message": ["Tên phim không được để trống"],
  "error": "Bad Request"
}
```

---

###  Read — Lấy danh sách / chi tiết phim

**Lấy tất cả phim:**
```http
GET /movies
```

**Lấy 1 phim theo ID:**
```http
GET /movies/1
```

**Phản hồi lỗi (404 Not Found):**
```json
{
  "statusCode": 404,
  "message": "Không tìm thấy phim có id = 99",
  "error": "Not Found"
}
```

---

###  Update — Cập nhật phim

```http
PATCH /movies/1
Content-Type: application/json

{
  "genre": "Sci-Fi",
  "duration": 190
}
```

**Phản hồi thành công (200 OK):**
```json
{
  "movie_id": 1,
  "title": "Avengers: Endgame",
  "genre": "Sci-Fi",
  "duration": 190,
  ...
}
```

---

###  Delete — Xóa phim

```http
DELETE /movies/1
```

**Phản hồi thành công (200 OK):**
```json
{
  "message": "Đã xóa phim có id = 1"
}
```

**Phản hồi lỗi (404 Not Found):**
```json
{
  "statusCode": 404,
  "message": "Không tìm thấy phim có id = 99"
}
```

---

##  Luồng xử lý (Activity Diagram)

| Thao tác | Luồng chính | Luồng lỗi |
|---|---|---|
| **CREATE** | Nhận body → Validate DTO → Lưu DB → 201 Created | 400 (thiếu title / sai dữ liệu) |
| **READ** | Nhận ID → ParseIntPipe → findOne() → 200 OK | 404 (không tìm thấy) |
| **UPDATE** | Nhận ID + body → findOne() → Object.assign() → save() → 200 OK | 404 (không tìm thấy) |
| **DELETE** | Nhận ID → findOne() → remove() → 200 OK + message | 404 (không tìm thấy) |

---

##  Tích hợp vào AppModule

```typescript
import { MoviesModule } from './movies/movies.module';

@Module({
  imports: [
    TypeOrmModule.forRoot({ ... }),
    MoviesModule,
    // ... các module khác
  ],
})
export class AppModule {}
```

---

##  Công nghệ sử dụng

- **NestJS** — Framework backend
- **TypeORM** — ORM kết nối MySQL
- **class-validator** — Validate dữ liệu đầu vào
- **class-transformer** — Transform DTO
- **MySQL** — Hệ quản trị CSDL

---

