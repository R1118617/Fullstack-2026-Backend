random_review = "SELECT firstname, lastname, review FROM fitness.member WHERE review IS NOT NULL ORDER BY RANDOM() LIMIT 1"

get_all_trainers= "SELECT firstname, lastname, speciality, availability FROM fitness.trainer"

get_available_trainers= "SELECT firstname, lastname, speciality FROM fitness.trainer WHERE availability = TRUE"

create_new_member = "INSERT INTO fitness.member (lastname, firstname, email, membershipID, trainerID, review) VALUES (%s, %s, %s, %s, %s, %s);"