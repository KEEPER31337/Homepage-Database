

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 1.18.0
- 20221124 DB 업데이트
    - 새 컬럼이 추가되었습니다.
    - `ctf_team.last_solved_time`
        - 무슨 팀이 현재 자신의 점수에 언제 도달했는지 나타내기 위한 컬럼입니다.
        - `NOT NULL`이며, `DEFAULT`로 현재 시간이 들어가도록 설정했습니다.
- `last_solved_time`을 해당 팀이 속한 대회의 생성시간으로 update하고, 그 다음에 `ctf_submit_log`를 참조하여 마지막으로 맞춘 문제의 제출 시간으로 update하는 것으로 처리했습니다!