# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note

### keeper_db 1.20.0-renew2.0

- 20230205 DB 업데이트
- 어색한 컬럼 명, 타입 제보는 언제든 환영입니다🙌
  - `book`
    - `department` -> `book_department_id`
  - `study`
    - 다음 3개의 컬럼이 `NOT NULL` 로 변화했습니다.
    - `information` `head_member_id` `register_time`
