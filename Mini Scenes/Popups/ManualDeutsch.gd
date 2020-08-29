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
	-MISSTRAUISCH gegenüber Edraele.
	-FEINDLICH gegenüber Drakoth."""}
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
	5- Attackiert einen VERDÄCHTIGEN Spieler.
	6- Falls er nicht der erste in der Reihenfolge ist, erhöht seinen Einfluss."""}
	],
	['text', {'title':'ABSTIMMUNGSPOLITIK',
	'text':"""1- Ja, wenn es einen Angriff gegen einen FEINDSELIGEN/ÄRGERLICHEN Spieler ist.
	2a- Nein, wenn es einen Angriff gegen einen BEFREUNDETEN Spieler oder ihn selbst ist.
	2b- Nein, wenn es Friede mit einem ÄRGERLICHEN Spieler ist.
	3- Ja, wenn der Führer BEFREUNDETEN ist.
	4a- Nein, wenn es einen Angriff gegen einen VERTRAUTEN Spieler ist.
	4b- Nein, wenn es Friede mit einem FEINDSELIGEN Spieler ist.
	5- Ja, wenn der Führer VERTRAUTEN ist. 
	6- Nein."""}
	],
	['text', {'title':'VORSCHLAGPRIORITAET',
	'text':"""1- Angriff gegen einen ÄRGERLICHEN Spieler.
	2- Angriff gegen einen FEINDSELIGEN Spieler.
	3- Angriff gegen einen VERDÄCHTIGEN Spieler.
	4- Friede mit ihm selbst."""}
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
	-MISSTRAUISCH gegenüber Edraele.
	-MISSTRAUISCH gegenüber Drakoth."""}
	],
	['text', {'title':'EIGENSCHAFTEN - TL;DR',
	'text':"""Die Hauptstrategie von Zardri ist Verrat. Wenn jemand von mehreren Spielern attackiert wird, nimmt Zardri
	diese Gelegenheit, um ihn in seinem angreifbarsten Zustand zu verraten. Jedoch vermeidet er, verraten zu werden, und deswegen
	glaubt er nie Informationen von anderen Spielern und wird wütend im ersten Anzeichen von Gefähr.'"""}
	],
	['text', {'title':'HINTERHALT', 'color':Color.mediumvioletred,
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
	],
	['text', {'title':'ABSTIMMUNGSPOLITIK',
	'text':"""1- Nein, wenn es einen Angriff gegen ihn selbst ist.
	2a- Ja, wenn es einen Angriff gegen einen anderen Spieler ist.
	2b- Ja, wenn es Friede mit ihm selbst ist."""}
	],
	['text', {'title':'VORSCHLAGPRIORITAET',
	'text':"""1- Angriff gegen einen ÄRGERLICHEN Spieler.
	2- Angriff gegen einen FEINDSELIGEN Spieler.
	3- Friede mit ihm selbst."""}
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
	-MISSTRAUISCH gegenüber Edraele.
	-MISSTRAUISCH gegenüber Drakoth."""}
	],
	['text', {'title':'EIGENSCHAFTEN - TL;DR', 'space':570, 
	'text':"""Kallystas indivdualistische Art macht es ihr unmöglich, Freundlich zu anderen zu werden. Sie ist ziemlich gut darin, Informationen zu finden und zu interpretieren, und sie verwendet diese Fähigkeit, um das Verhalten anderer Spieler vorherzusagen.
	Kallystas charakteristische Eigenschaft, Kettebrecher, macht sie Feindlich gegenüber Spieler, die mehrere Verbündete haben. Mit Diplomatie und Nachforschungen kann die tiefling Führer schnell starke Allianze brechen.
	Außerdem reagiert sie angemessen auf erhaltene Information, indem sie sich gegen Feinde verteidigt."""}
	],
	['text', {'title':'AUFMERKSAM', 'color':Color.navyblue,
	'text':"""Verschlechtert ihre Relation mit Spielern, die den Einfluss von FEINDSELIGEN/ÄRGERLICHEN Spielern erhöht. Das Gegenteil passiert mit nicht-ÄRGERLICHEN Spielern, die ihn stattdessen reduziert."""}
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
	6- Wenn der Führer FEINDSELIGEN/ÄRGERLICHEN ist, reduziert seinen Einfluss.
	7- Erzählt einen VERDÄCHTIGEN Spieler, dass sie mit ihm kooperieren wird.
	8- Forscht einen FEINDSELIGEN Spieler nach.
	9- Forscht einen VERTRAUTEN Spieler nach."""}
	],
	['text', {'title':'ABSTIMMUNGSPOLITIK',
	'text':"""1- Nein, wenn es einen Angriff gegen sie selbst ist.
	2a- Ja, wenn es einen Angriff gegen einen FEINDSELIGEN/ÄRGERLICHEN Spieler ist.
	2b- Ja, wenn es Friede mit ihr selbst ist.
	4- Nein, wenn der Führer FEINDSELIGEN/ÄRGERLICHEN ist."""}
	],
	['text', {'title':'VORSCHLAGPRIORITAET',
	'text':"""1- Angriff gegen einen ÄRGERLICHEN Spieler.
	2- Friede mit ihm selbst."""}
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
	-VERTRAUEND von Edraele.
	-VERTRAUEND von Drakoth."""}
	],
	['text', {'title':'EIGENSCHAFTEN - TL;DR', 'space':480, 
	'text':("Horlin ist ein schrecklicher General, aber ein großer Schriftsteller. Deswegen betracht er erhaltene Nachrichten nicht als" +
	"Information, sondern als Anträge. Wenn jemand ihm einen Antrag schickt, versucht er einer seiner Briefe fälschen und sie dem " +
	"Antragsteller senden. Abgesehen davon hat Horlin ordinäre Eigenschaften, da er angemessen auf andere Arten von Information reagiert.")}
	],
	['text', {'title':'AUFMERKSAM', 'color':Color.navyblue,
	'text':"""Verschlechtert seine Relation mit Spielern, die den Einfluss von FEINDSELIGEN/ÄRGERLICHEN Spielern erhöht. Das Gegenteil passiert mit nicht-ÄRGERLICHEN Spielern, die ihn stattdessen reduziert."""}
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
	4- Wenn ein ÄRGERLICHEN Spieler mehr oder gleichem Einfluss als er hat, reduziert ihn.
	5- Attackiert einen ÄRGERLICHEN Spieler.
	6- Forscht einen VERTRAUTEN Spieler nach.
	7- Falls er nicht der zweite in der Reihenfolge ist, erhöht seinen Einfluss. 
	8- Attackiert einen FEINDSELIGEN Spieler.
	9- Erhöht den Einfluss von einen VERTRAUTEN/BEFREUNDETEN Spieler, es sei denn dieser Spieler in der zweiten Position ist und der Führer THRONFOLGER hat und VERTRAUTER/BEFREUNDETER ist."""}
	],
	['text', {'title':'ABSTIMMUNGSPOLITIK',
	'text':"""1- Nein, wenn es einen Angriff gegen ihn selbst ist.
	2- Ja, wenn der Führer BEFREUNDETEN ist.
	3- Ja, wenn es Friede mit ihr selbst ist.
	4- Nein, wenn der Führer FEINDSELIGEN/ÄRGERLICHEN ist."""}
	],
	['text', {'title':'VORSCHLAGPRIORITAET',
	'text':"""1- Friede mit ihm selbst."""}
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
	-MISSTRAUISCH gegenüber Edraele.
	-VERTRAUEND von Drakoth."""}
	],
	['text', {'title':'EIGENSCHAFTEN - TL;DR', 'space':440, 
	'text':"""Als eine Promoterin von Frieden, vertraut Obrulena schnell jeder, den sie eine Briefe gesendet hat, oder der schon ein Freund eines Freunds ist. 
	Anderenseits ist jeder Massakre jemand begeht ein schweres Vergehen gegen ihren Dogmen. Sie glaubt immer an ihre Verbündeten und glaubt nie an Spieler, die sie nicht noch vertraut.
	Wegen ihrer traditionellen Ansicht, hat sie größer Respekt vor dem Spieler, der größten Einfluss hat."""}
	],
	['text', {'title':'EHRGEIZIG', 'color':Color.orangered,
	'text':"""Verschlechtert ihre Relation mit Spielern, die ihren Einfluss reduziert. Das Gegenteil passiert mit nicht-ÄRGERLICHEN Spielern, die ihn stattdessen erhöht."""}
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
	  1a- Wenn einer von ihnen ALLIANZ, aber nicht LOYALITAETEN hat, erzählt diesen Spieler, dass der andere mit Obrulena kooperieren wird.
	  1b- Andernfalls erzählt ihn, dass der andere mit ihm kooperieren wird.
	2- Nur wenn sie eine Briefe in (1) gesendet hat:
	  2a- Wenn der Agent der Briefe ALLIANZ, aber nicht LOYALITAETEN hat, erzählt diesen Spieler, dass der Objekt der Briefe mit Obrulena kooperieren wird.
	  2b- Andernfalls erzählt ihn, dass der mit ihm kooperieren wird.
	3- Erzählt einen VERDÄCHTIGEN/VERTRAUTEN Spieler ohne Intrige, dass sie mit dem kooperieren wird.
	4- Forscht der Agent einer Nachricht, an die sie glaubt und die einen Angriff erwähnt, nach.
	5- Attackiert einen ÄRGERLICHEN Spieler.
	6- Attackiert einen FEINDSELIGEN Spieler.
	7- Erzählt einen FEINDSELIGEN Spieler, dass sie den attackieren wird.
	8- Falls sie nicht die erste in der Reihenfolge ist, erhöht ihren Einfluss, es sei denn der Führer THRONFOLGER hat und VERTRAUTER/BEFREUNDETER ist.
	9- Forscht einen VERDÄCHTIGEN Spieler nach."""}
	],
	['text', {'title':'ABSTIMMUNGSPOLITIK',
	'text':"""1- Ja, wenn der Führer BEFREUNDETEN ist und es ein Angriff gegen einen FEINDSELIGEN/ÄRGERLICHEN ist.
	2- Nein, wenn es Friede ist und beide Führer und Ziel FEINDSELIGEN/ÄRGERLICHEN sind.
	3- Nein, wenn es einen Angriff ist.
	4- Ja, wenn es Friede ist."""}
	],
	['text', {'title':'VORSCHLAGPRIORITAET',
	'text':"""1- Friede mit einem VERTRAUTEN/BEFREUNDETEN Spieler.
	2- Friede mit ihr selbst."""}
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
	-VERTRAUEND von Edraele.
	-VERTRAUEND von Drakoth."""}
	],
	['text', {'title':'EIGENSCHAFTEN - TL;DR', 'space':480, 
	'text':"""Thoren glaubt immer an seine Freunde und zweifelt an seinen Feinden. Er versucht es, verdächtige Information nachzuforschen, aber ignoriert die, wenn er das nicht machen kann.
	Außerdem hasst er Spieler, die seine Freunde attackieren, und freundet sich mit Spielern, die seine Freunde auch gemöcht werden. Wenn sich jedoch jemand mit seinen ärgerlichen Feinden anfreundet, wird er feindlich gegen den.
	Thoren reagiert angemessen auf Information, an die er glaubt, indem er Spieler, die ihn attackieren, attackiert, und Frieden mit denen zu schließen, die dasselbe tun. Er hasst es, verraten zu werden."""}
	],
	['text', {'title':'AUFMERKSAM', 'color':Color.navyblue,
	'text':"""Verschlechtert seine Relation mit Spielern, die den Einfluss von FEINDSELIGEN/ÄRGERLICHEN Spielern erhöht. Das Gegenteil passiert mit nicht-ÄRGERLICHEN Spielern, die ihn stattdessen reduziert."""}
	],
	['text', {'title':'EHRGEIZIG', 'color':Color.orangered,
	'text':"""Verschlechtert seine Relation mit Spielern, die seinen Einfluss reduziert. Das Gegenteil passiert mit nicht-ÄRGERLICHEN Spielern, die ihn stattdessen erhöht."""}
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
	2- Attackiert einen FEINDSELIGEN Spieler.
	3- Erzählt einen VERTRAUTEN/BEFREUNDETEN Spieler, dass ein ÄRGERLICHER Spieler diesen Spieler attackieren wird.
	4- Teilt Information mit einem VERTRAUTEN/BEFREUNDETEN Spieler über einen eingehenden Angriff gegen dem.
	5- Erzählt einen VERTRAUTEN/BEFREUNDETEN Spieler, dass ein FEINDSELIGER Spieler diesen Spieler attackieren wird.
	6- Forscht den Subjekt eines Briefes nach, den er von einem VERDÄCHTIGEN Spieler erhalten hat.
	7- Erzählt einen VERTRAUTEN/BEFREUNDETEN Spieler, dass ein anderer VERTRAUTEN/BEFREUNDETER Spieler mit diesem Spieler kooperieren wird.
	8- Forscht einen VERDÄCHTIGEN Spieler nach.
	9- Falls er nicht der erster in der Reihenfolge ist, erhöht seinen Einfluss, es sei denn der Führer THRONFOLGER hat und VERTRAUTER/BEFREUNDETER ist. 
	10- Forscht einen VERTRAUTEN Spieler nach."""}
	],
	['text', {'title':'ABSTIMMUNGSPOLITIK',
	'text':"""1- Nein, wenn es einen Angriff gegen einen BEFREUNDETEN Spieler oder ihn selbst ist.
	2- Ja, wenn der Führer BEFREUNDETEN ist.
	3- Nein, wenn es einen Angriff gegen einen VERTRAUTEN Spieler ist.
	4- Nein, wenn es einen Angriff gegen einen FEINDSELIGEN/ÄRGERLICHEN Spieler ist.
	5- Ja, wenn der Führer VERTRAUTEN ist.
	6- Nein, wenn der Führer FEINDSELIGEN/ÄRGERLICHEN ist."""}
	],
	['text', {'title':'VORSCHLAGPRIORITAET',
	'text':"""1- Angriff gegen einen ÄRGERLICHEN Spieler.
	2- Angriff gegen einen FEINDSELIGER Spieler.
	3- Friede mit ihm selbst."""}
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
	['text', {'title':'AUFMERKSAM', 'color':Color.navyblue,
	'text':"""Verschlechtert ihre Relation mit Spielern, die den Einfluss von FEINDSELIGEN/ÄRGERLICHEN Spielern erhöht. Das Gegenteil passiert mit nicht-ÄRGERLICHEN Spielern, die ihn stattdessen reduziert."""}
	],
	['text', {'title':'EHRGEIZIG', 'color':Color.orangered,
	'text':"""Verschlechtert ihre Relation mit Spielern, die ihren Einfluss reduziert. Das Gegenteil passiert mit nicht-ÄRGERLICHEN Spielern, die ihn stattdessen erhöht."""}
	],
	['text', {'title':'VERRAT', 'space':180, 'color':Color.darkred,
	'text':"""Wird FEINDLICH (sofern er nicht schon WÜTEND ist) gegen Spieler, die von ihr massakriert werden (Passiv vs Agressiv)."""}
	],
	['text', {'title':'REAKTIV', 'space':250, 'color':Color.aqua,
	'text':"""Wird FEINDLICH (sofern er nicht schon WÜTEND ist) gegen Spieler, die entweder beabsichtigen, ihn zu angreifen, oder gegen ihn FEINDLICH/WÜTEND sind. Wird MISSTRAUISCH gegenüber FEINDLICHEN/ÄRGERLICHEN Spielern, die beabsichtigen, mit ihm zu kooperieren."""}
	],
	['text', {'title':'GERECHTIGKEIT', 'space':140, 'color':Color.darkslategray,
	'text':"""Wird WÜTEND gegen Spieler, die ihr MASSAKRIEREN (Agressiv vs Passiv)."""}
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
	'text':"""1- Wenn es Runde 6 ist, attackiert jeden Spieler.
	2- Forscht einen FEINDSELIGEN/VERDÄCHTIGEN Spieler, der Krieger hat, nach.
	3- Attackiert einen ÄRGERLICHEN Spieler.
	4- Attackiert einen FEINDSELIGEN Spieler.
	5- Attackiert einen VERDÄCHTIGEN Spieler, der Krieger hat und gegenüber zumindest einem weiteren Spieler MISSTRAUISCH ist.
	6- Teilt Information mit einem FEINDSELIGEN/VERDÄCHTIGEN Spieler, der Krieger hat, über einen eingehenden Angriff gegen den.
	7- Forscht den Subjekt von einer Nachricht, die sie von einem VERDÄCHTIGEN/FEINDSELIGEN Spieler erhalten hat, nach.
	8- Teilt Information mit einem BEFREUNDETEN/VERTRAUTEN Spieler über einen eingehenden Angriff gegen den.
	9- Falls sie nicht die Erste in der Reihenfolge ist, erhöht ihren Einfluss.
	10- Wählt einen X Spieler, von dem Edraele einen Brief hat. Dann wählt einen anderen Y Spieler, der VERTRAUEND/FREUNDLICH mit X ist. Verbringt Aktionen, um den Brief in 'Edraele kooperiert mit Y' zu ändern.
	11- Sendet wieder den geänderten Brief von X zu Y.
	12- Forscht einen Spieler nach."""}
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
	9- Wählt einen X Spieler, von dem Edraele einen Brief hat. Dann wählt einen anderen Y Spieler, der VERTRAUEND/FREUNDLICH mit X ist. Verbringt Aktionen, um den Brief in 'X attackiert Y' zu ändern.
	10- Sendet wieder den geänderten Brief von X zu Y.
	11- Erzählt einem BEFREUDETEN/VERTRAUTEN Spieler mit BRUDERSCHAFT, dass ein FEINDSELIGEN Spieler sie attackieren wird.
	12- Wenn sie der Erste in der Reihenfolge nicht ist, erhöht ihren Einfluss.
	13- Attackiert einen VERDÄCHTIGEN Spieler."""}
	],
	['text', {'title':'AKTIONPRIORITAET (FEINDLICH/WÜTEND)', 'space':280, 'color':Color.black,
	'text':"""1- Attackiert einen ÄRGERLICHEN Spieler.
	2- Erzählt einem VERTRAUTEN/BEFREUNDETEN Spieler, der BRUDENSCHAFT hat, dass ein ÄRGERLICHER Spieler, den in (1) erwähnt wurde, sie attackieren wird.
	3- Sendet wieder eine Briefe, die sie glaubt, falsch ist und von einem ÄRGERLICHEN Spieler geschrieben wurde, an einen Spieler, der MISSTRAUISCH gegenüber ihm ist.
	4- Attackiert einen FEINDSELIGEN Spieler.
	5- Erzählt einem VERTRAUTEN/BEFREUDETEN Spieler, der BRUDENSCHAFT hat, dass ein FEINDSELIGEN Spieler sie attackieren wird.
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
	'text':"""Der abrasive Thronfolger ist so gut im Kämpf als im Rat, da er seine dynastische Mächte in vollem Umfang gebraucht.
	Rasse: Dragongeborene"""}
	],
	['text', {'title':'ANFANGSRELATIONEN', 'space':260, 
	'text':"""-MISSTRAUISCH gegenüber Salem.
	-FEINDLICH gegenüber Kallysta.
	-FEINDLICH gegenüber Kallysta.
	-FEINDLICH gegenüber Kallysta.
	-VERTRAUEND von Obrulena.
	-VERTRAUEND von Horlin.
	-VERTRAUEND von Thoren."""}
	],
	['text', {'title':'EIGENSCHAFTEN - TL;DR', 'space':480, 
	'text':("Drakoth ist der ehrgeizige Thronfolger des Reiches, und deswegen bewertet er der Spieler " +
	"aufgrund der Weise, wie der stimmt, und wird Wütend, wenn jemand versucht, seine Führungsposition wegnehmen." +
	"Als ein mächtiger und ehrehafter Krieger verteidigt und konsolidiert Drakoth gern sein Kreis von Verbundeten, indem " +
	"er Vertrauend von denjenigen wird, die seinen Verbündeten vertrauen, und Feindlich gegenüber denjenigen wird, die ihn angreifen. " +
	"Er mag es auch nicht, wenn jemand mit ihren Ärgerlichen Gegnern kooperiert. Abgesehen davon reagiert Drakoth angemessen " +
	"auf Aggression, indem er Gegner angreift, die ihn angreifen, und Frieden mit denen schließt, die das auch machen." +
	"Da er nur seine Verbündete vertraut, ist Manipulation gegen ihn nicht so hilfreich.")}
	],
	['text', {'title':'STRATEGIE', 'color':Color.brown,
	'text':"""Am Anfang jeder Runde verändert ihre Vorschlagpriorität auf Grund ihrer Relation mit dem SPIELERCHARAKTER."""}
	],
	['text', {'title':'THRONFOLGER', 'color':Color.darkviolet,
	'text':("Wird WÜTEND mit Spielern, die durch seinen Einfluss reduziert oder den Einfluss jemand anderes erhöht, " +
	"macht er seine Position in der Thron-Reihenfolge verloren.")}
	],
	['text', {'title':'EHRGEIZIG', 'color':Color.orangered,
	'text':"""Verschlechtert seine Relation mit Spielern, die seinen Einfluss reduziert. Das Gegenteil passiert mit nicht-ÄRGERLICHEN Spielern, die ihn stattdessen erhöht."""}
	],
	['text', {'title':'REAKTIV', 'space':250, 'color':Color.aqua,
	'text':"""Wird FEINDLICH (sofern er nicht schon WÜTEND ist) gegen Spieler, die entweder beabsichtigen, ihn zu angreifen, oder gegen ihn FEINDLICH/WÜTEND sind. Wird MISSTRAUISCH gegenüber FEINDSELIGEN/ÄRGERLICHEN Spielern, die beabsichtigen, mit ihm zu kooperieren."""}
	],
	['text', {'title':'GERECHTIGKEIT', 'space':140, 'color':Color.darkslategray,
	'text':"""Wird WÜTEND gegen Spieler, die ihm MASSAKRIEREN (Agressiv vs Passiv)."""}
	],
	['text', {'title':'VERSTAENDNIS', 'space':340, 'color':Color.lightseagreen,
	'text':"""Kann die Relationen des SPIELERCHARAKTERS mit anderen Spielern herleiten, aufgrund wie er über bestimmte Vorschlagen mit den genannten Spielern als Ziel abstimmt:
	-Ja für Angriff: WÜTEND
	-Nein für Friede: FEINDLICH
	-Null: MISSTRAUISCH
	-Ja für Friede: VERTRAUEND
	-Nein für Angriff: FREUNDLICH"""}
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
	['text', {'title':'BLOD', 'color':Color.palegreen ,
	'text':"""Glaubt immer das Gegenteil von den erhaltenen Nachrichten. Seine Relation mit einem Spieler verschlechtert sich jedes Mal, wenn dieses Spieler ihm eine Nachricht sendet."""}
	],
	['text', {'title':'DIPLOMATISCH', 'color':Color.darkmagenta,
	'text':"""Seine Relation mit anderen Räten und dem Führer verbessert/verschlechtert sich, wenn sie mit seinen Abstimmungspolitik zustimmen/nicht zustimmen."""}
	],
	['text', {'title':'AKTIONPRIORITAET',
	'text':"""1- Attackiert einen ÄRGERLICHEN Spieler.
	2- Erzählt einem VERTRAUTEN/BEFREUDETEN Spieler, der BRUDENSCHAFT hat, dass ein ÄRGERLICHEN Spieler sie attackieren wird.
	3- Attackiert einen FEINDSELIGEN Spieler.
	4- Wenn es jemand gibt, der mehr oder gleichem Einfluss als ihn hat, erhöht seinen Einfluss.
	5- Erzählt einem VERTRAUTEN/BEFREUDETEN Spieler, der BRUDENSCHAFT hat, dass ein FEINDSELIGEN Spieler sie attackieren wird.
	6- Forscht einen VERDÄCHTIGEN Spieler nach.
	7- Erhöht den Einfluss des einen BEFREUNDETEN Spielers, der nicht der zweite der Thron-Reihenfolge (es sei denn es schon einen BEFREUNDETEN Spieler in jeder Position gibt).
	8a- Wenn es eine gerade Runde ist, forscht einen FEINDSELIGEN/ÄRGERLICHEN Spieler nach.
	8b- Wenn es eine ungerade Runde ist, forscht einen VERTRAUTEN/BEFREUDETEN Spieler nach."""}
	],
	['text', {'title':'ABSTIMMUNGSPOLITIK',
	'text':"""1- Nein."""}
	],
	['text', {'title':'VORSCHLAGPRIORITAET (SUSPICIOUS/TRUSTFUL/FRIENDLY)',
	'text':"""1- Wenn die Summe aller Stimmen der VERTRAUTEN/BEFREUDETEN Spieler über 2 liegt, Friede mit ihm selbst.
	2- Wenn keinen VERTRAUTEN/BEFREUDETEN Spieler mit LOYALITAETEN WÜTEND mit einem VERDÄCHTIGEN Spieler sind, Friede mit diesen VERDÄCHTIGEN Spieler.
	3- Wenn keinen VERTRAUTEN/BEFREUDETEN Spieler mit einem FEINDSELIGEN/ÄRGERLICHEN Spieler sind, Angriff gegen einen FEINDSELIGEN/ÄRGERLICHEN Spieler.
	4- Friede mit ihm selbst."""}
	],
	['text', {'title':'VORSCHLAGPRIORITAET (HOSTILE/ENRAGED)',
	'text':"""1- Angriff gegen einen ÄRGERLICHEN Spieler.
	2- Angriff gegen einen FEINDSELIGEN Spieler."""}
	]],
	]
	
	return de_pages
