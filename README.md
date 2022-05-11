

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 1.3.0
- 20220511 DB 패치노트
- CTF 관련 테이블들이 추가되었습니다.
    - `ctf_challenge`  : CTF 문제를 기록해두는 테이블입니다.
    - `ctf_challenge_category` : CTF 문제의 분류를 기록해두는 테이블입니다.(`System`, `Web`등...) 
    - `ctf_challenge_type`  :  CTF 문제의 유형을 기록해두는 테이블입니다.(`STANDARD`, `DYNAMIC`등...)
    - `ctf_contest` :   CTF 대회를 기록해두는 테이블입니다. 
    - `ctf_flag`  :  CTF의 팀별 플래그와 해결여부를 기록해두는 테이블입니다.
    - `ctf_submit_log`  :  CTF 제출기록을 기록해두는 테이블입니다. 
    - `ctf_team` :  CTF 팀을 기록해두는 테이블입니다. 
    - `ctf_team_has_member`  :  CTF 팀에 속한 멤버를 기록해두는 테이블입니다.
- 공유시트에도 추가해놨으니 혹시 컬럼명이나 테이블 구조가 불-편 하신분들은 언제든지 피드백 부탁드립니다!
    - <https://docs.google.com/spreadsheets/d/1R6xcDreU5H20az8q_tPJph3iiJ4tojvRVW_XeTst2Sw/edit#gid=1342406647>
