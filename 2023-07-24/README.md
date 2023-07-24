# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note

### keeper_db 1.20.0-renew8.2

20230724 DB 업데이트
- `member_job`
  - ROLE_INFRA_전산관리자 직책이 추가되었습니다.
- `game_member_info`
  - UNIQUE key 설정을 (`member_id`, `play_date`) 쌍으로 변경했습니다.
- `category`
  - 사용하지 않는 컬럼인 `parent_id`와 `href`를 지웠습니다.
  - 사용하지 않는 데이터들을 정리하고, 프론트와 맞춰서 사용하게 될 카테고리 데이터를 추가했습니다.
