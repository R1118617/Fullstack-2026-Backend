from fastapi import APIRouter
import database
from queries import student3_queries

router = APIRouter()

@router.get("/random_review")
def get_random_review():
    query = student3_queries.random_review
    review = database.execute_sql_query(query)
    review_return = []
    for review in review:
        review_return.append({"firstName": review[0], "lastName": review[1], "review": review[2]})
    return review_return

@router.get("/get_all_trainers")
def get_all_trainers():
    query = student3_queries.get_all_trainers
    trainers = database.execute_sql_query(query)
    trainers_return = []
    for trainer in trainers:
        trainers_return.append({"firstName": trainer[0], "lastName": trainer[1], "speciality": trainer[2], "availability": trainer[3]})
    return trainers_return

@router.get("/get_available_trainers")
def get_available_trainers():
    query = student3_queries.get_available_trainers
    trainers = database.execute_sql_query(query)
    trainers_return = []
    for trainer in trainers:
        trainers_return.append({"firstName": trainer[0], "lastName": trainer[1], "speciality": trainer[2]})
    return trainers_return
