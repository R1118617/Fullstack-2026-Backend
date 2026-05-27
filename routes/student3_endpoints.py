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
