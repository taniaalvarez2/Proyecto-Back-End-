from faker import Faker
import mysql.connector

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Soyprospera.1mysql",
    database="mydb"
)

# Crea un objeto Faker para generar datos ficticios
fake = Faker()


cursor = db.cursor()

""""


# Cantidad de registros ficticios que deseas crear
num_registros = 20
for _ in range(num_registros):
    # Genera datos ficticios
    cc = fake.random_int(min=1000000, max=1999999)
    nombre = fake.name()
    email = fake.email()
    contraseña = fake.password()
    profesion = fake.job()
    contacto = fake.phone_number()[:10] 
    country = fake.country()
    city = fake.city()

    # Inserta los datos en la tabla 'Users'
    query = "INSERT INTO Users (CC, Nombre, `E-mail`, Contraseña, Profesion, Contacto, Country, City) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
    cursor.execute(query, (cc, nombre, email, contraseña, profesion, contacto, country, city))
    db.commit()

cursor.close()

"""
num_registros = 20
skill_names = [(fake.job(),) for _ in range(num_registros)]
query = "INSERT INTO skills (`Skill Name`) VALUES (%s)"

cursor.executemany(query, skill_names)
db.commit()

cursor.close()

"""
# Lista de CC que deseas insertar en la tabla Skills
cc_values = [
    "1029339", "1047183", "1135458", "1166358", "1235838", "1251458", "1316970", "1328161",
    "1370223", "1396521", "1410331", "1567890", "1605367", "1644287", "1693756", "1727161",
    "1736065", "1788048", "1818689", "1883073"
]

# Query para insertar datos en la tabla Skills
insert_query = "INSERT INTO Skills (CC) VALUES (%s)"


# Insertar los valores de la lista en la columna CC de la tabla Skills
with db.cursor() as cursor:
    for cc in cc_values:
        cursor.execute(insert_query, (cc,))
        db.commit()

# Cerrar la conexión después de insertar los datos
db.close()


"""


