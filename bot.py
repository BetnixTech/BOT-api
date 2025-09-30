from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from datetime import datetime
from typing import List

app = FastAPI(title="Multi-Language Bot API")

bots = []

class Bot(BaseModel):
    id: int
    name: str
    type: str
    status: str
    created_at: datetime

class SpawnBotRequest(BaseModel):
    name: str
    type: str

class ActionBotRequest(BaseModel):
    id: int
    action: str

@app.post("/bot/spawn", response_model=Bot)
def spawn_bot(req: SpawnBotRequest):
    bot_id = len(bots) + 1
    bot = Bot(id=bot_id, name=req.name, type=req.type, status="idle", created_at=datetime.utcnow())
    bots.append(bot)
    return bot

@app.get("/bot/list", response_model=List[Bot])
def list_bots():
    return bots

@app.post("/bot/action", response_model=Bot)
def bot_action(req: ActionBotRequest):
    bot = next((b for b in bots if b.id == req.id), None)
    if not bot:
        raise HTTPException(status_code=404, detail="Bot not found")
    bot.status = req.action
    return bot
