# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note

### keeper_db 1.20.0-renew8.4

20230807 DB 업데이트
- `member_read_posting`
  - 회원이 열람한 게시글을 저장하기 위한 중간 테이블이 생성되었습니다.
- `ctf_challenge_has_ctf_challenge_category`
  - 고유의 `id`값을 PK로 가지고, `ctf_challenge_id`와 `ctf_challenge_category_id`는 FK로 갖게 변경되었습니다.
