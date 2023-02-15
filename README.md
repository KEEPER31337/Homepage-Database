# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note

### keeper_db 1.20.0-renew3.0

-   20230215 DB 업데이트
    -   `comment` `category`
        -   게시판 파트의 두 테이블이 이제 `parent_id` 컬럼을 self referencing 하도록 변경되었습니다.
        -   이에, `parent_id` 가 0이었던 모든 데이터는 NULL로 전환되며, 컬럼도 nullable하게 변경되었습니다.
-   컬럼명이 변경 / 삭제되었습니다. `book`
    -   `total` -> `total_quantity`
    -   `enable` -> `current_quantity`
    -   `borrow` 삭제
-   컬럼과 트리거가 추가/삭제되었습니다.`book_borrow_info`
    -   `expire_date` default value가 없어졌습니다.
        -   이에, INSERT 될 때 `expire_date` 가 NULL이면 borrow_date 로부터 14일을 더한 값을 넣어주는 트리거를 추가했습니다.
        -   단, `borrow_date` 가 UPDATE 되더라도, `expire_date`가 자동으로 변경되지는 않습니다.
    -   `register_time` `update_time` 이 추가되었습니다.
        -   UPDATE가 동작하면 `update_time`또한 현재시각으로 자동 변경되는 트리거를 추가했습니다.
    -   `quantity` 삭제
