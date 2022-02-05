

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.12.0
- 20220205 DB패치노트
- `attendance`  
    - 당일의 1,2,3등 순위 여부를 저장하는 컬럼 `rank` 가 추가되었습니다. `int` `NULL` 입니다. @gusah009 
        - 멤버 정보 표시 시, 멤버 별로 `attendance`를 `SELECT`할 때, 오버헤드를 방지하기 위해 추가되었습니다.
- `category`
    - 기본값 `root_category` row가 삭제되었습니다. @youareso98 