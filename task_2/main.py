from pymongo import MongoClient
from pymongo.server_api import ServerApi

client = MongoClient(
    "mongodb://localhost:27017",
    server_api=ServerApi('1')
)

db = client.book

result_one = db.cats.insert_many(
    [{
        "name": "barsik",
        "age": 3,
        "features": ["ходить в капці", "дає себе гладити", "рудий"],
    },
    {
        "name": "Lama",
        "age": 2,
        "features": ["ходить в лоток", "не дає себе гладити", "сірий"],
    },
    {
        "name": "Liza",
        "age": 4,
        "features": ["ходить в лоток", "дає себе гладити", "білий"],
    }]
)


def read(name):
    return db.cats.find_one({"name": name})


def read_all():
    return [doc for doc in db.cats.find()]


def update_age_by_name(name, new_age):
    db.cats.update_one({"name": name}, {"$set": {"age": new_age}})


def update_feature_by_name(name, new_feature):
    db.cats.update_one({"name": name}, {"$push": {"features": new_feature}})


def delete_by_name(name):
    db.cats.delete_one({"name": name})


def delete_all():
    db.cats.delete_many({})


if __name__ == "__main__":
    print("--- read ---")
    print(read("Liza"))

    print("--- read_all ---")
    print(read_all())

    print("--- update_age_by_name ---")
    update_age_by_name("Liza", 5)
    print(read("Liza"))

    print("--- update_feature_by_name ---")
    update_feature_by_name("Liza", "прекрасний")
    print(read("Liza"))

    print("--- delete_by_name ---")
    delete_by_name("Liza")
    print(read("Liza"))

    print("--- delete_all ---")
    delete_all()
    print(read_all())


