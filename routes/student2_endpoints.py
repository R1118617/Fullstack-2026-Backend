from fastapi import APIRouter
import database
from models import student2_models as models
import queries.student2_queries as queries

router = APIRouter()


# POST ENDPOINT: Nieuw bericht toevoegen
@router.post("/contact")
def create_contact_message(message: models.ContactMessageCreate):
    values = (message.name, message.reason, message.email,
    message.message, message.terms_accepted)
    database.execute_sql_query(queries.query_insert_message, values)

    return {"status": "success", "detail": "Bericht is succesvol verzonden."}


# GET ENDPOINT: Berichten ophalen
@router.get("/contact")
def get_contact_messages(reason: str = None):
    if reason:
        result = database.execute_sql_query(
        queries.query_get_messages_by_reason, (reason,))
    else:
        result = database.execute_sql_query(queries.query_get_all_messages)

    return {"messages": result}
