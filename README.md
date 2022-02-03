

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.11.0
- 20220203 DB패치노트
- 필요없는 테이블 `member_entity_roles` 를 삭제했습니다.
- id가 0인 가상 row가 추가되었습니다.
    - `member` 
    - `category`
    - 이상 2개의 테이블에 추가되었습니다.
    - value는 스레드의 댓글을 참조해주세요!