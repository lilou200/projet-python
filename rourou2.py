from os import curdir
from fonctionalites import *
from fct_clients import *
from fct_admin import *
import mysql.connector
from mysql.connector import errorcode

try:
    cnx = mysql.connector.connect(
        user='client',
        password='password',
        host='127.0.0.1',
        port='3306',
        database = 'northwind')

except mysql.connector.Error as err:
    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print("Your username or your password is wrong")
    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print("DataBase does not exist")
    else:
        print("cette error est specifique : ", err)




#---------------------------------------------------------------------------------------------------------------------

def listingAllPersonne():
    clients = getData("SELECT Id_Personne, Nom, Prenom, Email, EMPLOYE, CLIENT FROM PERSONNE ORDER BY EMPLOYE","","admin")
    c = ['Id_Personne', 'Nom', 'Prenom', 'Email', 'EMPLOYE', 'CLIENT']
    printTable(c, clients)

#---------------------------------------------------------------------------------------------------------------------

c1 = True
while(c1):
    cnx = mysql.connector.connect(
        user='admin',
        password='password',
        host='127.0.0.1',
        port='3306',
        database = 'northwind')
    cursor = cnx.cursor()
    print("************************************************************")
    print("*                                                          *")
    print("*     Les plus beaux pigeons de votre region !             *")
    print("*   Rencontrez les meilleurs pigeons pres de chez vous !   *")
    print("*    Agrendissez la taille de votre pigeon !               *")
    print("*                                                          *")
    print("*        Veuillez choisir le numéro de l'action que        *")
    print("*                 vous souhaitez exécuter                  *")
    print("*                                                          *")
    print("************************************************************")
    print("\n")
    print("1. Inscription\n")
    print("2. Connection à votre compte client\n")
    print("3. Connection administrative\n")
    print("4. Quitter\n")

    choice1 = input("Choisissez un nombre entre 1 et 4 : ")

    if choice1 == "0":
        listingAllPersonne()

    # Inscription
    elif choice1 == "1":
        if input("Etes-vous déjà inscrit en tant qu'employé ? (y pour oui) ") == 'y' :
            mail= input("Email ? ")
            client = callProcedure("CONNEXION_CLIENT", (mail,))
            id = int(client[0][0][0])
            setData("UPDATE PERSONNE set CLIENT = %s WHERE Id_Personne = %s", (1,id))
            # print employé/client
            client = getData("SELECT Id_Personne, Nom, Prenom, Email, EMPLOYE, CLIENT FROM PERSONNE WHERE Id_Personne = %s",(id,))
            c = ['Id_Personne', 'Nom', 'Prenom', 'Email', 'EMPLOYE', 'CLIENT']
            printTable(c, client)
        else:
            Adr_Nom_de_la_rue, Adr_Numero_de_rue, Adr_Code_postal, Adr_Ville, Adr_Boite, Adr_Pays, Nom, Prenom, Telephone, Email =input("Nom_de_la_rue? \n"), input("Numero_de_rue ?\n"),input("Code_postal ?\n"), input("Ville ?\n"), input("Boite ?\n") , input("Pays ?\n"), input("Nom ?\n"),input("Prenom ?\n"), input("Telephone ?\n"), input("Email ?\n")
            if Adr_Boite == '':
                Adr_Boite = None
            if Telephone == '':
                Telephone = None
            callProcedure("INSERT_PERSONNE_CLIENT", (Adr_Nom_de_la_rue, Adr_Numero_de_rue, Adr_Code_postal, Adr_Ville, Adr_Boite, Adr_Pays, Nom, Prenom, Telephone, Email))
            # print client
            client = callProcedure("CONNEXION_CLIENT", (Email,))
            id = int(client[0][0][0])
            client = getData("SELECT Id_Personne, Nom, Prenom, Email, EMPLOYE, CLIENT FROM PERSONNE WHERE Id_Personne = %s",(id,))
            c = ['Id_Personne', 'Nom', 'Prenom', 'Email', 'EMPLOYE', 'CLIENT']
            printTable(c, client)

    # Connection à votre compte client
    elif choice1 == "2":
        mail= input("Email ? ")
        client = getData("SELECT Id_Personne From PERSONNE where Email = %s and CLIENT = 1",(mail,),"admin")
        if not client:
            print("\nCette personne n'est pas dans la base de donnée\n")
        else:
            id = int(client[0][0])
            clientConnection(id)
        
    # Connection administrative
    elif choice1 == "3":
        adminConnection()
    
    else:
        c1 = False

