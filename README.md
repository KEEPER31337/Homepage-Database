

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.8.2
- 20220125 핫픽스 - 2
    - `static_write_type` 테이블이 `static_write_title`로 통합되었습니다. `type varchar(40)`
        - 기본값들은 대조표의 기본데이터 시트에 모두 기록되어있으며, 현재 `INSERT`로 type만 넣어주고 있습니다.
        - 이에, `UPDATE`를 사용해 이미 있는 row의 `title` 의 값을 수정하는 것을 권장 드립니다. 