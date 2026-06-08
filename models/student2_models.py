# Name: Rene
# Class: Van Asch
# R-number: r1089588
# branch dat ik werk: rene-contactpagina

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

class FAQItem(BaseModel):
    id: int
    question: str
    answer: str

class HoursItem(BaseModel):
    days: str
    time: str


