import mysql.connector
from mysql.connector import errorcode
from fonctionalites import *
def adminConnection():
    c2 = True

    while(c2):
        print("\n")
        print("1. Accéder au rapport annuel des ventes\n")
        print("2. Accéder au rapport annuel des ventes en detail\n")
        print("3. Accéder au rapport annuel des ventes en detail et continu\n")
        print("4. Accéder au rapport annuel des ventes en detail de juste un mois\n")
        print("5. Inscrire un nouvel employé\n")
        print("6. Acheter de la nourriture pour oiseau aux fournisseurs\n")
        print("7. Voir les stocks de nourriture pour oiseau\n")
        print("8. Voir les oiseaux à vendre\n")
        print ("9. Nourrire un oiseau\n")
        print("0. Quitter\n")
        choice2 = input("Choisissez un nombre entre 0 et 9 : ")

        if choice2 == "1":
            annee = int(input("Choisissez une année : "))
            donnee = callProcedure('VIEW_BILAN_COMPTABLE',(annee,),'gerant')

            print("-----------")
            for element in donnee:
                print("annee comptable : ",element[0][0])
                print("******************")
                print("benefice total : ", element[0][1])
                print("-----------")
                print("benefice des ventes d'oiseaux : ", element[0][2])
                print("benefice des services vendus : ", element[0][3])
                print("benefice des ventes de nourriture : ", element[0][4])
                print("******************")
                print("depenses totales : ", element[0][5])
                print("-----------")
                print("depenses en achat d'oiseaux : ", element[0][6])
                print("depenses en achat de nourriture : ", element[0][7])
                print("profit de l'année : ", element[0][8])
                print("-----------")
                
        elif choice2 == "2":
            annee = int(input("Choisissez une année : "))
            print("annee comptable,benefice total,benefice des ventes d'oiseaux,benefice des services vendus,benefice des ventes de nourriture,depenses totales,depenses en achat d'oiseaux,depenses en achat de nourriture,profit de l'année")
            for i in range(1,13):
                    yyy = callProcedure('VIEW_BILAN_COMPTABLE_MONTH', (annee,i),'gerant')

                    print("MOIS : ",i,"->",yyy[0][0])

        elif choice2 == "3":
            annee = int(input("Choisissez une année : "))
            #annee comptable,benefice total,benefice des ventes d'oiseaux,benefice des services vendus,benefice des ventes de nourriture,depenses totales,depenses en achat d'oiseaux,depenses en achat de nourriture,profit de l'année"
            anneeComptable = 0
            beneficeTotal = 0
            beneficeVentesOiseaux = 0
            beneficeServicesVendus = 0
            beneficeVentesNourriture = 0
            depensesTotales = 0
            depensesAchatOiseaux = 0
            depensesAchatNourriture = 0
            profitAnnee = 0
            for i in range(1,13):
                yyy = callProcedure('VIEW_BILAN_COMPTABLE_MONTH', (annee,i),'gerant')
                anneeComptable = yyy[0][0][0]
                beneficeTotal += yyy[0][0][1]
                beneficeVentesOiseaux += yyy[0][0][2]
                beneficeServicesVendus += yyy[0][0][3]
                beneficeVentesNourriture += yyy[0][0][4]
                depensesTotales += yyy[0][0][5]
                depensesAchatOiseaux += yyy[0][0][6]
                depensesAchatNourriture += yyy[0][0][7]
                profitAnnee += yyy[0][0][8]
                print(anneeComptable," MOIS : ",i,"->",beneficeTotal,beneficeVentesOiseaux,beneficeServicesVendus,beneficeVentesNourriture,depensesTotales,depensesAchatOiseaux,depensesAchatNourriture,profitAnnee)
        elif choice2 == "4":
            annee = int(input("Choisissez une année : "))
            mois = int(input("Choisissez un mois : "))
            donnee = callProcedure('VIEW_BILAN_COMPTABLE_MONTH',(annee,mois),'gerant')
            print("-----------")
            for element in donnee:
                print("annee comptable : ",element[0][0])
                print("******************")
                print("benefice total : ", element[0][1])
                print("-----------")
                print("benefice des ventes d'oiseaux : ", element[0][2])
                print("benefice des services vendus : ", element[0][3])
                print("benefice des ventes de nourriture : ", element[0][4])
                print("******************")
                print("depenses totales : ", element[0][5])
                print("-----------")
                print("depenses en achat d'oiseaux : ", element[0][6])
                print("depenses en achat de nourriture : ", element[0][7])
                print("profit de l'année : ", element[0][8])
                print("-----------")

        # Nouvel employé
        elif choice2 == "5":
            if input("Votre nouvel employé est il deja inscrit comme client ? (y pour oui) ") == 'y' :
                mail= input("Email?\n")
                client = callProcedure("CONNEXION_CLIENT", (mail,))
                id = int(client[0][0][0])
                setData("UPDATE PERSONNE set EMPLOYE = %s WHERE Id_Personne = %s", (1,id))
                job_detail,job = input("Description du job ?\n"), input("Job : C (cyberdocteur) E (entraineur) M (medecin) N (nourrisseur)\n")
                if job =="C":
                    setData("INSERT into EMPLOYE (Id_Personne,Job,CYBERDOCTEUR) VALUES (%s,%s,1)",(id,job_detail))
                if job =="E":
                    setData("INSERT into EMPLOYE (Id_Personne,Job,ENTRAINEUR) VALUES (%s,%s,1)",(id,job_detail))
                if job =="M":
                    setData("INSERT into EMPLOYE (Id_Personne,Job,MEDECIN) VALUES (%s,%s,1)",(id,job_detail))
                if job =="N":
                    setData("INSERT into EMPLOYE (Id_Personne,Job,NOURRISSEUR) VALUES (%s,%s,1)",(id,job_detail))
            else :
                Adr_Nom_de_la_rue, Adr_Numero_de_rue, Adr_Code_postal, Adr_Ville, Adr_Boite, Adr_Pays, Nom, Prenom, Telephone, Email, Job, Statut =input("Nom_de_la_rue? \n"), input("Numero_de_rue ?\n"),input("Code_postal ?\n"), input("Ville ?\n"), input("Boite ?\n") , input("Pays ?\n"), input("Nom ?\n"),input("Prenom ?\n"), input("Telephone ?\n"), input("Email ?\n"), input("Détail job ?\n"), input("Job ?\n")
                callProcedure("INSERT_PERSONNE_EMPLOYE", (Adr_Nom_de_la_rue, Adr_Numero_de_rue, Adr_Code_postal, Adr_Ville, Adr_Boite, Adr_Pays, Nom, Prenom, Telephone, Email, Job, Statut),"gerant")

        elif choice2 == "6":
            print("Les fournisseurs disponibles sont :")
            four = getData("SELECT Id_Fournisseur, Nom_entreprise, Email FROM FOURNISSEUR","","gerant")
            c = ['Id fournisseur', 'Nom entreprise', 'Email']
            printTable(c, four)
            id_four,date_achat,id_nourr,qte,prix_achat = input("id fournisseur ?\n"),input(" date d achat ? \n"),input("id nourriture ?\n"), input("quantite ?\n"),input("prix d achat ? \n")
            callProcedure("FOURNISSEUR_VEND_NOURRITURE", (id_four,date_achat,id_nourr, qte, prix_achat,),"gerant")


        elif choice2 == "7":
            nourr = getData("SELECT * FROM VIEW_STOCK_NOURRITURE_OISEAU","","gerant")
            c=["Id nourriture","Nom nourriture","Quantite","Valeur nutritive","Euros par kilo"]
            printTable(c,nourr)

        elif choice2 == "8":
            ois = getData("SELECT * FROM VIEW_OISEAU_A_VENDRE","","gerant")
            c=["Id oiseau","Envergure", "Poids", "Nom", "Prix", "Sexe", "Date de naissance","Date de deces", "Groupe Sanguin", "Race"]
            printTable(c,ois)

        elif choice2 == "9":
            regime = getData("SELECT * FROM REGIME","","gerant")
            c=["Id nourriture", "Nom race"]
            printTable(c,regime)
            id_oiseau,id_nourriture,date,qte = input("id oiseau ?\n"),input("id nourriture ?\n"),input("date de nourrisage ? \n"), input("quantite\n")
            callProcedure("INSERT_NOURRISSAGE",(id_oiseau,id_nourriture,date,qte),"gerant")
        else:
            c2 = False
