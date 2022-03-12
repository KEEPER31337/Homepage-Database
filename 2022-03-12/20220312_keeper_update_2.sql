START TRANSACTION;
USE `keeper`;
INSERT INTO `keeper`.`static_write_content` (`id`, `content`, `static_write_subtitle_image_id`, `display_order`) VALUES (DEFAULT, '코드게이트 본선 진출', 20, 1);
INSERT INTO `keeper`.`static_write_content` (`id`, `content`, `static_write_subtitle_image_id`, `display_order`) VALUES (DEFAULT, '제6회 동서발전 정보보안 온라인 경진대회 우수상', 18, 2);
INSERT INTO `keeper`.`static_write_content` (`id`, `content`, `static_write_subtitle_image_id`, `display_order`) VALUES (DEFAULT, '화이트해커 양성 프로젝트 참여', 19, 1);
INSERT INTO `keeper`.`static_write_content` (`id`, `content`, `static_write_subtitle_image_id`, `display_order`) VALUES (DEFAULT, '전국 연합 동아리 CCA 가입', 20, 2);
INSERT INTO `keeper`.`static_write_content` (`id`, `content`, `static_write_subtitle_image_id`, `display_order`) VALUES (DEFAULT, '영남권 연합 동아리 참여', 20, 3);
INSERT INTO `keeper`.`static_write_content` (`id`, `content`, `static_write_subtitle_image_id`, `display_order`) VALUES (DEFAULT, '암호동아리 지원사업 참가', 19, 2);

COMMIT;