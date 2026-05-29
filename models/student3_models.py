from pydantic import BaseModel


class Member(BaseModel):
    lastName: str
    firstName: str
    email: str
    membershipID: int
    trainerID: int = None
    review: str = None
