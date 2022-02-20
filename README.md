

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.21.0
- 20220220 DB패치노트
- 새 컬럼이 추가되었습니다. `game_member_info` @gusah009 
    - 하루에 해당 게임으로 얻은 포인트를 저장하는 컬럼입니다.
    - `dice_day_point` `INT` `NOT NULL` `DEFAULT 0`
    - `roulette_day_point` `INT` `NOT NULL` `DEFAULT 0`
    - `lotto_day_point` `INT` `NOT NULL` `DEFAULT 0`