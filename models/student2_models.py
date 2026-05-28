from pydantic import BaseModel
from datetime import datetime

# Model voor inkomende data van contactformulier (post request)
class ContactMessageCreate(BaseModel):
    name: str
    reason: str
    email: str
    message: str
    terms_accepted: bool

class ContactMessageResponse(BaseModel):
    id: int
    name: str
    reason: str
    email: str
    message: str
    terms_accepted: bool
    created_at: datetime

