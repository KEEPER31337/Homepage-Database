

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 1.5.0
- 20220517 DB 패치노트
- 테이블이 추가되었습니다.
    - `ctf_dynamic_challenge_info`
        - `challenge_id`  : 본 테이블은 별도의 `id` 가 존재하지 않으며, `ctf_challenge.id`와 fk 관계를 가지므로,  해당 `id`값을 넣어주면 됩니다.
        - `max_score`
        - `min_score`