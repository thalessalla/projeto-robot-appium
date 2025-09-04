from dotenv import load_dotenv
from pathlib import Path
import os
from robot.api.deco import keyword
from pymongo import MongoClient


env_path = Path(__file__).resolve().parent.parent.parent / "apps" / "api" / ".env"


load_dotenv(dotenv_path=env_path)

mongo_uri = os.getenv("MONGO_URI")

client = MongoClient(mongo_uri)
db = client['markX']


@keyword('Remove task from database')
def remove_task_by_name(task_name):
    collection = db['tasks']
    result = collection.delete_many({'text': task_name})
    print(f"Removendo a tarefa '{task_name}', documentos afetados: {result.deleted_count}")

