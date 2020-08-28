extends Node

func pages_setup(images):
	var de_pages = [[ # Manual
	['text', {'title':'THE LONG GAME', 'space':300,
	'text':"""THE LONG GAME ist ein mittelalterliches Diplomatie-Spiel gegen 3 NPCs mit gewaltige verschiedene Persönlichkeiten. Über 6 Runde, spiel das Gefangenendilemma, forsch den Matchverlauf deiner Opponenten gegen andere Spieler nach und beeinfluss sie durch Informationen und Lügen."""}
	],
	['text', {'title':'AKTIONEN', 'space':380, 
	'text':"""Jeder Spieler hat 3 AKTIONEN pro Runde. Man kann sie damit verbringen:
	-ANGRIFF: die Agressiv-Haltung gegen einen andere Spieler nehmen.
	-NACHFORSCHUNG: mehr Information über einen andere Spieler erhalten.
	-EINFLUSS: deine Haltung in der Thron-Reihenfolge ändern.
	-DIPLOMATIE: Briefe an andere Spieler senden.
	-FAELSCHUNG: Briefe von anderen Spielern ändern."""}
	], 
	['text', {'title':'KAMPF - DER GEFANGENENDILEMMA', 'space':470, 
	'text':"""Der GEFANGENENDILEMMA ist ein Gedankenexperiment mit Bezug zur Spieltheorie.
	Darin entscheidet jeder Spieler zwischen eine Passiv- oder Agressiv-Haltung.
	PASSIV sein ist besser für beide involvierte Spieler, aber es setzt den Einzelne der Verrat aus. Außerdem ist diese Option diplomatisch besser.
	AGRESSIV sein ist andererseits besser für den Einzelne, aber es verbringt eine Aktion und erzeugt Ressentiment zwischen den Spielern."""}
	],
	['image', {'image':images[0], 'space':350}
	],
	['text', {'title':'NACHFORSCHUNGEN', 'space':440, 
	'text':"""Nachforschungen über einen Spieler anstellen kann ziemlich nützlich sein. Damit kann man Hinweise darauf bekommen, was er im Gefangenendilemma tun wird. Das ist was man kann mit einem Nachforschen entdecken:
	1- Seine Punktzahl.
	2- Seine letzte Matchs gegen alle andere Spieler.
	3- Seine Relation (Meinung) mit alle anderen Spielern.
	Eine Nachforschung verbringt 1 AKTION."""}
	],
	['image', {'image':images[1], 'space':350}
	],
	['text', {'title':'EINFLUSS', 'space':380,
	'text':"""Einfluss darstellt Macht und Allbekanntheit eines Spielers in der Königreich. Spieler, die höhen Einfluss haben, agieren früher in der Runde und haben eine höher Wahrscheinlichkeit, eine Brief zu erhalten oder attackiert zu werden.
	Ein Spieler kann seine Position (und die Position von anderen) in der Einfluss-Reihenfolge mit dem Einfluss-Bildschirm ändern. Beachten Sie mal, dass die Reihenfolge nur am Ende jeder Runde sich aktualisiert."""}
	],
	['text', {'title':'DIPLOMATIE', 'space':1000,
	'text':"""Schließlich gibt es DIPLOMATIE. Indem man den Diplomatiebereich verwendet, kann man an andere Spieler Briefe senden. Gleichfalls kann andere Charakter manchmal an den Spieler auch Briefe senden.
	Das Senden eines Briefes verbringt 1 AKTION, und ist wesentlich die Hauptmechanik des Spiels. Es ist dieses System, das ermöglicht es, der Spieler seine Gegner zu manipulieren.
	Es gibt zwei Weisen, dies zu tun:
	-SCHREIBEN: um eine Briefe zu schreiben, wählt die drei Optionen (Subjekt, Aktion, Objekt) im Diplomatiebereich, die du schreiben willst. Wenn alles bereit ist, klick auf Senden.
	-WIEDER SENDEN: man kann auch eine Briefe, die ein anderer Spieler geschrieben hat, mit dem Umschlag-Icon senden. Damit wird der Absender denken, dass der Original-Author ihm die Briefe geschickt hat, was riesige Konsequenzen verursachen kann.
	Um sie effizient zu kontrollieren, hat der Spieler komplett Zugriff auf das Verhalten und KI-System von alle Charakter."""}
	],
	['text', {'title':'FAELSCHUNG',
	'text':"""Fälschung eröffnet noch mehr Möglichkeiten für Täuschung. Damit kann man Briefe von anderen Spieler fälschen, um sie später wieder zu senden. 
	Jede Änderung verbringt 1 AKTION."""}
	],
	['text', {'title':'DER RAT',
	'text':"""Am Anfang jeder Runde schlagt der Führer der Thron-Reihenfolge ein Dekret dem Rat vor. Ein Dekret besteht von
	einer Haltung und einem Ziel, und, wenn genehmigt, zwingt alle Spieler, nächste Runde die entscheidene Haltung gegen 
	den entscheidene Ziel zu nehmen.
	Nachdem ein Vorschlag gemacht wird, stimmt jeder Spieler über den Dekret ab. Der zweite Spieler der Reihenfolge stimmt
	zweimal. Wenn es mehr 'Ja' als 'Nein' gibt, wird das Dekret genehmigt."""}
	],
	['text', {'title':'EIGENSCHAFTEN UND CHARAKTER', 'space':350,
	'text':"""Dieses Spiel hat auch ein Dokument, das das Profil jedes Charakters detaliert. Sie sind in drei Teile gegliedert:
	-ANFANGSRELATIONEN: seine Anfangsrelationen mit anderen Spielern.
	-EIGENSCHAFTEN: Persönlichkeit-Eigenarten, die unter anderem bestimmen, wie sie sich mit Events und Informationen reagieren.
	-AKTIONPRIORITÄT: eine Liste von Aktionen, die der Spieler nehmen kann. Er wird immer die erste Aktion der Liste nehmen, es sei denn, das ist unmöglich und/oder redundant. In diesem Fall, übergeht er diese Aktion und nimmt stattdessen die nächste.
	Das ist alles, das du wissen musst, um THE LONG GAME zu spielen. Viel Glück!"""}
	]],
	# Personagens
	[
	['text', {'title':'CHARAKTER - VOR DEM LESEN', 'space':270,
	'text':"""Lassen Sie sich nicht durch den Umfang dieses Dokuments einschüchtern. Überfliegen Sie es zuerst, experimenten Sie für ein paar Spielen und kommen Sie wieder, wenn Sie sich besser an das Spiel gewöhnt haben."""}
	],
	['text', {'title':'UEBLICHE BEGRIFFE', 'space':440, 
	'text':"""INFORMATION/BRIEFE
	Aus drei Teilen, der Reihe nach: Agent/Haltung/Ziel

	RELATIONEN
	Relation-Niveau:
	Wütend/Feindlich/Misstrauisch/Vertrauend/Freundlich
	Ärgerlich/Feindselig/Verdächtig/Vertraut/Befreundet

	HALTUNGEN
	Kooperation: Passiv vs Passiv
	Massaker: Agressiv vs Passiv
	massakriert werden: Passiv vs Agressiv
	Kampf: Agressiv vs Agressiv"""}
	]],
	# Salem
	[['text', {'title':'SALEM', 'space':140,
	'text':"""Es ist du. 
	Rasse: Mensch"""}
	],
	['text', {'title':'EIGENSCHAFTEN', 'space':120, 
	'text':"""-SPIELERCHARAKTER.
	-CHARISMA: am Anfang des Spiels, wird ein zufälliger Charakter gewählt, deren Relation mit Salem um 1 verbessert wird."""}
	]],
	# Grolk
	[['text', {'title':'GROLK', 'space':180,
	'text':"""Hasst schwache Spieler und Verräter. Handelt in agressiver und fahrlässiger Weise.
	Rasse: Orc"""}
	],
	['text', {'title':'ANFANGSRELATIONEN', 'space':260, 
	'text':"""-FEINDLICH gegenüber Salem.
	-MISSTRAUISCH gegenüber Kallysta.
	-MISSTRAUISCH gegenüber Horlin.
	-MISSTRAUISCH gegenüber Obrulena.
	-FEINDLICH gegenüber Thoren.
	-MISSTRAUISCH gegenüber Edraele."""}
	],
	['text', {'title':'EIGENSCHAFTEN - TL;DR', 'space':420, 
	'text':"""Grolk ärgert sich nicht mit Kämpfen, aber hässt Spieler, die ihn verraten oder von ihm massakriert werden.
	Er hässt auch Spieler, die seine Freunde angreifen, und kooperiert mit Spielern, die mit seinen Freunden kooperieren. Immer glaubt er an seine Freunde und ignoriert seine Gegner.
	Er mag echte Information, mag falsche Information nicht, und verzeiht nie ärgerliche Gegner."""}
	],
	['text', {'title':'KRIEGER', 'space':170, 'color':Color.red,
	'text':"""Wenn man gegen ihn KÄMPFT (Agressiv vs Agressiv), seine Relation verschlechtert nicht. Er wird FEINDLICH gegen Spieler, die MASSAKRIERT (Passiv vs Agressiv) von ihm werden."""}
	],
	['text', {'title':'HASS', 'space':220, 'color':Color.darkslategray,
	'text':"""Wird WÜTEND gegen VERTRAUTE/BEFREUNDETE Spieler, die ihm MASSAKRIEREN (Agressiv vs Passiv). Ausserdem wird er FEINDLICH gegen vermutete Spieler, die ihm MASSAKRIEREN."""}
	],
	['text', {'title':'BRUDERSCHAFT', 'space':310, 'color':Color.darkblue,
	'text':"""Wird FEINDLICH (sofern er nicht schon WÜTEND oder FREUNDLICH ist) gegen einen Spieler, entweder wenn er herausfindet, dass dieser Spieler einen VERTRAUTEN/BEFREUNDETEN Spielern angreifen wird, oder wenn er herausfindet, dass dieser Spieler FEINDLICH/WÜTEND gegen einen VERTRAUT/FREUNDE Spielern ist."""}
	],
	['text', {'title':'ALLIANZ', 'space':300, 'color':Color.blue,
	'text':"""Wird VERTRAUEND (sofern er nicht schon WÜTEND oder FREUNDLICH ist) eines Spielers, entweder wenn er herausfindet, dass dieser Spieler mit einem VERTRAUTEN/BEFREUNDETEN Spieler kooperieren wird, oder wenn er herausfindet, dass ein VERTRAUTER/BEFREUNDETER Spieler diesen Spieler als VERTRAUT/BEFREUNDET betrachtet."""}
	],
	['text', {'title':'GENERAL', 'space':180, 'color':Color.cyan,
	'text':"""Seine Relation verbessert, wenn man ihm Information gibt, die er herausfindet, dass die wahr ist. Das Gegenteil passiert mit Information, die er herausfindet, dass die falsch ist."""}
	],
	['text', {'title':'SIMPEL', 'space':220, 'color':Color.darkgreen,
	'text':"""Glaubt immer an VERTRAUTE/BEFREUNDETE Spieler. Glaubt nie an andere Spieler, aber erinnert sich immer noch an ihre Worte (für General)."""}
	],
	['text', {'title':'IGNORANT', 'color':Color.darkolivegreen,
	'text':"""Seine Relation mit dem Führer verbessert/verschlechtert sich, wenn sie mit ihren Abstimmungspolitik zustimmen/nicht zustimmen. Er ignoriert aber andere Räten."""}
	],
	['text', {'title':'VERBITTERT', 'space':180, 'color':Color.brown,
	'text':"""Wenn er WÜTEND mit jemandem ist, wird nichts ihn dazubringen, seine Relation zu dem zu ändern."""}
	],
	['text', {'title':'AKTION-PRIORITAET', 'space':400, 
	'text':"""1- Attackiert einen ÄRGERLICHEN Spieler.
	2- Attackiert einen FEINDSELIGEN Spieler.
	3- Erzählt einem VERTRAUTEN/BEFREUNDETEN Spielern von seiner Relation mit anderen.
	4- Erzählt einem BEFREUNDETEN Spielern Informationen, die er hat.
	5- Attackiert einen VERDÄCHTIGEN Spieler."""}
	]],
	# Zardri
	[['text', {'title':'ZARDRI',
	'text':"""Geboren in den dunklen Wäldern von Ecnar, Zardri sucht diskret nach schnelle Hinterhalte gegen angreifbare Feinde.
	Rasse: Goblin"""}
	],
	['text', {'title':'ANFANGSRELATIONEN',
	'text':"""-MISSTRAUISCH gegenüber Salem.
	-MISSTRAUISCH gegenüber Kallysta.
	-MISSTRAUISCH gegenüber Horlin.
	-MISSTRAUISCH gegenüber Obrulena.
	-FEINDLICH gegenüber Thoren.
	-MISSTRAUISCH gegenüber Edraele."""}
	],
	['text', {'title':'EIGENSCHAFTEN - TL;DR',
	'text':"""Die Hauptstrategie von Zardri ist Verrat. Wenn jemand von mehreren Spielern attackiert wird, nimmt Zardri
	diese Gelegenheit, um ihn in seinem angreifbarsten Zustand zu verraten. Jedoch vermeidet er, verraten zu werden, und deswegen
	glaubt er nie Informationen von anderen Spielern und wird wütend im ersten Anzeichen von Gefähr.'"""}
	],
	['text', {'title':'EMBOSCADOR', 'color':Color.mediumvioletred,
	'text':"""Wird FEINDLICH gegenüber VERDÄCHTIGEN Spieler, die schon FEINDLICH/WÜTEND gegenüber zwei oder mehr andere Spieler sind."""}
	],
	['text', {'title':'HASS', 'space':220, 'color':Color.darkslategray,
	'text':"""Wird WÜTEND gegen VERTRAUTE/BEFREUNDETE Spieler, die ihm MASSAKRIEREN (Agressiv vs Passiv). Ausserdem wird er FEINDLICH gegen vermutete Spieler, die ihm MASSAKRIEREN."""}
	],
	['text', {'title':'PARANOID', 'space':170, 'color':Color.darkgray,
	'text':"""Wird WÜTEND gegen Spieler, die entweder beabsichtigen, er zu angreifen, oder gegen sie FEINDLICH/WÜTEND sind."""}
	],
	['text', {'title':'VERRAT', 'space':180, 'color':Color.darkred,
	'text':"""Wird FEINDLICH (sofern er nicht schon WÜTEND ist) gegen Spieler, die von ihm massakriert werden (Passiv vs Agressiv)."""}
	],
	['text', {'title':'INTUITION', 'space':360, 'color':Color.gold,
	'text':"""Wenn er forscht den SPIELERCHARAKTER nach, betrachtet seine Relation mit anderen Spielern auf Grund ihren letzen Matchs. 
	Falls eine Massaker auf irgendeiner Seite es gab: WÜTEND
	Falls es Kämpf gab: FEINDLICH 
	Falls es Kooperation gab: VERTRAUEND 
	Falls es kein Match gab (Runde 1): MISSTRAUISCH"""}
	],
	['text', {'title':'BLOD', 'color':Color.palegreen ,
	'text':"""Glaubt immer das Gegenteil von den erhaltenen Nachrichten. Seine Relation mit einem Spieler verschlechtert sich jedes Mal, wenn dieses Spieler ihm eine Nachricht sendet."""}
	],
	['text', {'title':'IGNORANT', 'color':Color.darkolivegreen,
	'text':"""Seine Relation mit dem Führer verbessert/verschlechtert sich, wenn sie mit ihren Abstimmungspolitik zustimmen/nicht zustimmen. Er ignoriert aber andere Räten."""}
	],
	['text', {'title':'AKTION-PRIORITAET',
	'text':"""1- Attackiert einen ÄRGERLICHEN Spieler.
	2- Attackiert einen FEINDSELIGEN Spieler.
	3- Wenn es eine gerade Runde ist, erzählt eine Lüge einem FEINDSELIGEN Spieler.
	4- Forscht einen VERDÄCHTIGEN Spieler nach."""}
	]],
	# Kallysta
	[['text', {'title':'KALLYSTA', 'space':210,
	'text':"""Ein individualistischer und clever Führer. Kallysta misstraut fast jeder und ist großartig darin, starke Allianzen zu brechen.
	Rasse: Tiefling"""}
	],
	['text', {'title':'ANFANGSRELATIONEN', 'space':260, 
	'text':"""-MISSTRAUISCH gegenüber Salem.
	-MISSTRAUISCH gegenüber Grolk.
	-MISSTRAUISCH gegenüber Horlin.
	-MISSTRAUISCH gegenüber Obrulena.
	-MISSTRAUISCH gegenüber Thoren.
	-MISSTRAUISCH gegenüber Edraele."""}
	],
	['text', {'title':'EIGENSCHAFTEN - TL;DR', 'space':570, 
	'text':"""Kallystas indivdualistische Art macht es ihr unmöglich, Freundlich zu anderen zu werden. Sie ist ziemlich gut darin, Informationen zu finden und zu interpretieren, und sie verwendet diese Fähigkeit, um das Verhalten anderer Spieler vorherzusagen.
	Kallystas charakteristische Eigenschaft, Kettebrecher, macht sie Feindlich gegenüber Spieler, die mehrere Verbündete haben. Mit Diplomatie und Nachforschungen kann die tiefling Führer schnell starke Allianze brechen.
	Außerdem reagiert sie angemessen auf erhaltene Information, indem sie sich gegen Feinde verteidigt."""}
	],
	['text', {'title':'PARANOID', 'space':170, 'color':Color.darkgray,
	'text':"""Wird WÜTEND gegen Spieler, die entweder beabsichtigen, sie zu angreifen, oder gegen sie FEINDLICH/WÜTEND sind."""}
	],
	['text', {'title':'GERECHTIGKEIT', 'space':140, 'color':Color.darkslategray,
	'text':"""Wird WÜTEND gegen Spieler, die ihr MASSAKRIEREN (Agressiv vs Passiv)."""}
	],
	['text', {'title':'DEDUKTION', 'space':310, 'color':Color.yellow,
	'text':"""Kann die Relationen des SPIELERCHARAKTERS mit anderen Spielern an die Relationen der anderen Spieler mit ihm herleiten. Zum Beispiel, wenn sie entdeckt, dass ein Spieler WÜTEND mit dem SPIELERCHARAKTER ist, leitet sie her, dass der SPIELERCHARAKTER WÜTEND mit diesem Spieler ist."""}
	],
	['text', {'title':'KETTEBRECHER', 'space':170, 'color':Color.darkred,
	'text':"""Wird FEINDLICH gegen Spieler, die von mindestens zwei Spielern (außer Kallysta selbst) als VERTRAUT/FREUND betrachtet werden."""}
	],
	['text', {'title':'ZYNISCH', 'space':90, 'color':Color.blueviolet,
	'text':"""Wird niemals FREUNDLICH."""}
	],
	['text', {'title':'INTRIGE', 'space':640, 'color':Color.darkcyan,
	'text':"""Wenn sie Briefe erhaltet, vergleicht sie die Information mit früheren Daten. Wenn es einen Widerspruch zwischen Nachricht und Daten gibt, glaubt sie an die Daten. Wenn der Widerspruch zwischen Briefe ist, gibt sie den Vorrang dem Brief des vertrauenswürdiger Absenders.
	Falls es keinen Widerspruch gibt und der Brief von einem Verdächtigen Spieler kommt, forscht sie die Gültigkeit dieser Information nach, wenn möglich. Wenn nicht, lehnt sie ab.
	Auf jeden Fall wird sie WÜTEND, wenn sie entdeckt, dass die Information falsch ist. Auf der anderen Seite, wenn die Information echt ist und den Absender nicht erwähnt, verbessert sie seine Relation zu ihm."""}
	],
	['text', {'title':'DIPLOMATISCH', 'color':Color.darkmagenta,
	'text':"""Ihre Relation mit anderen Räten und dem Führer verbessert/verschlechtert sich, wenn sie mit ihren Abstimmungspolitik zustimmen/nicht zustimmen."""}
	],
	['text', {'title':'AKTIONPRIORITAET', 'space':400, 
	'text':"""1- Attackiert einen ÄRGERLICHEN Spieler.
	2- Wenn es eine ungerade Runde ist (außer die erste), forscht einen VERDÄCHTIGEN Spieler nach.
	3- Sendet wieder eine Briefe, die sie glaubt, falsch ist und von einem FEINDLICHEN Spieler geschrieben wurde, an einen Spieler, der MISSTRAUISCH gegenüber ihm ist.
	4- Zuerst wählt einen FEINDSELIGEN X Spielen. Dann wählt zwei Spieler, Y und Z, die X VERTRAUT finden.
	  4a- Falls Y Loyalitaeten hat und WÜTEND mit Z ist, erzählt Y, dass X mit Z kooperieren wird.
	  4b- Falls Y Allianz hat und VERTRAUEND/FREUNDLICH mit ihr und Z ist, erzählt Y, dass X Z attackieren wird.
	5- Attackiert einen FEINDSELIGEN Spieler.
	6- Erzählt einen VERDÄCHTIGEN Spieler, dass sie mit ihm kooperieren wird.
	7- Forscht einen FEINDSELIGEN Spieler nach.
	8- Forscht einen VERTRAUTEN Spieler nach."""}
	]],
	# Horlin
	[['text', {'title':'HORLIN', 'space':180,
	'text':"""Obwohl seine militarische Fähigkeiten schrecklich sind, hat der clever Hochbürgermeister von Glitzergold sein Talent für Schreiben und Fälschen bewiesen.
	Rasse: Gnom"""}
	],
	['text', {'title':'ANFANGSRELATIONEN', 'space':260, 
	'text':"""-MISSTRAUISCH gegenüber Salem.
	-MISSTRAUISCH gegenüber Grolk.
	-VERTRAUEND von Zardri.
	-MISSTRAUISCH gegenüber Kallysta.
	-FREUNDLICH mit Obrulena.
	-VERTRAUEND von Thoren.
	-VERTRAUEND von Edraele."""}
	],
	['text', {'title':'EIGENSCHAFTEN - TL;DR', 'space':480, 
	'text':("Horlin ist ein schrecklicher General, aber ein großer Schriftsteller. Deswegen betracht er erhaltene Nachrichten nicht als" +
	"Information, sondern als Anträge. Wenn jemand ihm einen Antrag schickt, versucht er einer seiner Briefe fälschen und sie dem " +
	"Antragsteller senden. Abgesehen davon hat Horlin ordinäre Eigenschaften, da er angemessen auf andere Arten von Information reagiert.")}
	],
	['text', {'title':'REAKTIV', 'space':250, 'color':Color.aqua,
	'text':"""Wird FEINDLICH (sofern er nicht schon WÜTEND ist) gegen Spieler, die entweder beabsichtigen, ihn zu angreifen, oder gegen ihn FEINDLICH/WÜTEND sind. Wird MISSTRAUISCH gegenüber FEINDSELIGEN/ÄRGERLICHEN Spielern, die beabsichtigen, mit ihm zu kooperieren."""}
	],
	['text', {'title':'GERECHTIGKEIT', 'space':140, 'color':Color.darkslategray,
	'text':"""Wird WÜTEND gegen Spieler, die ihm MASSAKRIEREN (Agressiv vs Passiv)."""}
	],
	['text', {'title':'DEDUKTION', 'space':310, 'color':Color.yellow,
	'text':("Kann die Relationen des SPIELERCHARAKTERS mit anderen Spielern an die Relationen der anderen Spieler mit ihm herleiten. " + 
	"Zum Beispiel, wenn er entdeckt, dass ein Spieler WÜTEND mit dem SPIELERCHARAKTER ist, leitet er her, dass der SPIELERCHARAKTER " +
	"WÜTEND mit diesem Spieler ist.")}
	],
	['text', {'title':'SCHRIFTSTELLER', 'color':Color.lightsteelblue,
	'text':('Nachrichten, dessen Subjekt nicht dessen Autor sind, werden nicht als Information betrachtet, sondern als Anträge. '+ 
	'Zum Beispiel, wenn jemand "X attackiert Y" ihm schickt, ändert er einen Brief von X geschrieben, um es im Brief "X attackiert Y"'+
	'zu heißen. Dann schickt er diesen Brief dem Antragsteller.')}
	],
	['text', {'title':'ARCHIVAR', 'space':400, 'color':Color.khaki,
	'text':('Ordnet Anträge nach dem Relationsniveau ihren Antragsteller und, bei einem Gleichstand, nach Erhaltsreihenfolge. Ignoriert' +
	'Anträge von ÄRGERLICHEN/FEINDSELIGEN Spielern. Nach dem Lösen eines Antrags erhöht er seine Relation mit dem Antragsteller.')}
	],
		['text', {'title':'DIPLOMATISCH', 'color':Color.darkmagenta,
	'text':"""Seine Relation mit anderen Räten und dem Führer verbessert/verschlechtert sich, wenn sie mit seinen Abstimmungspolitik zustimmen/nicht zustimmen."""}
	],
	['text', {'title':'AKTIONPRIORITAET', 'space':400, 
	'text':"""1- Mit dem aktuellen Antrag ändert er den Brief von X so lange, bis der den Antrag widerspiegeln.
	2- Mit dem aktuellen Antrag sendet er den geänderten Brief zum Antragsteller. Vorrückt zum nächsten Antrag.
	3- Forscht einen VERDÄCHTIGEN/FEINDSELIGEN Spieler nach.
	4- Attackiert einen ÄRGERLICHEN Spieler.
	5- Forscht einen VERTRAUTEN Spieler nach.
	6- Falls er nicht der zweite in der Reihenfolge ist, erhöht seinen Einfluss. 
	7- Attackiert einen FEINDSELIGEN Spieler."""}
	]],
	# Obrulena
	[['text', {'title':'OBRULENA', 'space':260,
	'text':"""Die nomadische Mönchin aus den Gigraltar-Ebenen hat vor, Friede in die ganzen Region zu bringen. Obrulena versucht es immer, Konflikte zwischen ihren Verbündeten und Gegnern zu schlichten.
	Rasse: Loxodon"""}
	],
	['text', {'title':'ANFANGSRELATIONEN', 'space':260, 
	'text':"""-MISSTRAUISCH gegenüber Salem.
	-FEINDLICH gegenüber Grolk.
	-VERTRAUEND von Kallysta.
	-VERTRAUEND von Horlin.
	-VERTRAUEND von Thoren.
	-MISSTRAUISCH gegenüber Edraele."""}
	],
	['text', {'title':'EIGENSCHAFTEN - TL;DR', 'space':440, 
	'text':"""Als eine Promoterin von Frieden, vertraut Obrulena schnell jeder, den sie eine Briefe gesendet hat, oder der schon ein Freund eines Freunds ist. 
	Anderenseits ist jeder Massakre jemand begeht ein schweres Vergehen gegen ihren Dogmen. Sie glaubt immer an ihre Verbündeten und glaubt nie an Spieler, die sie nicht noch vertraut.
	Wegen ihrer traditionellen Ansicht, hat sie größer Respekt vor dem Spieler, der größten Einfluss hat."""}
	],
	['text', {'title':'GELASSEN', 'space':170, 'color':Color.aqua,
	'text':"""Ihre Relation mit einem Spieler verbessert sich jedes Mal, wenn sie eine Briefe an ihn sendet."""}
	],
	['text', {'title':'PAZIFIST', 'space':170, 'color':Color.aqua,
	'text':"""Ihre Relation mit einem Spieler verschlechtert sich zweimal bei jedem MASSAKRE (Agressiv vs Passiv), den sie herausfindet, dieser Spieler begangen hat."""}
	],
	['text', {'title':'REAKTIV', 'space':250, 'color':Color.aqua,
	'text':"""Wird FEINDLICH (sofern er nicht schon WÜTEND ist) gegen Spieler, die entweder beabsichtigen, ihn zu angreifen, oder gegen ihn FEINDLICH/WÜTEND sind. Wird MISSTRAUISCH gegenüber FEINDLICHEN/ÄRGERLICHEN Spielern, die beabsichtigen, mit ihm zu kooperieren."""}
	],
	['text', {'title':'INTUITION', 'space':360, 'color':Color.gold,
	'text':"""Wenn sie den SPIELERCHARAKTER nachforscht, betrachtet seine Relation mit anderen Spielern auf Grund ihren letzen Matchs. 
	Falls eine Massaker auf irgendeiner Seite es gab: WÜTEND
	Falls es Kämpf gab: FEINDLICH 
	Falls es Kooperation gab: VERTRAUEND 
	Falls es kein Match gab (Runde 1): MISSTRAUISCH"""}
	],
	['text', {'title':'ALLIANZ', 'space':300, 'color':Color.blue,
	'text':"""Wird VERTRAUEND (sofern wenn schon WÜTEND oder FREUNDLICH) eines Spielers, entweder wenn sie herausfindet, dass dieser Spieler mit einem VERTRAUTEN/BEFREUNDETEN Spieler kooperieren wird, oder wenn sie herausfindet, dass ein VERTRAUTER/BEFREUNDETER Spieler diesen Spieler als VERTRAUT/BEFREUNDET betrachtet."""}
	],
	['text', {'title':'SIMPEL', 'space':220, 'color':Color.darkgreen,
	'text':"""Glaubt immer an VERTRAUTE/BEFREUNDETE Spieler. Glaubt nie an andere Spieler, aber erinnert sich immer noch an ihre Worte."""}
	],
	['text', {'title':'DIPLOMATISCH', 'color':Color.darkmagenta,
	'text':"""Ihre Relation mit anderen Räten und dem Führer verbessert/verschlechtert sich, wenn sie mit ihren Abstimmungspolitik zustimmen/nicht zustimmen."""}
	],
	['text', {'title':'AKTIONPRIORITAET', 'space':400, 
	'text':"""1- Nur einmal pro Runde. Wählt zwei VERTRAUTEN/BEFREUNDETEN Spieler, die nicht beide miteinander VERTRAUEND/FREUNDLICH sind:
	  1a- Wenn einer von ihnen Allianz, aber nicht Loyalitaeten hat, erzählt diesen Spieler, dass der andere mit Obrulena kooperieren wird.
	  1b- Andernfalls erzählt ihn, dass der andere mit ihm kooperieren wird.
	2- Nur wenn sie eine Briefe in (1) gesendet hat:
	  2a- Wenn der Subjekt der Briefe Allianz, aber nicht Loyalitaeten hat, erzählt diesen Spieler, dass der Objekt der Briefe mit Obrulena kooperieren wird.
	  2b- Andernfalls erzählt ihn, dass der mit ihm kooperieren wird.
	3- Erzählt einen VERDÄCHTIGEN/VERTRAUTEN Spieler ohne Intrige, dass sie mit dem kooperieren wird.
	4- Forscht der Subjekt einer Nachricht, an die sie glaubt und die einen Angriff erwähnt, nach.
	5- Attackiert einen ÄRGERLICHEN Spieler.
	6- Attackiert einen FEINDSELIGEN Spieler.
	7- Erzählt einen FEINDSELIGEN Spieler, dass sie den attackieren wird.
	8- Falls sie nicht die erste in der Reihenfolge ist, erhöht ihren Einfluss. 
	9- Forscht einen VERDÄCHTIGEN Spieler nach."""}
	]],
	# Thoren
	[['text', {'title':'THOREN', 'space':180,
	'text':"""Ein großartiger Verbündeter und ein ängstlicher Gegner. Thoren Thoren greatly values loyalty above all else.
	Rasse: Zwerg"""}
	],
	['text', {'title':'ANFANGSRELATIONEN', 'space':260, 
	'text':"""-FEINDLICH gegenüber Salem.
	-WÜTEND mit Grolk.
	-MISSTRAUISCH gegenüber Kallysta.
	-VERTRAUEND gegenüber Horlin.
	-MISSTRAUISCH gegenüber Obrulena.
	-VERTRAUEND von Edraele."""}
	],
	['text', {'title':'EIGENSCHAFTEN - TL;DR', 'space':480, 
	'text':"""Thoren glaubt immer an seine Freunde und zweifelt an seinen Feinden. Er versucht es, verdächtige Information nachzuforschen, aber ignoriert die, wenn er das nicht machen kann.
	Außerdem hasst er Spieler, die seine Freunde attackieren, und freundet sich mit Spielern, die seine Freunde auch gemöcht werden. Wenn sich jedoch jemand mit seinen ärgerlichen Feinden anfreundet, wird er feindlich gegen den.
	Thoren reagiert angemessen auf Information, an die er glaubt, indem er Spieler, die ihn attackieren, attackiert, und Frieden mit denen zu schließen, die dasselbe tun. Er hasst es, verraten zu werden."""}
	],
	['text', {'title':'REAKTIV', 'space':250, 'color':Color.aqua,
	'text':"""Wird FEINDLICH (sofern er nicht schon WÜTEND ist) gegen Spieler, die entweder beabsichtigen, ihn zu angreifen, oder gegen ihn FEINDLICH/WÜTEND sind. Wird MISSTRAUISCH gegenüber FEINDSELIGEN/ÄRGERLICHEN Spielern, die beabsichtigen, mit ihm zu kooperieren."""}
	],
	['text', {'title':'GERECHTIGKEIT', 'space':140, 'color':Color.darkslategray,
	'text':"""Wird WÜTEND gegen Spieler, die ihm MASSAKRIEREN (Agressiv vs Passiv)."""}
	],
	['text', {'title':'INTUITION', 'space':360, 'color':Color.gold,
	'text':"""Wenn er den SPIELERCHARAKTER nachforscht, betrachtet er seine Relation mit anderen Spielern auf Grund ihren letzen Matchs. 
	Falls eine Massaker auf irgendeiner Seite es gab: WÜTEND
	Falls es Kämpf gab: FEINDLICH 
	Falls es Kooperation gab: VERTRAUEND 
	Falls es kein Match gab (Runde 1): MISSTRAUISCH"""}
	],
	['text', {'title':'BRUDERSCHAFT', 'space':310, 'color':Color.darkblue,
	'text':"""Wird FEINDLICH (sofern er nicht schon WÜTEND oder FREUNDLICH ist) gegen einen Spieler, entweder wenn er herausfindet, dass dieser Spieler einen VERTRAUTEN/BEFREUNDETEN Spielern angreifen wird, oder wenn er herausfindet, dass dieser Spieler FEINDLICH/WÜTEND gegen einen VERTRAUTEN/BEFREUNDETEN Spielern ist."""}
	],
	['text', {'title':'ALLIANZ', 'space':300, 'color':Color.blue,
	'text':"""Wird VERTRAUEND (sofern er nicht schon WÜTEND oder FREUNDLICH ist) eines Spielers, entweder wenn er herausfindet, dass dieser Spieler mit einem VERTRAUTEN/BEFREUNDETEN Spieler kooperieren wird, oder wenn er herausfindet, dass ein VERTRAUTER/BEFREUNDETER Spieler diesen Spieler als VERTRAUT/BEFREUNDET betrachtet."""}
	],
	['text', {'title':'LOYALITAETEN', 'space':220, 'color':Color.orange,
	'text':"""Wird FEINDLICH (sofern er nicht schon WÜTEND ist) gegen einen Spieler, entweder wenn er herausfindet, dass dieser Spieler mit einen ÄRGERLICHEN Spieler kooperieren wird, oder wenn er herausfindet, dass dieser Spieler VERTRAUEND/FREUNDLICH mit einem ÄRGERLICHEN Spieler ist."""}
	],
	['text', {'title':'GENERAL', 'space':180, 'color':Color.cyan,
	'text':"""Seine Relation verbessert, wenn man ihm Information gibt, die er herausfindet, dass die wahr ist. Das Gegenteil passiert mit Information, die er herausfindet, dass die falsch ist."""}
	],
	['text', {'title':'TAKTISCH', 'space':400, 'color':Color.lightgreen,
	'text':"""Glaubt immer an Information von VERTRAUTEN/BEFREUDETEN Spielern. Glaubt an das Gegenteil davon, was ein FEINDLICHER/ÄRGERLICHER Spieler ihn über anderen Spielern erzählt hat, und ignoriert was der sagt, wenn der sich selbst erwähnt. 
	Forscht Info von VERDÄCHTIGEN Spieler nach, oder ignoriert die, falls er das nicht machen kann. Trotzdem erinnert er sich für zwei Runde davon, was sie eigentlich gesagt haben (für General)."""}
	],
	['text', {'title':'DIPLOMATISCH', 'color':Color.darkmagenta,
	'text':"""Seine Relation mit anderen Räten und dem Führer verbessert/verschlechtert sich, wenn sie mit seinen Abstimmungspolitik zustimmen/nicht zustimmen."""}
	],
	['text', {'title':'AKTIONPRIORITAET', 'space':400, 
	'text':"""1- Attackiert einen ÄRGERLICHEN Spieler.
	2- Erzählt einen VERTRAUTEN/BEFREUNDETEN Spieler, dass ein ÄRGERLICHER Spieler diesen Spieler attackieren wird.
	3- Attackiert einen FEINDSELIGEN Spieler.
	4- Teilt Information mit einem VERTRAUTEN/BEFREUNDETEN Spieler über einen eingehenden Angriff gegen dem.
	5- Erzählt einen VERTRAUTEN/BEFREUNDETEN Spieler, dass ein FEINDSELIGER Spieler diesen Spieler attackieren wird.
	6- Forscht den Subjekt eines Briefes nach, den er von einem VERDÄCHTIGEN Spieler erhalten hat.
	7- Erzählt einen VERTRAUTEN/BEFREUNDETEN Spieler, dass ein anderer VERTRAUTEN/BEFREUNDETER Spieler mit diesem Spieler kooperieren wird.
	8- Forscht einen VERDÄCHTIGEN Spieler nach.
	9- Falls er nicht der erster in der Reihenfolge ist, erhöht seinen Einfluss. 
	10- Forscht einen VERTRAUTEN Spieler nach."""}
	]],
	# Edraele
	[['text', {'title':'EDRAELE', 'space':180,
	'text':"""Manipulativ. Verhaltet sich als freundlich, aber sie kann anderen verraten. Dynamisch pass sich auf den Spieler an.
	Race: Elf"""}
	],
	['text', {'title':'ANFANGSRELATIONEN', 'space':260, 
	'text':"""-MISSTRAUISCH gegenüber Salem.
	-MISSTRAUISCH gegenüber Grolk.
	-MISSTRAUISCH gegenüber Kallysta.
	-VERTRAUEND von Horlin.
	-MISSTRAUISCH gegenüber Obrulena.
	-VERTRAUEND von Thoren."""}
	],
	['text', {'title':'EIGENSCHAFTEN - TL;DR', 'space':560, 
	'text':"""Edraele ändert ihres Verhalten auf Grund ihrer Relation mit dem Spielercharakter. Wenn sie Information erhaltet, vergleicht sie die mit früheren Daten und bestimmt es, was echt oder falsch ist.
	Sie reagiert entsprechend zu Information, an die sie glaubt, indem 
	Edraele changes her behavior based on how she views the Player Character. When receiving information, she cross-references it to previous data and determines what is true and what is not.
	She reacts appropriately to information she believes, attacking enemies who attack her and making peace with those that do the same. She also imitates the feelings of her opponents, if possible.
	She gets Enraged with players that betray her and Hostile to players that she just betrayed. Finally, she dislikes players that ally with her enemies and likes players that attack them instead."""}
	],
	['text', {'title':'AGENDA', 'space':180, 'color':Color.pink,
	'text':"""Am Anfang jeder Runde verändert ihre Aktionpriorität auf Grund ihrer Relation mit dem SPIELERCHARAKTER."""}
	],
	['text', {'title':'VERRAT', 'space':180, 'color':Color.darkred,
	'text':"""Wird FEINDLICH (sofern er nicht schon WÜTEND ist) gegen Spieler, die von ihr massakriert werden (Passiv vs Agressiv)."""}
	],
	['text', {'title':'REAKTIV', 'space':250, 'color':Color.aqua,
	'text':"""Wird FEINDLICH (sofern er nicht schon WÜTEND ist) gegen Spieler, die entweder beabsichtigen, ihn zu angreifen, oder gegen ihn FEINDLICH/WÜTEND sind. Wird MISSTRAUISCH gegenüber FEINDLICHEN/ÄRGERLICHEN Spielern, die beabsichtigen, mit ihm zu kooperieren."""}
	],
	['text', {'title':'GERECHTIGKEIT', 'space':140, 'color':Color.darkslategray,
	'text':"""Wird WÜTEND gegen Spieler, die ihm MASSAKRIEREN (Agressiv vs Passiv)."""}
	],
	['text', {'title':'EIFERSUCHT', 'space':180, 'color':Color.purple,
	'text':"""Wird WÜTEND gegen Spielern, von denen sie entdeckt, dass sie mehr Punkte haben als sie selbst. Wenn sie entdeckt, dass das nicht mehr der Fall ist, wird FEINDLICH stattdessen."""}
	],
	['text', {'title':'DEDUKTION', 'space':310, 'color':Color.yellow,
	'text':"""Kann die Relationen des SPIELERCHARAKTERS mit anderen Spielern an die Relationen der anderen Spieler mit ihm herleiten. Zum Beispiel, wenn sie entdeckt, dass ein Spieler WÜTEND mit dem SPIELERCHARAKTER ist, leitet sie her, dass der SPIELERCHARAKTER WÜTEND mit diesem Spieler ist."""}
	],
	['text', {'title':'LOYALITAETEN', 'space':220, 'color':Color.orange,
	'text':"""Wird FEINDLICH (sofern er nicht schon WÜTEND ist) gegen einen Spieler, entweder wenn er herausfindet, dass dieser Spieler mit einen ÄRGERLICHEN Spieler kooperieren wird, oder wenn er herausfindet, dass dieser Spieler VERTRAUEND/FREUNDLICH mit einem ÄRGERLICHEN Spieler ist."""}
	],
	['text', {'title':'FASSADE', 'space':140, 'color':Color.black,
	'text':"""Wenn nicht WÜTEND mit einem Spieler ist, imitiert seine Relation, nachdem sie ihn nachgeforscht hat."""}
	],
	['text', {'title':'INTRIGE', 'space':610, 'color':Color.darkcyan,
	'text':"""Wenn sie Briefe erhaltet, vergleicht sie die Information mit früheren Daten. Wenn es einen Widerspruch zwischen Nachricht und Daten gibt, glaubt sie an die Daten. Wenn der Widerspruch zwischen Briefe ist, gibt sie den Vorrang dem Brief des vertrauenswürdiger Absenders.
	Falls es keinen Widerspruch gibt und der Brief von einem Verdächtigen Spieler kommt, forscht sie die Gültigkeit dieser Information nach, wenn möglich. Wenn nicht, lehnt sie ab.
	Auf jeden Fall wird sie WÜTEND, wenn sie entdeckt, dass die Information falsch ist. Auf der anderen Seite, wenn die Information echt ist und den Absender nicht erwähnt, verbessert sie seine Relation zu ihm."""}
	],
	['text', {'title':'DIPLOMATISCH', 'color':Color.darkmagenta,
	'text':"""Ihre Relation mit anderen Räten und dem Führer verbessert/verschlechtert sich, wenn sie mit ihren Abstimmungspolitik zustimmen/nicht zustimmen."""}
	],
	['text', {'title':'AKTIONPRIORITAET (FREUNDLICH/VERTRAUEND)', 'space':800, 
	'text':"""1- Falls es Runde 6 ist, attackiert jeden Spieler.
	2- Forscht einen FEINDSELIGEN/VERDÄCHTIGEN Spieler, der Krieger hat, nach.
	3- Attackiert einen ÄRGERLICHEN Spieler.
	4- Attackiert einen FEINDSELIGEN Spieler.
	5- Attackiert einen VERDÄCHTIGEN Spieler, der Krieger hat und gegenüber zumindest einem weiteren Spieler MISSTRAUISCH ist.
	6- Teilt Information mit einem FEINDSELIGEN/VERDÄCHTIGEN Spieler, der Krieger hat, über einen eingehenden Angriff gegen den.
	7- Forscht den Subjekt von einer Nachricht, die sie von einem VERDÄCHTIGEN/FEINDSELIGEN Spieler erhalten hat, nach.
	8- Teilt Information mit einem BEFREUNDETEN/VERTRAUTEN Spieler über einen eingehenden Angriff gegen den.
	9- Falls sie nicht die Erste in der Reihenfolge ist, erhöht ihren Einfluss.
	10- Erzählt einem BEFREUDETEN/VERTRAUTEN Spieler, dass ein FEINDSELIGER/ÄRGERLICHER Spieler sie attackieren wird.
	11- Erzählt einem BEFREUDETEN/VERTRAUTEN Spieler, dass ein VERDÄCHTIGER Spieler sie attackieren wird. Nur einmal pro Runde.
	12- Forscht einen ÄRGERLICHEN/FEINDSELIGEN/VERDÄCHTIGEN Spieler, der Krieger nicht hat, nach."""}
	],
	['text', {'title':'AKTIONPRIORITAET (MISSTRAUISCH)', 'space':680, 'color':Color.black,
	'text':"""1- Falls es Runde 6 ist, attackiert jeden Spieler.
	2- Forscht einen FEINDSELIGEN/VERDÄCHTIGEN Spieler, der Krieger hat, nach.
	3- Attackiert einen ÄRGERLICHEN Spieler.
	4- Attackiert einen FEINDSELIGEN Spieler.
	5- Attackiert einen VERDÄCHTIGEN Spieler, der Krieger hat und gegenüber zumindest einem weiteren Spieler MISSTRAUISCH ist.
	6- Teilt Information mit einem FEINDSELIGEN/VERDÄCHTIGEN Spieler, der Krieger hat, über einen eingehenden Angriff gegen den.
	7- Forscht den Subjekt von einer Nachricht, die sie von einem VERDÄCHTIGEN Spieler erhalten hat, nach.
	8- Forscht einen VERDÄCHTIGEN Spieler nach.
	9- Erzählt einem BEFREUDETEN/VERTRAUTEN Spieler, dass ein FEINDSELIGEN Spieler sie attackieren wird.
	10- Wenn sie der Erste in der Reihenfolge nicht ist, erhöht ihren Einfluss.
	11- Attackiert einen VERDÄCHTIGEN Spieler."""}
	],
	['text', {'title':'AKTIONPRIORITAET (FEINDLICH/WÜTEND)', 'space':280, 'color':Color.black,
	'text':"""1- Attackiert einen ÄRGERLICHEN Spieler.
	2- Erzählt einem VERTRAUTEN/BEFREUNDETEN Spieler, der Brudenschaft hat, dass ein ÄRGERLICHER Spieler, den in (1) erwähnt wurde, sie attackieren wird.
	3- Sendet wieder eine Briefe, die sie glaubt, falsch ist und von einem ÄRGERLICHEN Spieler geschrieben wurde, an einen Spieler, der MISSTRAUISCH gegenüber ihm ist.
	4- Attackiert einen FEINDSELIGEN Spieler.
	5- Erzählt einem VERTRAUTEN/BEFREUDETEN Spieler, der Brudenschaft hat, dass ein FEINDSELIGEN Spieler sie attackieren wird.
	6- Wenn sie der Erste in der Reihenfolge nicht ist, erhöht ihren Einfluss."""}
	],
	['text', {'title':'ABSTIMMUNGSPOLITIK',
	'text':"""1- Nein, wenn es ein Angriff gegen sie oder einen BEFREUNDETEN Spieler.
	2- Ja, wenn es ein Angriff gegen sie oder einen FEINDSELIGEN/ÄRGERLICHEN Spieler.
	3- Ja, wenn der Führer VERTRAUTER/BEFREUNDETER ist.
	4- Nein, wenn der Führer FEINDSELIGER/ÄRGERLICHER."""}
	],
	['text', {'title':'VORSCHLAGPRIORITAET',
	'text':"""1- Angriff gegen einen ÄRGERLICHEN Spieler.
	2- Angriff gegen einen FEINDSELIGEN Spieler.
	3- Friede mit ihr selbst."""}
	]],
	
	# Drakoth
	[['text', {'title':'DRAKOTH', 'space':180,
	'text':"""The brash heir to the Empire's throne is as good in battle as he is in court, using his dynastic powers to their full potential.
	Race: Dragonborn"""}
	],
	['text', {'title':'INITIAL RELATIONS', 'space':260, 
	'text':"""-SUSPICIOUS of Salem.
	-HOSTILE to Grolk.
	-HOSTILE to Zardri.
	-HOSTILE to Kallysta.
	-TRUSTFUL of Obrulena.
	-TRUSTFUL of Horlin.
	-TRUSTFUL of Thoren."""}
	],
	['text', {'title':'TRAITS - TL;DR', 'space':480, 
	'text':("Drakoth is the ambitious heir to the empire's throne, and as such evaluates the player " +
	"based on they way they vote and becomes Enraged if someone tries to take the Leader position away from him. " +
	"As a fearsome and honorable warrior, Drakoth is very keen on protecting and consolidating his circle of allies, " +
	"becoming Trustful of those who trust his allies but becoming Hostile against those who attack them. He also doesn't " +
	"appreciate when someone allies with his most Enraging enemies. Aside from that, Drakoth reacts appropriately to " +
	"incoming agression, attacking enemies who attack him and making peace with those that do the same." +
	"He does, however, only believe on his allies, making manipulation a bit trickier to pull off.")}
	],
	['text', {'title':'STRATEGY', 'color':Color.brown,
	'text':"""His Proposal Priority changes at the beginning of each round based on his Relation with the Player Character."""}
	],
	['text', {'title':'HEIR', 'color':Color.darkviolet,
	'text':("Becomes ENRAGED with players that, through reducing his Influence or increasing someone else’s, " +
	"makes him lose position in the Influence Track.")}
	],
	['text', {'title':'REACTIVE', 'space':250, 'color':Color.aqua,
	'text':"""Becomes HOSTILE (unless already ENRAGED) to a player he discovers is planning to attack him or is HOSTILE/ENRAGED against him. Becomes SUSPICIOUS of an ENRAGING/HOSTILIZED player that he discovers is planning to ally with him."""}
	],
	['text', {'title':'JUSTICE', 'space':140, 'color':Color.darkslategray,
	'text':"""Becomes ENRAGED to players that SLAUGHTER (Agressive vs Passive) him."""}
	],
	['text', {'title':'INSIGHT', 'space':340, 'color':Color.lightseagreen,
	'text':"""Can deduce the Player Character's relation with other players based on how they vote on specific proposals with said players as target:
	-Aye for War: ENRAGED
	-Nay for Peace: HOSTILE
	-Null: SUSPICIOUS
	-Aye for Peace: TRUSTFUL
	-Nay for War: FRIENDLY"""}
	],
	['text', {'title':'BROTHERHOOD', 'space':260, 'color':Color.darkblue,
	'text':"""Becomes HOSTILE (unless already ENRAGED or FRIENDLY) to a player when he either discovers that this player will attack a TRUSTED/BEFRIENDED player, or that this player is HOSTILE/ENRAGED against a TRUSTED/BEFRIENDED player."""}
	],
	['text', {'title':'ALLIANCE', 'space':260, 'color':Color.blue,
	'text':"""Becomes TRUSTFUL (unless already ENRAGED or FRIENDLY) of a player when he either discovers that this player will ally with a TRUSTED/BEFRIENDED player, or that a TRUSTED/BEFRIENDED player is TRUSTFUL/FRIENDLY towards this player."""}
	],
	['text', {'title':'ALLEGIANCES', 'space':220, 'color':Color.orange,
	'text':"""Becomes HOSTILE (unless already ENRAGED) to a player when he discovers that this player will ally with an ENRAGING player or that this player finds an ENRAGING player to be TRUSTFUL/FRIENDLY."""}
	],
	['text', {'title':'SIMPLE-MINDED', 'color':Color.darkgreen,
	'text':"""Always believes info from a TRUSTED/BEFRIENDED player. Never believes info from others, though he remembers of what they said."""}
	],
	['text', {'title':'DIPLOMATIC', 'color':Color.darkmagenta,
	'text':"""His relation with other voters and the Leader improves/degrades when they agree/disagree with his Voting Policies."""}
	],
	['text', {'title':'ACTION PRIORITY',
	'text':"""1- Attack an ENRAGING player.
	2- Tell a TRUSTED/BEFRIENDED player with BROTHERHOOD that an ENRAGING player will attack him.
	3- Attack a HOSTILIZED player.
	4- If he's not the first in the Influence track, increase his Influence.
	5- Tell a TRUSTED/BEFRIENDED player with BROTHERHOOD that a HOSTILIZED player will attack him.
	6- Investigate a SUSPICIOUS player.
	7a- If it's an even round, investigate a HOSTILIZED/ENRAGING player.
	7b- If it's an odd round, investigate a TRUSTED/BEFRIENDED player."""}
	],
	['text', {'title':'VOTING POLICIES',
	'text':"""1- Nay."""}
	],
	['text', {'title':'PROPOSAL PRIORITY (SUSPICIOUS/TRUSTFUL/FRIENDLY)',
	'text':"""1- If the sum of all votes from TRUSTED/BEFRIENDED players is over 2, peace to himself.
	2- If no TRUSTED/BEFRIENDED players with ALLEGIANCES are ENRAGED with a SUSPECTED player, peace to this SUSPECTED player.
	3- If no TRUSTED/BEFRIENDED players are BEFRIENDED with a HOSTILIZED/ENRAGING player, attack on this HOSTILIZED/ENRAGING player.
	4- Peace to himself."""}
	],
	['text', {'title':'PROPOSAL PRIORITY (HOSTILE/ENRAGED)',
	'text':"""1- Attack on an ENRAGING player.
	2- Attack on a HOSTILIZED player."""}
	]],
	]
	
	return de_pages
