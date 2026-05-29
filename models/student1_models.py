from pydantic import BaseModel


# POST a new "afspraak"
class AfspraakInput(BaseModel):
    coachid: int
    klantnaam: str
    datum: str
