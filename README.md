# Introduktion

Du driver en webbshop som säljer skor på nätet och nu är det dags att göra den databas i vilken du
håller reda på din verksamhet.
I databasen behöver du hålla koll på vilka skor som ska finnas i shoppen. Varje vara har en viss
storlek, färg, pris och är av ett visst märke. Du behöver också hålla reda på dina kunder och deras
beställningar. En beställning sker ett visst datum och kan innehålla flera varor och även flera varor av
samma typ. Dessutom ingår varorna i en eller flera kategorier (t.ex. sportskor, damskor, herrskor,
promenadskor, barnskor m.fl.) så att de lätt kan presenteras i er webbshop på nätet (och för att
kunder ska kunna söka på olika sorters skor i webbshopen). <br/><br/>
Uppgiften är att skapa följande:<br/>
• Ett ER-diagram som beskriver din verksamhet. Samtliga entitetstyper, sambandstyper och
attribut ska finnas i diagrammet.<br/>
• En relationsmodell som beskriver databasen.<br/>
• Ett DDL-script som skapar upp databasen och fyller den med efterfrågat data. <br/>
• Ett DML-script som besvarar frågorna nedan.<br/>
<br/>
Alla delar i uppgiften måste beskriva samma databas.<br/>
Datat som behövs i databasen är minst följande (välj det så att det passar med frågorna nedan):<br/>
• Minst 8 produkter<br/>
• Minst 5 kategorier<br/>
• Minst 5 kunder<br/>
• Minst 6 beställningar<br/><br/>
Följande frågor skall kunna ställas mot din databas och returnera minst ett svar (du måste alltså ha
lagt in data som ”platsar” i frågorna):<br/>
• Lista antalet produkter per kategori. Listningen ska innehålla kategori-namn och antalet
produkter.<br/>
• Skapa en kundlista med den totala summan pengar som varje kund har handlat för. Kundens
för- och efternamn, samt det totala värdet som varje person har shoppats för, skall visas.<br/>
• Vilka kunder har köpt svarta sandaler i storlek 38 av märket Ecco? Lista deras namn.<br/>
• Skapa en topp-5 lista av de mest sålda produkterna.<br/>

# Lösning

## ER-Diagram
![skor_ER_diagram](https://user-images.githubusercontent.com/92685200/159187329-ec88abe7-b48c-4488-aa26-0789dd7f069c.png)

## Relationsmodel
![relationsModell](https://user-images.githubusercontent.com/92685200/159187302-d85bafce-5377-4c3a-adeb-1242aec36421.png)

