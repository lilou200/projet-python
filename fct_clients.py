import mysql.connector
from mysql.connector import errorcode
from fonctionalites import *

def clientConnection(id):
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

    cursor = cnx.cursor()
    c2 = True

    while(c2):
        print("\n")
        print("1. Modifier ses donnees personnelles\n")
        print("2. Mes oiseaux\n")
        print("3. Informations oiseau\n")
        print("4. Commande\n")
        print("5. Vente oiseau\n")
        print("6. Mes commandes\n")
        print("7. Desinscription de la base de donnée\n")
        print("8. Quitter\n")
        choice2 = input("Choisissez un nombre entre 1 et 6 : ")
        print("\n")
        
        # Modifier ses données personnelles
        if choice2 == "1":

            print("Vos informations personnelles sont :")
            datas = callProcedure("DONNEES_PERSONNELLES", (id,))
            c = ['Id client', 'Id commande', 'Prix total', 'Nombre de services', 'Nombre achat nourriture', 'Nombre achats oiseau']
            printTable(c, datas[0])
            
            Adr_Nom_de_la_rue, Adr_Numero_de_rue, Adr_Code_postal, Adr_Ville, Adr_Boite, Adr_Pays, Nom, Prenom, Telephone, Email =input("Nom_de_la_rue? \n"), input("Numero_de_rue ?\n"),input("Code_postal ?\n"), input("Ville ?\n"), input("Boite ?\n") , input("Pays ?\n"), input("Nom ?\n"),input("Prenom ?\n"), input("Telephone ?\n"), input("Email ?\n")
            if Adr_Boite == '':
                Adr_Boite = None
            if Telephone == '':
                Telephone = None
            callProcedure("MODIF_DONNEES_CLIENT", (id, Adr_Nom_de_la_rue, Adr_Numero_de_rue, Adr_Code_postal, Adr_Ville, Adr_Boite, Adr_Pays, Nom, Prenom, Telephone, Email))

            print("Nouvelles informations personnelles :")
            cursor.callproc("DONNEES_PERSONNELLES", (id,))
            datas = callProcedure("DONNEES_PERSONNELLES", (id,))
            c = ['Id client', 'Id commande', 'Prix total', 'Nombre de services', 'Nombre achat nourriture', 'Nombre achats oiseau']
            printTable(c, datas[0])

        # Mes oiseaux
        elif choice2 == "2":
            datas = callProcedure("VIEW_MES_OISEAUX", (id,))       
            c = ['Id oiseau', 'Nom oiseau']
            printTable(c, datas[0])

        # Info oiseau
        elif choice2 == "3":
            id_ois = input("Id oiseau : ")
            c = ['Nom', 'Sexe', 'Date de naissance', 'Date de deces', 'Groupe sanguin', 'Race', 'Envergure', 'Couleur', 'Prix', 'Proprietaire']
            datas = callProcedure("VIEW_ALL_INFO_UN_OISEAU", (id_ois,))
            printTable(c, datas[0])
            
            
        # Commande
        elif choice2 == "4":

            date_comm = input("Date de commande/paiement : ")
            cursor.callproc("INSERT_NEW_COMMANDE", (id, date_comm))
            cnx.commit()
            for x in cursor.stored_results():
                ois = x.fetchall()
            id_comm = int(ois[0][0])

            c3 = True
            while(c3):
                print('\n')
                print("1. Achat oiseau\n") 
                print("2. Location oiseau\n")
                print("3. Achat nourriture oiseau ou oiseau farcit\n")
                print("4. Services pour oiseau\n")
                print("5. Terminer la commande\n")
                choice3 = input("Choisissez un nombre entre 1 et 4 : ")
                print("\n")

                # Achat oiseau
                if choice3 == "1":
                    print("Les oiseaux disponibles sont :")
                    ois = getData("SELECT * FROM VIEW_OISEAU_A_VENDRE")
                    c = ['ID oiseau', 'Envergure', 'Poids', 'Nom', 'Prix', 'Sexe', 'Date de naissance', 'Date_de_deces', 'Groupe sanguin', 'Race']
                    printTable(c, ois)

                    id_oiseau = input("Choisissez un oiseau par son id : ")
                    cursor.callproc("CLIENT_ACHAT_OISEAU", (id_comm, id_oiseau))
                    cnx.commit()
                
                # Location oiseau
                if choice3 == "2":
                    print("Les oiseaux disponibles sont :")
                    ois = getData("SELECT * FROM VIEW_OISEAU_A_VENDRE")
                    c = ['ID oiseau', 'Envergure', 'Poids', 'Nom', 'Prix', 'Sexe', 'Date de naissance', 'Date_de_deces', 'Groupe sanguin', 'Race']
                    printTable(c, ois)
                    
                    # ???
                    print(getData("SELECT distinct `Nom du service`,`Categorie de service` from VIEW_TYPES_SERVICES where `Categorie de service` = %s",("LOCATION",)))
                    id_ois_loc = input("Id oiseau : ")
                    nom_serv = input("Nom service : ")
                    date_deb = input("Date debut : ")
                    date_fin = input("Date fin : ")
                    prix_serv = input("Prix : ")
                    cursor.callproc("INSERT_LOCATION", (nom_serv, id_comm, date_deb, date_fin, prix_serv, id_ois_loc))
                    cnx.commit()
                
                if choice3 == "3":
                    print("La nourriture disponible est :")
                    nour1 = getData("SELECT * FROM VIEW_STOCK_NOURRITURE_OISEAU")
                    c = ['Id nourriture', 'Nom nourriture', 'Quantite', 'Valeur nutritive', 'Euros au kilo']
                    printTable(c, nour1)
                    
                    print("Les oiseaux farcits disponibles sont :")
                    nour2 = getData("SELECT * FROM VIEW_STOCK_OISEAU_FARCIT")
                    c = ['Id oiseau farcit', 'Farce', 'Poids', 'Euros au kilo', 'Prix']
                    printTable(c, nour2)

                    
                    id_nour = input("Id du type de nourriture : ")
                    quant = input("Quantité achetée : ")
                    cursor.callproc("CLIENT_ACHAT_NOURRITURE", (id_comm, id_nour, quant))
                    cnx.commit()

                elif choice3 == "4":
                    print("1. Reproduction\n")
                    print("2. Entrainement\n")
                    print("3. Soin\n")
                    print("4. Amelioration\n")
                    print("5. Annuler\n")

                    choice4 = input("Selectionner le numero de service : ")
                    id_ois = input("Selectionner votre oiseau (id) : ")

                    if choice4 == "1":
                        print(getData("SELECT distinct `Nom du service`,`Categorie de service` from VIEW_TYPES_SERVICES where `Categorie de service` = %s",("REPRODUCTION",),"admin"))
                        nom_serv = input("Nom service : ")
                        date_deb = input("Date debut : ")
                        date_fin = input("Date fin : ")
                        nb_oeufs = input("Nombre oeufs : ")
                        prix_serv = input("Prix : ")
                        id_ois2 = input("Oiseau 2 (id) : ")
                        cursor.callproc("INSERT_REPRODUCTION", (nom_serv, id_comm, date_deb, date_fin, nb_oeufs, prix_serv, id_ois, id_ois2))
                        cnx.commit()
                    elif choice4 == "2":
                        print(getData("SELECT distinct `Nom du service`,`Categorie de service` from VIEW_TYPES_SERVICES where `Categorie de service` = %s",("ENTRAINEMENT",)))
                        nom_serv = input("Nom service : ")
                        nbr_seances = input("Nombre de seances : ")
                        prix = input("Prix : ")
                        cursor.callproc("INSERT_ENTRAINEMENT", (nom_serv, id_comm, nbr_seances, prix, id_ois))
                        cnx.commit()
                        # INSERT_SEANCE( IN service_nom varchar(50),
                        # IN commande_id int, in seance_date date, in seance_duree int)
        
                    elif choice4 == "3":
                        print(getData("SELECT distinct `Nom du service`,`Categorie de service` from VIEW_TYPES_SERVICES where `Categorie de service` = %s",("SOIN",)))
                        nom_serv = input("Nom service : ")
                        date_deb = input("Date debut : ")
                        date_fin = input("Date fin : ")
                        prix_serv = input("Prix : ")
                        descr = input("Description : ")
                        cursor.callproc("INSERT_SOIN", (nom_serv, id_comm, date_deb, date_fin, prix_serv, descr))
                        cnx.commit()
                    elif choice4 == "4":
                        print(getData("SELECT distinct `Nom du service`,`Categorie de service` from VIEW_TYPES_SERVICES where `Categorie de service` = %s",("AMELIORATION",)))
                        nom_serv = input("Nom service : ")
                        date_deb = input("Date debut : ")
                        date_fin = input("Date fin : ")
                        prix_serv = input("Prix : ")
                        descr = input("Description : ")
                        cursor.callproc("INSERT_AMELIORATION", (nom_serv, id_comm, date_deb, date_fin, prix_serv, descr))
                        cnx.commit()
                else:
                    c3 = False
        
        # Vente oiseau
        elif choice2 == "5":
            id_ois = input("Id oiseau : ")
            date_vente = input("Date de vente : ")
            prix = input("Prix de vente : ")
            cursor.callproc("CLIENT_VEND_OISEAU", (id, id_ois, date_vente, prix))
            cnx.commit()

        # Mes commandes
        elif choice2 == "6":
            comm = cursor.callproc("VIEW_MY_COMMANDES", [id,])
            
            for x in cursor.stored_results():
                comm = x.fetchall()
                c = ['Id client', 'Id commande', 'Prix total', 'Nombre de services', 'Nombre achat nourriture', 'Nombre achats oiseau']
                printTable(c, comm)

        # Désinscription de la base de donnée
        elif choice2 == "7":
            if input("Etes-vous sur ? (y pour oui)") == "y":
                cursor.callproc("SUPPRIMER_CLIENT", (id, ))
                cnx.commit()
                c2 = False
        
        else:
            c2 = False
    
    cnx.close()
    
    
    