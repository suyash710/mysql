#@author:bhushan

USE collpoll;

DROP VIEW users_profile_view;
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `users_profile_view` AS
    SELECT 
        `admin_profile`.`ukid` AS `ukid`,
        'admin' AS `position`,
        `admin_profile`.`salutation` AS `salutation`,
        `admin_profile`.`f_name` AS `f_name`,
        `admin_profile`.`m_name` AS `m_name`,
        `admin_profile`.`l_name` AS `l_name`,
        `admin_profile`.`department_id` AS `department_id`,
        `admin_profile`.`gender` AS `gender`,
        `admin_profile`.`college_id` AS `college_id`,
        `admin_profile`.`designation_id` AS `designation_id`,
        NULL AS `programme_id`,
        NULL AS `programme_name`,
        NULL AS `year_of_joining`,
        NULL AS `year`,
        NULL AS `section_id`,
        `user_attributes`.`media_id` AS `media_id`,
        `department`.`department_name` AS `department_name`,
        `designation`.`name` AS `designation_name`,
        `college`.`college_name` AS `college_name`,
        `user_attributes`.`user_type` AS `user_type`,
        `user_attributes`.`registration_id` AS `registration_id`,
        `admin_profile`.`bio` AS `bio`,
        NULL AS `sequence_id`,
        `media_object`.`media_location` AS `photo`
    FROM
        (((((`admin_profile`
        LEFT JOIN `user_attributes` ON ((`admin_profile`.`ukid` = `user_attributes`.`ukid`)))
        LEFT JOIN `department` ON ((`admin_profile`.`department_id` = `department`.`department_id`)))
        LEFT JOIN `designation` ON ((`admin_profile`.`designation_id` = `designation`.`id`)))
        LEFT JOIN `college` ON ((`admin_profile`.`college_id` = `college`.`college_id`)))
        LEFT JOIN `media_object` ON ((`media_object`.`media_id` = `user_attributes`.`media_id`))) 
    UNION SELECT 
        `student_profile`.`ukid` AS `ukid`,
        'student' AS `student`,
        NULL AS `NULL`,
        `student_profile`.`f_name` AS `f_name`,
        `student_profile`.`m_name` AS `m_name`,
        `student_profile`.`l_name` AS `l_name`,
        `student_profile`.`department_id` AS `department_id`,
        `student_profile`.`gender` AS `gender`,
        `student_profile`.`college_id` AS `college_id`,
        NULL AS `NULL`,
        `student_profile`.`programme_id` AS `programme_id`,
        `programme`.`programme_name` AS `programme_name`,
        `student_profile`.`year_of_joining` AS `year_of_joining`,
        `student_profile`.`year` AS `year`,
        `student_profile`.`section_id` AS `section_id`,
        `user_attributes`.`media_id` AS `media_id`,
        `department`.`department_name` AS `department_name`,
        NULL AS `NULL`,
        `college`.`college_name` AS `college_name`,
        `user_attributes`.`user_type` AS `user_type`,
        `user_attributes`.`registration_id` AS `registration_id`,
        `student_profile`.`bio` AS `bio`,
        `student_profile`.`sequence_id` AS `sequence_id`,
        `media_object`.`media_location` AS `media_location`
    FROM
        (((((`student_profile`
        LEFT JOIN `user_attributes` ON ((`student_profile`.`ukid` = `user_attributes`.`ukid`)))
        LEFT JOIN `department` ON ((`student_profile`.`department_id` = `department`.`department_id`)))
        LEFT JOIN `college` ON ((`student_profile`.`college_id` = `college`.`college_id`)))
        LEFT JOIN `media_object` ON ((`media_object`.`media_id` = `user_attributes`.`media_id`)))
        LEFT JOIN `programme` ON ((`programme`.`programme_id` = `student_profile`.`programme_id`))) 
    UNION SELECT 
        `prospective_student`.`ukid` AS `ukid`,
        'prospective_student' AS `prospective_student`,
        NULL AS `NULL`,
        `prospective_student`.`f_name` AS `f_name`,
        `prospective_student`.`m_name` AS `m_name`,
        `prospective_student`.`l_name` AS `l_name`,
        NULL AS `department_id`,
        `prospective_student`.`gender` AS `gender`,
        `prospective_student`.`college_id` AS `college_id`,
        NULL AS `NULL`,
        `prospective_student_programme`.`programme_id` AS `programme_id`,
        `programme`.`programme_name` AS `programme_name`,
        `prospective_student`.`year_of_joining` AS `year_of_joining`,
        NULL AS `year`,
        NULL AS `section_id`,
        `user_attributes`.`media_id` AS `media_id`,
        NULL AS `department_name`,
        NULL AS `NULL`,
        NULL AS `college_name`,
        `user_attributes`.`user_type` AS `user_type`,
        `prospective_student`.`registration_id` AS `registration_id`,
        `prospective_student`.`bio` AS `bio`,
        NULL AS `sequence_id`,
        `media_object`.`media_location` AS `media_location`
    FROM
        ((((`prospective_student`
        LEFT JOIN `user_attributes` ON ((`prospective_student`.`ukid` = `user_attributes`.`ukid`)))
        LEFT JOIN `prospective_student_programme` ON ((`prospective_student_programme`.`user_id` = `prospective_student`.`ukid`)))
        LEFT JOIN `media_object` ON ((`media_object`.`media_id` = `user_attributes`.`media_id`)))
        LEFT JOIN `programme` ON ((`programme`.`programme_id` = `prospective_student_programme`.`programme_id`))) 
    UNION SELECT 
        `faculty_profile`.`ukid` AS `ukid`,
        'faculty' AS `faculty`,
        `faculty_profile`.`salutation` AS `salutation`,
        `faculty_profile`.`f_name` AS `f_name`,
        `faculty_profile`.`m_name` AS `m_name`,
        `faculty_profile`.`l_name` AS `l_name`,
        `faculty_profile`.`department_id` AS `department_id`,
        `faculty_profile`.`gender` AS `gender`,
        `faculty_profile`.`college_id` AS `college_id`,
        `faculty_profile`.`designation_id` AS `designation_id`,
        NULL AS `NULL`,
        NULL AS `NULL`,
        NULL AS `NULL`,
        NULL AS `year`,
        NULL AS `NULL`,
        `user_attributes`.`media_id` AS `media_id`,
        `department`.`department_name` AS `department_name`,
        `designation`.`name` AS `name`,
        `college`.`college_name` AS `college_name`,
        `user_attributes`.`user_type` AS `user_type`,
        `user_attributes`.`registration_id` AS `registration_id`,
        `faculty_profile`.`bio` AS `bio`,
        NULL AS `NULL`,
        `media_object`.`media_location` AS `media_location`
    FROM
        (((((`faculty_profile`
        LEFT JOIN `user_attributes` ON ((`faculty_profile`.`ukid` = `user_attributes`.`ukid`)))
        LEFT JOIN `department` ON ((`faculty_profile`.`department_id` = `department`.`department_id`)))
        LEFT JOIN `designation` ON ((`faculty_profile`.`designation_id` = `designation`.`id`)))
        LEFT JOIN `college` ON ((`faculty_profile`.`college_id` = `college`.`college_id`)))
        LEFT JOIN `media_object` ON ((`media_object`.`media_id` = `user_attributes`.`media_id`)))
    ORDER BY `ukId`