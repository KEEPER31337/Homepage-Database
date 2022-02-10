

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.14.0
- 20220210 DB패치노트
- `member` 테이블
    - virtual member의 id가 1로 변경되었습니다.
    - 탈퇴회원 관련 로직을 작성하실때 참고하시기 바랍니다. @codnjs8221 
    - `AUTO_INCREMENT` 설정을 넣으면 id를 0으로 설정 못하더라고요 ㅠㅠ
    - `SQL_MODE`를 바꾸면 0을 넣을 수 있긴 하지만, 기본 값을 넣어주는 inserts 기능에서는 아무것도 입력 안하면 `DEFAULT`를 넣어서 에러가 납니다. 여기서 0을 넣어서 그런듯.
- `book_department` 테이블이 새로 생성되었습니다. @woduf0628 
    - 도서의 유형을 나타냅니다.
    - 기본 값은 대조표에 기록해두었습니다.
    - 이에, `book` 테이블에 `department` 컬럼이 생성되었으며, `book_department`의 `id`값을 가르킵니다.