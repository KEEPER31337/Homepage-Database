

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.2.1
@codnjs8221 선생님의 빠른 피드백을 듣고 몇가지 사항을 수정했습니다.(사실상 수정도 선생님이 한 격...)
- CURRENT_DATETIME은 존재하지 않으며 CURRENT_DATE 등은 소괄호로 감싸주어야 DEFAULT 적용이 된다. <https://mimah.tistory.com/entry/MySQL-MySQL-8%EC%97%90%EC%84%9C-DATE-default-%ED%98%84%EC%9E%AC-%EB%82%A0%EC%A7%9C|관련 블로그글>
- int가 unsigned 적용이 한쪽에만 되어있으면 fk연결에서 오류가 난다.
- member의 register_date를 datetime 타입으로 변경