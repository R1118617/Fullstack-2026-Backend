from fastapi import APIRouter
import database
from models.student4_models import Attendants
from queries import student4_queries as queries
import datetime
import random

router = APIRouter()


@router.get("/actual_lessons")
# Retrieves the actual lessons on a given weekday at a given time
def actual_lessons(weekday: int, time: str):
    sqlquery = queries.get_actual_lessons_query
    result = database.execute_sql_query(
        sqlquery, query_parameters=(weekday, time, time, ))
    return {"lessons": result}


@router.get("/actual_attendants")
# Retrieves the actual attendants for a specific lesson on a specific date
# The time is not that necessary since that is specified in the planning (using planningid)
def attendants_in_lesson(planningid: int, lessondate: datetime.date):
    sqlquery = queries.get_actual_attendants_at_lessons_query
    attendants = database.execute_sql_query(
        sqlquery, query_parameters=(planningid, lessondate,))

    # If nothing found in database; pick a random number and
    # save it in the database
    # This is not done in a live environment but we have to tweak
    # real-life a bit ;)
    if not attendants:
        # get course to find maximum attendants (so we cannot
        # generate a number higher than the max attendants allowed)
        print("No attendants found; create a randomized number \
        and save it in the database for class ", planningid,
              "on lessondate ", lessondate)
        sqlquery = queries.get_lesson_information_on_planningId
        result = database.execute_sql_query(
            sqlquery, query_parameters=(planningid,))
        data = result[0]

        # Create random number between result[1] and result[2]
        # because no data is found for this lesson
        # data[1] = maximum attendants,
        # data[2] = minimum attendants for grouplesson
        attendants = random.randint(data[2], data[1])
        # print (attendants)

        # Random number of attendants is created; now save it in the database
        # print (planningId)
        # print (lessonDate)
        # print (attendants)
        sqlquery = queries.save_number_of_attendants
        database.execute_sql_query(sqlquery, query_parameters=(
            planningid, lessondate, attendants,))

        # Execute regular query to also retrieve id
        sqlquery = queries.get_actual_attendants_at_lessons_query
        attendants = database.execute_sql_query(
            sqlquery, query_parameters=(planningid, lessondate,))

    return {"attendants": attendants}


@router.post("/save_attendants")
def save_attendants(attendants: Attendants):
    # debug variables; disabled.
    # print(attendants.lessonDate)
    # print(attendants.planningId)
    # print(attendants.attendants)
    sqlquery = queries.save_number_of_attendants
    database.execute_sql_query(sqlquery, query_parameters=(
        attendants.planningId,
        attendants.lessonDate,
        attendants.attendants,
    ))
    return True


@router.post("/update_attendants")
def update_attendants(attendants: Attendants):

    # Debug variables; disabled
    # print(attendants.lessonDate)
    # print(attendants.attendants)
    # print(attendants.attendantsId)

    sqlquery = queries.update_number_of_attendants
    database.execute_sql_query(sqlquery, query_parameters=(
        attendants.lessonDate,
        attendants.attendants,
        attendants.attendantsId
    ))
    return True
