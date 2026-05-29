from fastapi import APIRouter
import database
import queries.student1_queries as st1_queries
from models import student1_models as st1_models

router = APIRouter()

# GET-STATEMENTS


# Get 4 random tips for student1page1.html
@router.get("/four_random_tips")
def get_four_random_tips():
    query = st1_queries.four_random_tips_query
    result = database.execute_sql_query(query)

    tips = []
    for row in result:
        tips.append({
            "TipID": row[0],
            "icon": row[1],
            "title": row[2],
            "description": row[3]
        })

    return {"tips": tips}


# Get 4 random coaches info for student1page2.html
# not really need
@router.get("/four_random_coaches")
def get_four_random_coaches():
    query = st1_queries.four_random_coaches_query
    result = database.execute_sql_query(query)

    coaches = []
    for row in result:
        coaches.append({
            "CoachID": row[0],
            "icon": row[1],
            "naam": row[2],
            "voornaam": row[3],
            "specialisatie": row[4]
        })

    return {"coaches": coaches}


# Get a full coach-list for student1page2.html
@router.get("/coach_list")
def get_coach_list():
    query = st1_queries.coach_list_query
    result = database.execute_sql_query(query)

    coaches = []
    for row in result:
        coaches.append({
            "CoachID": row[0],
            "icon": row[1],
            "naam": row[2],
            "voornaam": row[3],
            "specialisatie": row[4]
        })

    return {"coaches": coaches}


# Get a "afspraken"-list for student1page2.html
@router.get("/afspraken")
def get_afspraken():
    query = st1_queries.get_popup_list
    result = database.execute_sql_query(query)

    return {"afspraken": result}


# POST-STATEMENTS
@router.post("/afspraak")
def create_afspraak(data: st1_models.AfspraakInput):
    query = st1_queries.insert_afspraak_query
    params = (data.coachid, data.klantnaam, data.datum)

    database.execute_sql_query(query, params)

    return {"message": "Afspraak succesvol vastgelegd!"}


# POST The deletion of a selected "afspraak"
@router.delete("/afspraak/{afspraakid}")
def delete_afspraak(afspraakid: int):
    query = "DELETE FROM fitness.afspraken WHERE afspraakid = %s"
    params = (afspraakid,)
    database.execute_sql_query(query, params)
    return {"message": "Afspraak verwijderd"}

# Code used to debug during development!!!!

# from fastapi import Request
# @router.post("/afspraak")
# async def create_afspraak(request: Request):
#     print("RAW BODY:", await request.body())
#     data = await request.json()
#     print("JSON BODY:", data)
#     return {"message": "debug"}
