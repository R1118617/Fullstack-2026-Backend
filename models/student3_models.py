from pydantic import BaseModel


class member(BaseModel):
    lastname: str
    firstname: str
    email: str
    membershipID: int
    trainerID: int = None
