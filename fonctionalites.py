import pandas as pd
import mysql.connector
from mysql.connector import errorcode

"""
Va chercher les données dans la base de donnée et renvoie une chaine de caractère

:param requete: la requete sql
:type requete: string
:param value: optional: valeurs de la requete de type : ("<valeur1>","<valeur2>")
:type value: diversifié
:return: le resultat de la requete
:rtype: str
"""
def getData(requete,value="",utilisateur="client")->str:
    cnx = mysql.connector.connect(user=utilisateur,
        password='password',
        host='127.0.0.1',
        port='3306',
        database = 'northwind')
        
    cursor = cnx.cursor()
    cursor.execute(requete,value)
    donnee = cursor.fetchall()
    cnx.close()
    
    return donnee

"""
Injecte les données dans la base de donnée

:param requete: requete du type : "insert INTO <TABLE>(<COLONNE1>,<COLONNE1>) VALUES (%s,%s)"
:type requete: string
:param value:optional: valeurs de la requete de type : ("<valeur1>","<valeur2>")
:type value: diversifié
"""
def setData(requete,value=""):
    
    cnx = mysql.connector.connect(
        user='admin',
        password='password',
        host='127.0.0.1',
        port='3306',
        database = 'northwind')

    cursor = cnx.cursor()
    cursor.execute(requete,value)
    cnx.commit()
    cnx.close()



def callProcedure(requete,value="",utilisateur="client"):
    """Injecte les données dans la base de donnée

    :param requete: requete du type : "insert INTO <TABLE>(<COLONNE1>,<COLONNE1>) VALUES (%s,%s)"
    :type requete: string
    :param value:optional: valeurs de la requete de type : ("<valeur1>","<valeur2>")
    :type value: diversifié
    """
    cnx = mysql.connector.connect(
    user=utilisateur,
    password='password',
    host='127.0.0.1',
    port='3306',
    database = 'northwind')
    cursor = cnx.cursor()
    #print(requete%value)
    cursor.callproc(requete,value)
    cnx.commit()
    retour = []
    
    for element in cursor.stored_results():
        retour.append(element.fetchall())
    cursor.close()
    cnx.close()
    return retour

# c = ['a', 'b', 'c']
# rows = [(1,2,3), (1,2,3)]
def printTable(c, rows):
    df = pd.DataFrame(rows, columns=c)
    pd.set_option('display.colheader_justify', 'center')
    print("\n")
    print(df.to_string(index=False))
    print("\n")
