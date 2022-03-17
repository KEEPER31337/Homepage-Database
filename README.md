

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.30.1
- 20220317 DB 핫픽스 1
    - `init.sql` 의 외래키 관련 버그가 해결되었습니다. @youareso98 
        - workbench에서 `init.sql`을 자동 생성 시킬때 `thumbnail` 테이블의 기본값을 나중에 `INSERT`해서 생긴 문제였습니다.
        - workbench는 뭔가 알아서 잘해줄 것 같았는데... 이런 문제가 있었네요 ㅠㅠㅠㅜ 앞으로 init 생성시킬때 조심하겠습니다!
