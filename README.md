

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 1.19.0
- 20221130 DB 업데이트
    - CTF 플래그 입력에  Brute force 방지를 위한 새 컬럼들이 추가되었습니다.
    - <https://github.com/KEEPER31337/Homepage-Back/issues/462|관련 이슈>
        - `ctf_challenge.max_submit_count`
            - ctf 문제의 최대 제출 횟수입니다. 기본 값은 1입니다.
            - `INT` `NOT NULL` `DEFAULT 1`
        - `ctf_flag.remained_submit_count`
            - 문제, 팀 개별마다 남은 제출 횟수입니다.
            - flag row가 처음 생성될 때 위의 최대 제출 횟수로 설정되고, 제출할 때마다 감소하는 식으로 저장될 것입니다.
        - `ctf_flag.last_try_time`
            - 문제, 팀 개별마다 마지막으로 시도한 시간입니다.
            - update 스크립트에는 이전 log를 참조하여 UPDATE 되게 설정했습니다.
            - 같은 테이블의 `solved_time`은 성공한 시간만을 저장하는 것으로 차이가 있습니다.
