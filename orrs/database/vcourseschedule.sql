CREATE VIEW vCourseSchedule AS
SELECT 
	s.id,	
	c.name AS tutor_name,
    c.code AS train_name,
    s.code,
    s.region_location,
	s.premium_class_fare,
	s.description,
	s.schedule_date,
	s.standard_class_fare,
	s.date_created,
	s.type,
	s.is_repeating
	s.repeating_data
	s.time_schedule,
	s.delete_flag,
	s.train_id
	

FROM 
    train_list c
LEFT JOIN 
     schedule_list s ON s.train_id = c.id;