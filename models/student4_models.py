from pydantic import BaseModel
import datetime


class Grouplesson(BaseModel):
    grouplessonId: int
    name: str
    minAttendants: int
    maxAttendants: int


class Planning(BaseModel):
    planningId: int
    grouplessonId: int
    weekday: int
    startTime: datetime.time
    endTime: datetime.time


class Attendants(BaseModel):
    attendantsId: int
    planningId: int
    lessonDate: str
    attendants: int
