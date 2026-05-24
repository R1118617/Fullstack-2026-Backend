festival_name_query = "SELECT name FROM festivaldb.festival;"
festival_name_and_province_query = "SELECT name, province FROM festivaldb.festival;"
festival_by_name = "SELECT name, province FROM festivaldb.festival WHERE name=%s;"
insert_festival_query = "INSERT INTO festivaldb.festival (name, location, startDate, endDate, province, comment) VALUES (%s, %s, %s, %s, %s, %s);"

# Query to get lessons which are currently active (depending on weekday and actual time) including the min and max attendants
get_actual_lessons_query = "select grouplessons.name, grouplessons.minattendants, grouplessons.maxattendants, planning.weekday, planning.starttime, planning.endtime, planning.planningId from fitness.planning inner join fitness.grouplessons on planning.grouplessonId=grouplessons.grouplessonId where planning.weekday=%s and starttime<=%s and endtime>=%s ORDER BY name;"

# Query to get the number of attendants at a given class (uses planningId to reference to class and time and a date).
get_actual_attendants_at_lessons_query = "SELECT attendants.attendants, attendants.attendantsId FROM fitness.attendants WHERE attendants.planningId=%s and lessonDate=%s;"

# Query to get info for a specific lesson (e.g. name, maxattendants and minattendants)
get_lesson_information_on_planningId = "SELECT grouplessons.name, grouplessons.maxattendants, grouplessons.minattendants FROM fitness.grouplessons INNER JOIN fitness.planning ON grouplessons.grouplessonId = planning.grouplessonId WHERE planningId=%s;"

# Query to save the number of attendants of a specific class
save_number_of_attendants = "INSERT INTO fitness.attendants (planningId, lessonDate, attendants) VALUES (%s, %s, %s);"

# Query to update the number of attendants of a specific class
update_number_of_attendants = "UPDATE fitness.attendants SET lessonDate=%s, attendants=%s WHERE attendantsId=%s;"
