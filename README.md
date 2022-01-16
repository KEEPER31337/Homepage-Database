

# Homepage-Database

키퍼 홈페이지 데이터베이스

## Recent Patch note
### keeper_db 0.3.0
- member layer의 table들에게 auto_increment를 전부 부여했습니다.
    - member_has_member 제외
- member_type/job/rank에 기본 데이터를 insert했습니다
    - member의 member_type/rank id에도 DEFAULT로 각각 비회원/일반회원을 가르키도록 설정했습니다.
- point,level DEFAULT를 0으로 설정했습니다.
- member table의 foreign key가 잘못된 곳을 가르키는 것을 수정했습니다.
    - @youareso98 고마우이...
- password의 타입을 varchar(60) -> varchar(512)로 교체하였습니다.
- 초기에 다 같이 잘못한 설정도 다수 있고 제가 실수한 부분도 많네요. 기타 개선사항 및 건의사항은 언제든 환영입니다!