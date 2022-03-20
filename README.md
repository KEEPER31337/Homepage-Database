

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.31.0
- 20220320 DB 패치노트
    - 기본 값이 수정되었습니다.
        - `file` `thumbnail`
            - 누락된 확장자들을 추가했습니다.
            - 도서, 소개글의 디폴트 이미지 정보를 추가했습니다.
            - `thumbnail` 테이블에 더미 데이터를 추가했습니다. 더미데이터는 디폴트 이미지들이 연속된 `id` 를 가지도록 보장하기 위함입니다.
        - `category`
            - `virtual_category`를 제외한 불필요한 기본 값들을 삭제 했습니다. 
- 해당 내용들은 이미 배포서버에 적용되었으므로 `update.sql`은 없습니다!