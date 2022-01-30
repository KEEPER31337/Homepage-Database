

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.10.0
- 20220130 DB 패치노트
    - `member_job` 테이블 기본값 변경 @gusah009 
        - 모든 직위명 앞에 "ROLE_"이 붙도록 수정되었습니다.
        - `member_has_member_job`의 PK로 `id` 컬럼이 새로 추가되었습니다.
    - `category` 테이블에 `parent_id` 컬럼을 추가했습니다. 
        - 부모 게시판을 가르키는 컬럼입니다.
        - `default`는 존재하지 않는 id 0 입니다.
        - (db이관시 조정 필요!)
        - @youareso98 제보 감사합니다!