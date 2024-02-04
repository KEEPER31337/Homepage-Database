-- -----------------------------------------------------
-- Insert member type/rank/job data.
-- -----------------------------------------------------

INSERT INTO member_type(name) VALUES ("비회원"),("정회원"),("휴면회원"),("졸업"),("탈퇴");
INSERT INTO member_rank(name) VALUES ("일반회원"),("우수회원");
INSERT INTO member_job(name) VALUES ("회장"),("부회장"),("대외부장"),("학술부장"),("전산관리자"),("서기"),("총무"),("사서");

-- -----------------------------------------------------
-- Insert static_write type data.
-- -----------------------------------------------------
INSERT INTO static_write_type(name) VALUES ("about"),("activity"),("excellence"),("history");