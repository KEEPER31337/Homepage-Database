

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.9.0
- 20220125 DB패치노트
    - 친구관계를 저장하는 `friend` 테이블을 추가했습니다.
        - 친구 등록을 신청한 `follower`
        - 신청대상인 `followee`
        - 위 두 컬럼은 모두 `member` 테이블의 fk입니다.