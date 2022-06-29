# FactoryBot
## createで発行されるSQL
```ruby
FactoryBot.create(:post)
```
をすると、下記のようなSQLが流れた。  
```bash
TRANSACTION (1.8ms)  BEGIN
TRANSACTION (1.0ms)  SAVEPOINT active_record_1
Post Create (6.6ms)  INSERT INTO "posts" ("title", "body", "user_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["title", "title-1"], ["body", "body-1"], ["user_id", nil], ["created_at", "2022-06-29 13:50:42.223565"], ["updated_at", "2022-06-29 13:50:42.223565"]]
TRANSACTION (0.8ms)  RELEASE SAVEPOINT active_record_1
TRANSACTION (0.8ms)  SAVEPOINT active_record_1
Tag Create (5.2ms)  INSERT INTO "tags" ("name", "created_at", "updated_at") VALUES ($1, $2, $3) RETURNING "id"  [["name", "tag-1"], ["created_at", "2022-06-29 13:50:42.243645"], ["updated_at", "2022-06-29 13:50:42.243645"]]
TRANSACTION (0.8ms)  RELEASE SAVEPOINT active_record_1
TRANSACTION (1.3ms)  SAVEPOINT active_record_1
PostTag Create (5.3ms)  INSERT INTO "post_tags" ("post_id", "tag_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["post_id", 1], ["tag_id", 1], ["created_at", "2022-06-29 13:50:42.267385"], ["updated_at", "2022-06-29 13:50:42.267385"]]
TRANSACTION (0.8ms)  RELEASE SAVEPOINT active_record_1
TRANSACTION (1.5ms)  ROLLBACK
```
「レコードが作成される」と書かれていることが多いが、  
実際にはセーブポイントが作成され、ロールバックされている。INSERT-COMMITはされていない。