from fastapi import APIRouter
import database
from models.student4_models import Attendants
from queries import student4_queries as queries
import datetime
import random

router = APIRouter()


@router.get("/actual_lessons")
def actual_lessons(weekday:int,time:str):
    sqlQuery = queries.get_actual_lessons_query
    result = database.execute_sql_query(sqlQuery, query_parameters=(weekday,time, time, ))
    return {"lessons": result}


@router.get("/actual_attendants")
def attendants_in_lesson(planningId: int, lessonDate: datetime.date):
    sqlQuery = queries.get_actual_attendants_at_lessons_query
    attendants = database.execute_sql_query(sqlQuery, query_parameters=(planningId, lessonDate, ))

    # If nothing found in database; pick a random number and save it in the database
    # This is not done in a live environment but we have to tweak real-life a bit ;)
    if not attendants:
        # get course to find maximum attendants (so we cannot generate a number higher than the max attendants allowed)
        print("No attendants found; create a randomized number and save it in the database for class ", planningId, "on lessondate ", lessonDate)
        sqlQuery = queries.get_lesson_information_on_planningId
        result = database.execute_sql_query(sqlQuery, query_parameters=(planningId, ))
        data = result[0]

        # Create random number between result[1] and result[2] because no data is found for this lesson
        # data[1] = maximum attendants, data[2] = minimum attendants for grouplesson
        attendants = random.randint(data[2], data[1])
        print (attendants)

        # Random number of attendants is created; now save it in the database
        # print (planningId)
        # print (lessonDate)
        # print (attendants)
        sqlQuery = queries.save_number_of_attendants
        database.execute_sql_query(sqlQuery, query_parameters = (planningId, lessonDate, attendants, ))

        # Execute regular query to also retrieve id
        sqlQuery = queries.get_actual_attendants_at_lessons_query
        attendants = database.execute_sql_query(sqlQuery, query_parameters=(planningId, lessonDate,))

    return {"attendants": attendants}


@router.post("/save_attendants")
def save_attendants(attendants: Attendants):
    print (attendants.lessonDate)
    print (attendants.planningId)
    print (attendants.attendants)
    sqlQuery = queries.save_number_of_attendants
    database.execute_sql_query(sqlQuery, query_parameters=(
        attendants.planningId,
        attendants.lessonDate,
        attendants.attendants,
    ))
    return True


@router.post("/update_attendants")
def update_attendants(attendants: Attendants):

    print(attendants.lessonDate)
    print(attendants.attendants)
    print(attendants.attendantsId)

    sqlQuery = queries.update_number_of_attendants
    database.execute_sql_query(sqlQuery, query_parameters=(
        attendants.lessonDate,
        attendants.attendants,
        attendants.attendantsId
    ))
