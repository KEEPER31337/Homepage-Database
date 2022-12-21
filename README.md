

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 1.20.0
- 20221221 DB 업데이트
    - 문제가 여러 Category를 가질 수 있게 하라는 요청에 따라, ctf_challenge와 ctf_challenge_category와의 관계가 1:N에서 N:M으로 변화했습니다.
    - 새 테이블이 생성되었습니다. ctf_challenge_has_tf_challenge_category
        - 각 컬럼들은 양 테이블의 id를 나타냅니다.
    - 컬럼이 삭제되었습니다. ctf_challenge.category_id
        - 해당 컬럼에 있던 내용은 NULL 값을 제외하고 모두 새 테이블로 이동할 것입니다.