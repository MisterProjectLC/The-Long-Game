extends Node

func pages_setup(images):
	var br_pages = [[ # Manual
	['text', {'title':'THE LONG GAME', 'space':300,
	'text':"""THE LONG GAME é um jogo de diplomacia medieval contra 3 NPCs com personalidades vastamente diferentes. Durante 6 rodadas, enfrente seus oponentes no Dilema do Prisioneiro, investigue seus históricos de partidas contra outros jogadores e influencie-os compartilhando informações ou contando mentiras."""}
	],
	['text', {'title':'ACOES', 'space':470, 
	'text':"""Todo jogador tem 3 AÇÕES por round. Elas podem ser gastas com:
	-ATAQUE: tomar a postura Agressiva contra outro jogador.
	-INVESTIGAÇÃO: receber mais informação sobre outro jogador.
	-INFLUÊNCIA: mudar sua posição na Ordem do Trono.
	-DIPLOMACIA: enviar mensagens para outros jogadores.
	-FALSIFICAÇÃO: modifica mensagens recebidas de outros jogadores."""}
	], 
	['text', {'title':'BATALHA - O DILEMA DO PRISIONEIRO', 'space':470, 
	'text':"""O DILEMA DO PRISIONEIRO é um experimento mental relacionado à teoria dos jogos.
	Nele, cada jogador escolhe entre uma Postura Passiva e uma Postura Agressiva.
	Ser PASSIVO é coletivamente melhor para os dois jogadores, mas expõe o indivíduo à traição. Além disso, esta opção é melhor diplomaticamente.
	Ser AGRESSIVO, por outro lado, é melhor para o indivíduo, mas custa uma AÇÃO e cria resentimento entre jogadores."""}
	],
	['image', {'image':images[0], 'space':350}
	],
	['text', {'title':'INVESTIGACAO', 'space':440, 
	'text':"""Investigar um jogador pode ser muito útil para obter dicas de como ele vai agir durante o Dilema do Prisioneiro. Isso revela três informações:
	1- Sua quantidade de PONTOS.
	2- Suas últimas PARTIDAS contra todos os outros jogadores.
	3- Sua RELAÇÃO (opinião) com todos os outros jogadores.
	Investigar gasta 1 AÇÃO."""}
	],
	['image', {'image':images[1], 'space':350}
	],
	['text', {'title':'INFLUENCIA',
	'text':"""Influência mede o poder e notoriedade de um jogador no reino. Jogadores com maior Influência agem antes no round e têm uma maior chance de receberem mensagens ou serem atacados.
	Um jogador pode mudar sua posição (e a de outros) na ordem de Influência usando a tela de Influência. Tenha em mente que a ordem apenas se atualiza no fim de cada round."""}
	],
	['text', {'title':'DIPLOMACIA',
	'text':"""Por fim, existe a DIPLOMACIA. Usando a ÁREA DE DIPLOMACIA mostrada acima, o jogador pode enviar mensagens para outros jogadores. Da mesma forma, outros jogadores podem enviar mensagens para o jogador de tempos em tempos.
	Enviar uma mensagem gasta 1 AÇÃO, e é, em essência, o centro do jogo. É este o sistema que dá a possibilidade do jogador realmente manipular seus oponentes de forma impactante.
	Existem duas formas de fazer isso:
	-ESCRITA: para escrever uma carta, escolha as três opções (Sujeito, Ação, Objeto) na Área de Diplomacia as quais você quer escrever. Quando tudo estiver pronto, clique em Enviar.
	-RE-ENVIO: você também pode re-enviar uma carta escrita por outro jogador usando o ícone de Envelope, fazendo com que o remetente pense que o autor original enviou a carta para ele. Isso pode ter tremendas consequências, causando caos e ódio entre aliados.
	AAdicionalmente, jogadores podem forjar cartas falsas usando mensagens de outros jogadores, alterando seu conteúdo para se ajustar aos planos do forjador. Cada alteração custa 1 AÇÃO.
	Para poder controlar NPCs com eficácia, o jogador tem completo acesso ao comportamento e sistema de IA de cada jogador."""}
	],
	['text', {'title':'FALSIFICACAO',
	'text':"""Falsificação abre ainda mais possibilidades para enganação. Com ela, jogadores podem 
	forjar cartas falsas usando mensagens de outros jogadores, alterando seu conteúdo para depois re-enviá-las. Cada alteração custa 1 AÇÃO."""}
	],
	['text', {'title':'CONSELHO',
	'text':"""No início de cada round, o líder da Ordem do Trono propõe um Decreto para o Conselho. Um Decreto se
	consiste de uma Postura e um Alvo e, caso aprovado, força todos os jogadores a tomar a Postura escolhida contra o Alvo
	escolhido, no próximo round.
	Após a proposta ter sido feita, cada jogador vota no Decreto, com o segundo jogador da Ordem tendo seu voto valer duas
	vezes. Se houver mais 'Sim' do que 'Não', o Decreto é aprovado."""}
	],
	['text', {'title':'CARACTERISTICAS E PERSONAGENS', 'space':350,
	'text':"""Este jogo também vem com um documento detalhando o perfil de cada jogador. Eles estão divididos em três partes:
	-RELAÇÕES INICIAIS: suas relações iniciais com outros jogadores.
	-CARACTERÍSTICAS: traços de personalidade que governam, entre outras coisas, como eles reagem a eventos e informação.
	-PRIORIDADE DE AÇÃO: uma lista de ações que o jogador pode tomar. Eles vão sempre tomar a primeira ação da lista a não ser que isso seja impossível e/ou redundante. Nesse caso, eles movem para a próxima ação da lista e repetem o processo.
	Isso é tudo que você precisa saber para jogar THE LONG GAME. Boa sorte!"""}
	]],
	# Personagens
	[
	['text', {'title':'PERSONAGENS - ANTES DE LER', 'space':220,
	'text':"""Não se intimide com o tamanho deste documento. Dê uma passada primeiro, experimente por algumas partidas e volte depois quando estiver mais familiarizado com o jogo."""}
	],
	['text', {'title':'TERMOS COMUNS', 'space':440, 
	'text':"""INFORMAÇÃO/MENSAGENS
	Feita de três partes, em ordem: Agente/Postura/Alvo

	RELAÇÕES
	Níveis de relação:
	Revoltado/Hostil/Suspeito/Confiante/Amigável
	Revoltante/Hostilizado/Suspeitado/Confiável/Amigo

	POSTURAS
	Cooperação: Passiva vs Passiva
	Massacre: Agressiva vs Passiva
	Ser massacrado: Passiva vs Agressiva
	Batalha/Luta: Agressiva vs Agressiva"""}
	]],
	# Salem
	[['text', {'title':'SALEM', 'space':140,
	'text':"""É você. 
	Raça: Humano"""}
	],
	['text', {'title':'CARACTERISTICAS', 'space':120, 
	'text':"""-PERSONAGEM DO JOGADOR.
	-CARISMA: no início do jogo, um jogador aleatório é escolhido para ter sua relação com Salem melhorada em 1."""}
	]],
	# Grolk
	[['text', {'title':'GROLK', 'space':180,
	'text':"""Odeia fracos e traidores. Age de forma agressiva e impulsiva.
	Raça: Orc"""}
	],
	['text', {'title':'RELACOES INICIAIS', 'space':260, 
	'text':"""-HOSTIL para Salem.
	-SUSPEITO de Kallysta.
	-SUSPEITO de Horlin.
	-SUSPEITO de Obrulena.
	-HOSTIL para Thoren.
	-SUSPEITO de Edraele.
	-HOSTIL para Drakoth."""}
	],
	['text', {'title':'CARACTERISTICAS - TL;DR', 'space':420, 
	'text':"""Grolk não se irrita com batalhas, mas odeia jogadores que o traem ou são massacradas por ele.
	Ele também odeia jogadores que atacam seus amigos, e se alia a jogadores que se aliam a seus amigos. Ele sempre acredita em seus amigos e ignora seus inimigos.
	Ele também aprecia receber info verdadeira, não gosta de receber mentiras, e nunca perdoa um inimigo revoltante."""}
	],
	['text', {'title':'GUERREIRO', 'color':Color.red,
	'text':"""Ao LUTAR (Agressiva vs Agressiva) contra ele, não degrada sua relação. Torna-se HOSTIL a jogadores que são MASSACRADOS (Passiva vs Agressiva) por ele."""}
	],
	['text', {'title':'ODIO', 'color':Color.darkslategray,
	'text':"""Fica REVOLTADO com jogadores CONFIÁVEIS/AMIGOS que MASSACRAM (Agressiva vs Passiva) ele. Também fica HOSTIL com jogadores Suspeitados que MASSACRAM ele."""}
	],
	['text', {'title':'IRMANDADE', 'color':Color.darkblue,
	'text':"""Torna-se HOSTIL (exceto quando já REVOLTADO ou AMIGÁVEL) a um jogador ou quando descobre que esse jogador vai atacar um jogador CONFIÁVEL/AMIGO dele, ou quando descobre que esse jogador é REVOLTADO/HOSTIL contra um jogador CONFIÁVEL/AMIGO dele."""}
	],
	['text', {'title':'ALIANCA', 'color':Color.blue,
	'text':"""Torna-se CONFIANTE (exceto quando já REVOLTADO ou AMIGÁVEL) de um jogador ou quando descobre que esse jogador vai se aliar a um jogador CONFIÁVEL/AMIGO dele, ou quando descobre que um jogador CONFIÁVEL/AMIGO dele considera esse jogador CONFIÁVEL/AMIGO."""}
	],
	['text', {'title':'GENERAL', 'color':Color.cyan,
	'text':"""Sua relação melhora ao contar informação que ele descobre que é verdadeira. O oposto ocorre com informação que ele descobre que é falsa."""}
	],
	['text', {'title':'SIMPLES', 'color':Color.darkgreen,
	'text':"""Sempre acredita em jogadores CONFIÁVEIS/AMIGOS. Nunca acredita em outros, mas ainda lembra do que eles disseram (para ativar General)."""}
	],
	['text', {'title':'IGNORANTE', 'color':Color.darkmagenta,
	'text':"""Sua relação com o Líder melhora/piora quando ele concorda/discorda de sua Política de Votação. Ignora os outros votantes, porém."""}
	],
	['text', {'title':'AMARGO', 'color':Color.brown,
	'text':"""Se estiver REVOLTADO com alguém, nada vai fazer com que ele mude sua relação com essa pessoa. Anula todas as outras Características."""}
	],
	['text', {'title':'PRIORIDADE DE ACAO', 'space':400, 
	'text':"""1- Ataca um jogador REVOLTANTE.
	2- Ataca um jogador HOSTILIZADO.
	3- Conta para um jogador CONFIÁVEL/AMIGO sobre sua relação com outros.
	4- Conta para um jogador AMIGO sobre informações que ele tem.
	5- Ataca um jogador SUSPEITADO.
	6- Se não for o primeiro na Ordem de Influência, aumenta sua Influência."""}
	],
	['text', {'title':'POLITICA DE VOTACAO',
	'text':"""1- Sim se for um ataque contra um jogador HOSTILIZADO/REVOLTANTE.
	2a- Não se for um ataque contra jogadores AMIGOS ou ele mesmo.
	2b- Não se for paz com um jogador REVOLTANTE.
	3- Sim se o Líder for AMIGO.
	4a- Não se for um ataque contra um jogador CONFIÁVEL.
	4b- Não se for paz com um jogador HOSTILIZADO.
	5- Sim se o Líder for CONFIÁVEL.
	6- Não."""}
	]],
	# Zardri
	[['text', {'title':'ZARDRI',
	'text':"""Nascido na escura floresta de Ecnar, Zardri move-se discretamente procurando por emboscadas rápidas em inimigos enfraquecidos.
	Raça: Goblin"""}
	],
	['text', {'title':'RELACOES INICIAIS',
	'text':"""-SUSPEITO de Salem.
	-SUSPEITO de Kallysta.
	-SUSPEITO de Horlin.
	-SUSPEITO de Obrulena.
	-HOSTIL para Thoren.
	-SUSPEITO de Edraele.
	-SUSPEITO de Drakoth."""}
	],
	['text', {'title':'CARACTERISTICAS - TL;DR',
	'text':("A estratégia principal de Zardri é traição. Quando alguém está sendo atacado por múltiplos jogadores, Zardri toma " +
	"essa oportunidade para apunhalá-lo em seu estado mais vulnerável. Ele, porém, também evita ser traído, e dessa forma " +
	"sempre descredita informações de outros e torna-se revoltado no primeiro sinal de perigo.")}
	],
	['text', {'title':'EMBOSCADOR', 'color':Color.mediumvioletred,
	'text':"""Torna-se HOSTIL contra jogadores SUSPEITADOS que já estão HOSTIS/REVOLTADOS contra dois ou mais outros jogadores."""}
	],
	['text', {'title':'ODIO', 'space':220, 'color':Color.darkslategray,
	'text':"""Fica REVOLTADO com jogadores CONFIÁVEIS/AMIGOS que MASSACRAM (Agressiva vs Passiva) ele. Também fica HOSTIL com jogadores Suspeitados que MASSACRAM ele."""}
	],
	['text', {'title':'PARANOIA', 'space':170, 'color':Color.darkgray,
	'text':"""Torna-se REVOLTADO a um jogador quando ele descobre que este está planejando atacá-lo ou é 
	REVOLTADO/HOSTIL contra ele."""}
	],
	['text', {'title':'PERFIDO', 'space':140, 'color':Color.darkred,
	'text':"""Torna-se HOSTIL a jogadores que são MASSACRADOS (Passiva vs Agressiva) por ele."""}
	],
	['text', {'title':'INTUICAO', 'space':350, 'color':Color.gold,
	'text':"""ao investigar o PERSONAGEM DO JOGADOR, julga sua relação com outros jogadores baseado em sua última partida.
	Se houve Massacre em qualquer lado: REVOLTADO
	Se houve uma Batalha: HOSTIL
	Se houve Cooperação: CONFIANTE 
	Se não houve partida (Round 1): SUSPEITO """}
	],
	['text', {'title':'ESTUPIDO', 'color':Color.palegreen ,
	'text':"""Sempre acredita no oposto de mensagens recebidas. Sua relação com um jogador se degrade em 1 toda vez que esse jogador enviar uma mensagem para ele."""}
	],
	['text', {'title':'IGNORANTE', 'color':Color.darkmagenta,
	'text':"""Sua relação com o Líder melhora/piora quando ele concorda/discorda de sua Política de Votação. Ignora os outros votantes, porém."""}
	],
	['text', {'title':'PRIORIDADE DE ACAO',
	'text':"""1- Ataca um jogador REVOLTANTE.
	2- Ataca um jogador HOSTILIZADO.
	3- Reduz a Influência de um jogador HOSTILIZADO/REVOLTANTE.
	4- Investiga um jogador SUSPEITADO."""}
	],
	['text', {'title':'POLITICA DE VOTACAO',
	'text':"""1- Não se for um ataque contra ele mesmo.
	2a- Sim se for um ataque contra qualquer outro jogador.
	2b- Sim se for paz com ele mesmo."""}
	]],
	# Kallysta
	[['text', {'title':'KALLYSTA', 'space':210,
	'text':"""Uma líder individualista e perspicaz. Kallysta se desconfia de quase todos e é excelente em quebrar alianças fortes.
	Raça: Tiefling"""}
	],
	['text', {'title':'RELACOES INICIAIS', 'space':260, 
	'text':"""-SUSPEITA de Salem.
	-SUSPEITA de Grolk.
	-SUSPEITA de Horlin.
	-SUSPEITA de Obrulena.
	-SUSPEITA de Thoren.
	-SUSPEITA de Edraele.
	-SUSPEITA de Drakoth."""}
	],
	['text', {'title':'CARACTERISTICAS - TL;DR', 'space':550, 
	'text':"""A natureza individualista de Kallysta faz ela impossível de tornar-se Amigável com alguém. Ela é excelente em encontrar e interpretar informação, e usa essa habilidade para prever o comportamento de outros jogadores.
	Com a habilidade exclusiva Quebra-Correntes, Kallysta torna-se Hostil contra jogadores com muitos aliados. Usando diplomacia e investigação, a líder tiefling consegue facilmente desmontar amizades em um ou dois rounds.
	Ela também reage de forma apropriada a mensagens recebidas, defendendo-se de inimigos."""}
	],
	['text', {'title':'ATENTIVA', 'color':Color.navyblue,
	'text':"""Reduz sua relação com jogadores que aumentam a Influência de jogadores REVOLTANTES. O oposto ocorre com jogadores não-REVOLTANTES que reduzem-a."""}
	],
	['text', {'title':'PARANOIA', 'space':170, 'color':Color.darkgray,
	'text':"""Torna-se REVOLTADA a um jogador quando ele descobre que este está planejando atacá-lo ou é REVOLTADO/HOSTIL contra ela."""}
	],
	['text', {'title':'JUSTICA', 'space':140, 'color':Color.darkslategray,
	'text':"""Fica REVOLTADA com jogadores que MASSACRAM (Agressiva vs Passiva) ela."""}
	],
	['text', {'title':'DEDUCAO', 'space':330, 'color':Color.yellow,
	'text':"""Pode deduzir a relação do PERSONAGEM DO JOGADOR com outros jogadores baseado na relação de outros jogadores com ele. Por exemplo, se ela descobre que alguém está REVOLTADO com o PERSONAGEM DO JOGADOR, ela irá deduzir que o PERSONAGEM DO JOGADOR está REVOLTADO com ele."""}
	],
	['text', {'title':'QUEBRA-CORRENTES', 'space':170, 'color':Color.darkred,
	'text':"""Torna-se HOSTIL a jogadores que são considerados CONFIAVEIS/AMIGOS por dois ou mais outros jogadores (não contando ela mesma)."""}
	],
	['text', {'title':'CINICA', 'space':90, 'color':Color.blueviolet,
	'text':"""Nunca torna-se AMIGÁVEL."""}
	],
	['text', {'title':'INTRIGA', 'space':590, 'color':Color.darkcyan,
	'text':"""Ao receber mensagens, compara-as com seus outros dados. Se houver uma contradição ou conclusão ilógica, acredita em seus dados. Se houver uma contradição ou conclusão ilógica entre mensagens, dá prioridade para a mensagem vinda do remetente mais confiado.
	Se não houver contradição e a mensagem vier de um jogador SUSPEITADO, investiga a validade desta informação, se possível. Senão, ignora-a.
	Em qualquer caso, fica REVOLTADA se descobrir que a mensagem é falsa. Alternativamente, se a mensagem for verdadeira e não envolver o remetente, sua relação com ele melhora."""}
	],
	['text', {'title':'DIPLOMATICA', 'color':Color.darkmagenta,
	'text':"""Sua relação com outros votantes e o Líder melhora/piora quando eles concordam/discordam de sua Política de Votação."""}
	],
	['text', {'title':'PRIORIDADE DE ACAO', 'space':400, 
	'text':"""1- Ataca um jogador REVOLTANTE.
	2- Se for um round ímpar, investiga um jogador SUSPEITADO.
	3- Re-envia uma carta que ela acredita seja falsa e escrita por um jogador HOSTILIZADO para outro que está SUSPEITO desse jogador.
	4- Primeiro, escolhe um jogador X HOSTILIZADO. Então, escolhe dois jogadores, Y e Z, que acham X CONFIÁVEL.
	  4a- Se Y tiver Lealdades e estiver REVOLTADO com  Z, conta para Y que X vai cooperar com Z.
	  4b Se Y tiver Irmandade e estiver CONFIANTE/AMIGÁVEL com ela e Z, conta para Y que X vai atacar Z.
	5- Ataca um jogador HOSTILIZADO.
	6- Se o Líder é um jogador HOSTILIZADO/REVOLTANTE, reduz sua Influência.
	7- Conta para um jogador SUSPEITADO que ela irá se aliar com ele.
	8- Investiga um jogador HOSTILIZADO.
	9- Investiga um jogador CONFIÁVEL."""}
	],
	['text', {'title':'POLITICA DE VOTACAO',
	'text':"""1- Não se for um ataque contra ele mesmo.
	2a- Sim se for um ataque contra um jogador HOSTILIZADO/REVOLTANTE.
	2b- Sim se for paz com ela mesma.
	3- Não se o Líder for HOSTILIZADO/REVOLTANTE."""}
	]],
	
	# Horlin
	[['text', {'title':'HORLIN', 'space':180,
	'text':"""Apesar de suas habilidades militares serem terríveis, o astuto Alto Prefeito de Brilha-Ouro provou ter grande talento para tanto escrita quanto falsificação.
	Raça: Gnomo"""}
	],
	['text', {'title':'RELACOES INICIAIS', 'space':260, 
	'text':"""-SUSPEITO de Salem.
	-SUSPEITO de Grolk.
	-CONFIANTE of Zardri.
	-SUSPEITO de Kallysta.
	-AMIGÁVEL com Obrulena.
	-CONFIANTE de Thoren.
	-CONFIANTE de Edraele.
	-CONFIANTE de Drakoth."""}
	],
	['text', {'title':'CARACTERISTICAS - TL;DR', 'space':480, 
	'text':("Horlin é um péssimo general, mas um grande escritor. Por isso, ele interpreta mensagens recebidas não como informação, " +
	"mas como pedidos. Quando alguém envia um pedido, ele tenta falsificar uma de suas cartas e enviá-la para o pedinte, o qual ele pode " +
	"usar como quiser. Tirando isso, Horlin tem características comuns, reagindo a outros tipos de informação de forma apropriada.")}
	],
	['text', {'title':'ATENTIVO', 'color':Color.navyblue,
	'text':"""Reduz sua relação com jogadores que aumentam a Influência de jogadores REVOLTANTES. O oposto ocorre com jogadores não-REVOLTANTES que reduzem-a."""}
	],
	['text', {'title':'REATIVO', 'space':290, 'color':Color.aqua,
	'text':"""Torna-se HOSTIL (exceto quando já REVOLTADO) a um jogador quando ele descobre que este está planejando atacá-lo ou é REVOLTADO/HOSTIL contra ele. Torna-se SUSPEITO de um jogador REVOLTANTE/HOSTILIZADO quando ele descobre que este está planejando se aliar com ele."""}
	],
	['text', {'title':'JUSTICA', 'space':140, 'color':Color.darkslategray,
	'text':"""Fica REVOLTADO com jogadores que MASSACRAM (Agressiva vs Passiva) ele."""}
	],
	['text', {'title':'DEDUCAO', 'space':330, 'color':Color.yellow,
	'text':("Pode deduzir a relação do PERSONAGEM DO JOGADOR com outros jogadores baseado na relação de outros jogadores com ele. " +
	"Por exemplo, se ele descobre que alguém está REVOLTADO com o PERSONAGEM DO JOGADOR, ela irá deduzir que o PERSONAGEM DO JOGADOR está " +
	"REVOLTADO com ele.")}
	],
	['text', {'title':'ESCRITOR', 'color':Color.lightsteelblue,
	'text':('Mensagens cujo sujeito não é o autor são interpretadas como pedidos, não informação. Por exemplo, se alguém enviar ' +
	'"X vai atacar Y" para ele, ele falsificará uma carta escrita por X que diz "X vai atacar Y" e enviar para o pedinte.')}
	],
	['text', {'title':'ARQUIVISTA', 'space':400, 'color':Color.khaki,
	'text':('Ordena pedidos baseado no nível de relação com o pedinte e, se empatado, por ordem de recebimento. Ignora pedidos que ' +
	'envolvem ele mesmo. Nega pedidos de jogadores REVOLTANTES e HOSTILIZADOS. Depois de resolver o pedido, sua relação com o pedinte melhora.')}
	],
	['text', {'title':'DIPLOMATICO', 'color':Color.darkmagenta,
	'text':"""Sua relação com outros votantes e o Líder melhora/piora quando eles concordam/discordam de sua Política de Votação."""}
	],
	['text', {'title':'PRIORIDADE DE ACAO', 'space':400, 
	'text':"""1- Com o pedido atual, modifica uma carta de X até que ela espelhe o pedido.
	2- Com o pedido atual, envia a carta modificada para o pedinte. Avança para o próximo pedido.
	3- Investiga um jogador SUSPEITADO/HOSTILIZADO.
	4- Se um jogador REVOLTANTE tiver igual or maior Influência que ele, a reduz.
	5- Ataca um jogador REVOLTANTE.
	6- Investiga um jogador CONFIÁVEL.
	7- Se não for o segundo na Ordem de Influência, aumenta sua Influência.
	8- Ataca um jogador HOSTILIZADO."""}
	],
	['text', {'title':'POLITICA DE VOTACAO',
	'text':"""1- Não se for um ataque contra ele mesmo.
	2- Sim se o Líder for AMIGO.
	3- Sim se for paz com ele mesmo.
	4- Não se o Líder for HOSTILIZADO/REVOLTANTE."""}
	]],
	
	# Obrulena
	[['text', {'title':'OBRULENA', 'space':180,
	'text':"""A monja nomádica das planícies Gigraltar aspira trazer paz e harmonia para toda a região, sempre tentando mediar conflitos entre aliados oponentes. 
	Raça: Loxodon"""}
	],
	['text', {'title':'RELACOES INICIAIS', 'space':240, 
	'text':"""-SUSPEITA de Salem.
	-HOSTIL para Grolk.
	-CONFIANTE de Kallysta.
	-CONFIANTE de Horlin.
	-CONFIANTE de Thoren.
	-SUSPEITA de Edraele.
	-CONFIANTE de Drakoth."""}
	],
	['text', {'title':'CARACTERISTICAS - TL;DR', 'space':480, 
	'text':"""Obrulena, como uma ativista da paz, rapidamente faz amizade com jogadores com quem ela corresponde ou são amigos de algum amigo dela.
	Porém, na via contrária, qualquer descobrimento de Massacres causa grande ressentimento de sua parte. Ela sempre acredita em seus aliados e nunca acredita em jogadores os quais ainda não confia. Devido a suas tradições,
	ela também tem maior respeito para o jogador com mais Influência."""}
	],
	['text', {'title':'AMBICIOSA', 'color':Color.orangered,
	'text':"""Reduz sua relação com jogadores que reduzem sua Influência. O oposto ocorre com jogadores não-REVOLTANTES que aumentam-a."""}
	],
	['text', {'title':'SERENA', 'color':Color.aqua,
	'text':"""Sua Relação com um jogador melhora toda vez que ela mandar uma carta para ele. """}
	],
	['text', {'title':'PACIFISTA', 'color':Color.aqua,
	'text':"""sua Relação com um jogador piora em 2 para cada Massacre (AGRESSIVA vs PASSIVA) ela descobrir que ele cometeu."""}
	],
	['text', {'title':'REATIVA', 'space':300, 'color':Color.aqua,
	'text':"""Torna-se HOSTIL (exceto quando já REVOLTADA) a um jogador quando ela descobre que este está planejando atacá-lo ou é REVOLTADO/HOSTIL contra ela. Torna-se SUSPEITA de um jogador REVOLTANTE/HOSTILIZADO quando ela descobre que este está planejando se aliar com ela."""}
	],
	['text', {'title':'INTUICAO', 'space':350, 'color':Color.gold,
	'text':"""ao investigar o PERSONAGEM DO JOGADOR, julga sua relação com outros jogadores baseado em sua última partida.
	Se houve Massacre em qualquer lado: REVOLTADO
	Se houve uma Batalha: HOSTIL
	Se houve Cooperação: CONFIANTE 
	Se não houve partida (Round 1): SUSPEITO """}
	],
	['text', {'title':'ALIANCA', 'space':300, 'color':Color.blue,
	'text':"""Torna-se CONFIANTE (exceto quando já REVOLTADA or AMIGÁVEL) de um jogador ou quando descobre que esse jogador vai se aliar a um jogador CONFIÁVEL/AMIGO dela, ou quando descobre que um jogador CONFIÁVEL/AMIGO dela considera esse jogador CONFIÁVEL/AMIGO."""}
	],
	['text', {'title':'SIMPLES', 'space':220, 'color':Color.darkgreen,
	'text':"""Sempre acredita em jogadores CONFIÁVEIS/AMIGOS. Nunca acredita em outros, mas ainda lembra do que eles disseram."""}
	],
	['text', {'title':'DIPLOMATICA', 'color':Color.darkmagenta,
	'text':"""Sua relação com outros votantes e o Líder melhora/piora quando eles concordam/discordam de sua Política de Votação."""}
	],
	['text', {'title':'PRIORIDADE DE ACAO', 'space':400, 
	'text':"""1- Uma vez por round. Escolhe dois jogadores CONFIÁVEIS/AMIGOS que não ambos são CONFIANTES/AMIGÁVEIS com um ao outro:
	  1a- Se um tiver Aliança mas não Lealdades, conta para esse jogador que o outro irá se aliar com Obrulena.
	  1b- Senão, conta para ele que o outro irá se aliar com ele.
	2- Apenas se ela enviou uma carta em (1):
	  2a- Se o Sujeito da carta tiver Aliança mas não Lealdades, conta para esse jogador que o remetente da carta irá se aliar com Obrulena.
	  2b- Senão, conta para ele que o outro irá se aliar com ele.
	3- Conta para um jogador SUSPEITADO/CONFIÁVEL sem Intriga que ela irá se aliar com ele.
	4- Investiga o Agente de uma mensagem na qual ela acredita e envolve um ataque.
	5- Ataca um jogador REVOLTANTE.
	6- Ataca um jogador HOSTILIZADO.
	7- Conta para um jogador HOSTILIZADO que ela irá atacá-lo.
	8- Se não for a primeira ou segunda na Ordem no Trono, aumenta sua Influência, a não ser que o Líder tenha HERDEIRO e seja CONFIÁVEL/AMIGO.
	9- Investiga um jogador SUSPEITADO."""}
	],
	['text', {'title':'POLITICA DE VOTACAO',
	'text':"""1- Sim se o Líder for AMIGO e for um ataque contra um jogador HOSTILIZADO/REVOLTANTE.
	2- Não se for paz e tanto Líder quanto alvo forem HOSTILIZADOS/REVOLTANTES.
	3- Não se for um ataque.
	4- Sim se for paz.
	"""}
	],
	['text', {'title':'PRIORIDADE DE PROPOSTAS',
	'text':"""1- Paz para outro jogador CONFIÁVEL/AMIGO.
	2- Paz para ela mesma."""}
	]],
	
	# Thoren
	[['text', {'title':'THOREN', 'space':180,
	'text':"""Um grande aliado e um temível oponente. Thoren acredita em lealdade sobre tudo.
	Raça: Anão"""}
	],
	['text', {'title':'RELACOES INICIAIS', 'space':240, 
	'text':"""-HOSTIL para Salem.
	-REVOLTADO com Grolk.
	-SUSPEITO de Kallysta.
	-CONFIANTE de Horlin.
	-SUSPEITO de Obrulena.
	-CONFIANTE de Edraele.
	-CONFIANTE de Drakoth."""}
	],
	['text', {'title':'CARACTERISTICAS - TL;DR', 'space':500, 
	'text':"""Thoren acredita em seus amigos e, no geral, não acredita em seus inimigos. Ele tenta investigar info suspeita, mas ignora-a se não puder.
	Ele também odeia jogadores que atacam seus amigos, e se alia a jogadores que se aliam a seus amigos. Porém, se alguém se aliar a um de seus inimigos revoltantes, ele fica hostil contra esta pessoa.
	Thoren reage de forma apropriada a info que ele acredita, atacando inimigos que atacam ele e fazendo paz com aqueles que também o fazem. Ele odeia ser traído."""}
	],
	['text', {'title':'ATENTIVO', 'color':Color.navyblue,
	'text':"""Reduz sua relação com jogadores que aumentam a Influência de jogadores REVOLTANTES. O oposto ocorre com jogadores não-REVOLTANTES que reduzem-a."""}
	],
	['text', {'title':'AMBICIOSO', 'color':Color.orangered,
	'text':"""Reduz sua relação com jogadores que reduzem sua Influência. O oposto ocorre com jogadores não-REVOLTANTES que aumentam-a."""}
	],
	['text', {'title':'REATIVO', 'space':290, 'color':Color.aqua,
	'text':"""Torna-se HOSTIL (exceto quando já REVOLTADO) a um jogador quando ele descobre que este está planejando atacá-lo ou é REVOLTADO/HOSTIL contra ele. Torna-se SUSPEITO de um jogador REVOLTANTE/HOSTILIZADO quando ele descobre que este está planejando se aliar com ele."""}
	],
	['text', {'title':'JUSTICA', 'space':140, 'color':Color.darkslategray,
	'text':"""Fica REVOLTADO com jogadores que MASSACRAM (Agressiva vs Passiva) ele."""}
	],
	['text', {'title':'INTUICAO', 'space':350, 'color':Color.gold,
	'text':"""ao investigar o PERSONAGEM DO JOGADOR, julga sua relação com outros jogadores baseado em sua última partida.
	Se houve Massacre em qualquer lado: REVOLTADO
	Se houve uma Batalha: HOSTIL
	Se houve Cooperação: CONFIANTE 
	Se não houve partida (Round 1): SUSPEITO """}
	],
	['text', {'title':'IRMANDADE', 'space':300, 'color':Color.darkblue,
	'text':"""Torna-se HOSTIL (exceto quando já REVOLTADO ou AMIGÁVEL) a um jogador ou quando descobre que esse jogador vai atacar um jogador CONFIÁVEL/AMIGO dele, ou quando descobre que esse jogador é REVOLTADO/HOSTIL contra um jogador CONFIÁVEL/AMIGO dele."""}
	],
	['text', {'title':'ALIANCA', 'space':300, 'color':Color.blue,
	'text':"""Torna-se CONFIANTE (exceto quando já REVOLTADO or AMIGÁVEL) de um jogador ou quando descobre que esse jogador vai se aliar a um jogador CONFIÁVEL/AMIGO dele, ou quando descobre que um jogador CONFIÁVEL/AMIGO dele considera esse jogador CONFIÁVEL/AMIGO."""}
	],
	['text', {'title':'LEALDADES', 'space':260, 'color':Color.orange,
	'text':"""Torna-se HOSTIL (exceto quando já REVOLTADO) a um jogador ou quando descobre que este irá se aliar com um jogador REVOLTANTE ou quando descobre que este considera um jogador REVOLTANTE como CONFIÁVEL/AMIGO."""}
	],
	['text', {'title':'GENERAL', 'space':190, 'color':Color.cyan,
	'text':"""Sua relação melhora ao contar informação que ele descobre que é verdadeira. O oposto ocorre com informação que ele descobre que é falsa."""}
	],
	['text', {'title':'TATICO', 'space':400, 'color':Color.lightgreen,
	'text':"""Sempre acredita em jogadores CONFIÁVEIS/AMIGOS. Acredita no oposto do que um jogador REVOLTANTE/HOSTILIZADO lhe contou sobre outros jogadores, e ignora o que eles dizem se a info involve eles mesmos. 
	Investiga info vinda de jogadores SUSPEITADOS, ou ignora ela se não puder. Ele ainda se lembra do que foi dito de verdade (para ativar General) por dois rounds."""}
	],
	['text', {'title':'DIPLOMATICO', 'color':Color.darkmagenta,
	'text':"""Sua relação com outros votantes e o Líder melhora/piora quando eles concordam/discordam de sua Política de Votação."""}
	],
	['text', {'title':'PRIORIDADE DE ACAO', 'space':400, 
	'text':"""1- Ataca um jogador REVOLTANTE.
	2- Ataca um jogador HOSTILIZADO.
	3- Conta para um jogador CONFIÁVEL/AMIGO que um jogador REVOLTANTE irá atacá-lo.
	4- Compartilha informação com um jogador CONFIÁVEL/AMIGO sobre um ataque vindo contra ele.
	5- Conta para um jogador CONFIÁVEL/AMIGO que um jogador HOSTILIZADO irá atacá-lo.
	6- Investiga o Agente de uma mensagem que ele recebeu de um jogador SUSPEITADO.
	7- Conta para um jogador CONFIÁVEL/AMIGO que outro jogador CONFIÁVEL/AMIGO irá se aliar com Thoren.
	8- Investiga um jogador SUSPEITADO.
	9- Se não for o primeiro na Ordem do Trono, aumenta sua influência, a não ser que o Líder tenha HERDEIRO e seja CONFIÁVEL/AMIGO.
	10- Investiga um jogador CONFIÁVEL."""}
	],
	['text', {'title':'POLITICA DE VOTACAO',
	'text':"""1- Não se for um ataque contra um jogador AMIGO ou ele mesmo.
	2- Sim se o Líder for AMIGO.
	3- Não se for um ataque contra um jogador CONFIÁVEL.
	4- Sim se for um ataque contra um jogador HOSTILIZADO/REVOLTANTE.
	5- Sim se o Líder for CONFIÁVEL.
	6- Não se o Líder for HOSTILIZADO/REVOLTANTE."""}
	],
	['text', {'title':'PRIORIDADE DE PROPOSTAS',
	'text':"""1- Ataque contra um jogador REVOLTANTE.
	2- Ataque contra um jogador HOSTILIZADO.
	3- Paz para ele mesmo."""}
	]],
	
	# Edraele
	[['text', {'title':'EDRAELE', 'space':180,
	'text':"""Manipulativa. Age de forma pacífica mas pode trair. Adapta-se dinamicamente ao jogador.
	Raça: Elfa"""}
	],
	['text', {'title':'RELACOES INICIAIS', 'space':260, 
	'text':"""-SUSPEITA de Salem.
	-SUSPEITA de Grolk.
	-SUSPEITA de Zardri.
	-SUSPEITA de Kallysta.
	-CONFIANTE de Horlin.
	-SUSPEITA de Obrulena.
	-CONFIANTE de Thoren."""}
	],
	['text', {'title':'CARACTERISTICAS - TL;DR', 'space':560, 
	'text':"""Edraele muda seu comportamento baseado em sua relação com o Personagem do Jogador. Quando recebe info, compara-a com seus outros dados e determina o que é verdadeiro e o que não é.
	Ela reage de forma apropriada a info que ele acredita, atacando inimigos que atacam ele e fazendo paz com aqueles que também o fazem. Ela também imita a relação de seus oponentes, se possível.
	Edraele fica Revoltada com jogadores que a traem e fica Hostil com jogadores que são traídos por ela. Por fim, ela não gosta de jogadores que se aliam com seus inimigos e gosta de jogadores que os atacam."""}
	],
	['text', {'title':'AGENDA', 'space':180, 'color':Color.pink,
	'text':"""Sua Prioridade de Ação muda no começo de cada round baseado em sua relação com o PERSONAGEM DO JOGADOR."""}
	],
	['text', {'title':'ATENTIVA', 'color':Color.navyblue,
	'text':"""Reduz sua relação com jogadores que aumentam a Influência de jogadores REVOLTANTES. O oposto ocorre com jogadores não-REVOLTANTES que reduzem-a."""}
	],
	['text', {'title':'AMBICIOSA', 'color':Color.orangered,
	'text':"""Reduz sua relação com jogadores que reduzem sua Influência. O oposto ocorre com jogadores não-REVOLTANTES que aumentam-a."""}
	],
	['text', {'title':'PERFIDIA', 'space':140, 'color':Color.darkred,
	'text':"""Torna-se HOSTIL a jogadores que são MASSACRADOS (Passiva vs Agressiva) por ela."""}
	],
	['text', {'title':'JUSTICA', 'space':140, 'color':Color.darkslategray,
	'text':"""Fica REVOLTADA com jogadores que MASSACRAM (Agressiva vs Passiva) ela."""}
	],
	['text', {'title':'REATIVA', 'space':300, 'color':Color.aqua,
	'text':"""Torna-se HOSTIL (exceto quando já REVOLTADA) a um jogador quando ela descobre que este está planejando atacá-lo ou é REVOLTADO/HOSTIL contra ela. Torna-se SUSPEITA de um jogador REVOLTANTE/HOSTILIZADO quando ela descobre que este está planejando se aliar com ela."""}
	],
	['text', {'title':'INVEJA', 'space':180, 'color':Color.purple,
	'text':"""Fica REVOLTADA com jogadores que ela descobre têm mais pontos que ela. Se ela descobre depois que isso deixou de ser o caso, fica apenas HOSTIL."""}
	],
	['text', {'title':'DEDUCAO', 'space':330, 'color':Color.yellow,
	'text':"""Pode deduzir a relação do PERSONAGEM DO JOGADOR com outros jogadores baseado na relação de outros jogadores com ele. Por exemplo, se ela descobre que alguém está REVOLTADO com o PERSONAGEM DO JOGADOR, ela irá deduzir que o PERSONAGEM DO JOGADOR está REVOLTADO com ele."""}
	],
	['text', {'title':'DISCERNIMENTO', 'space':340, 'color':Color.lightseagreen,
	'text':"""Pode deduzir a relação do Personagem do Jogador com outros jogadores baseado em como ele vota em propostas específicas com tais jogadores como alvos:
	-Sim para Guerra: REVOLTADO
	-Não para Paz: HOSTIL
	-Nulo: SUSPEITO
	-Sim para Paz: CONFIANTE
	-Não para Guerra: AMIGÁVEL"""}
	],
	['text', {'title':'LEALDADES', 'space':250, 'color':Color.orange,
	'text':"""Torna-se HOSTIL (exceto quando já REVOLTADA) a um jogador ou quando descobre que este irá se aliar com um jogador REVOLTANTE ou quando descobre que este considera um jogador REVOLTANTE como CONFIÁVEL/AMIGO."""}
	],
	['text', {'title':'FACHADA', 'space':140, 'color':Color.black,
	'text':"""Se não estiver REVOLTADA com um jogador, imita sua relação após investigá-lo."""}
	],
	['text', {'title':'INTRIGA', 'space':590, 'color':Color.darkcyan,
	'text':"""Ao receber mensagens, compara-as com seus outros dados. Se houver uma contradição ou conclusão ilógica, acredita em seus dados. Se houver uma contradição ou conclusão ilógica entre mensagens, dá prioridade para a mensagem vinda do remetente mais confiado.
	Se não houver contradição e a mensagem vier de um jogador SUSPEITADO, investiga a validade desta informação, se possível. Senão, ignora-a.
	Em qualquer caso, fica REVOLTADA se descobrir que a mensagem é falsa. Alternativamente, se a mensagem for verdadeira e não envolver o remetente, sua relação com ele melhora."""}
	],
	['text', {'title':'DIPLOMATICA', 'color':Color.darkmagenta,
	'text':"""Sua relação com outros votantes e o Líder melhora/piora quando eles concordam/discordam de sua Política de Votação."""}
	],
	['text', {'title':'PRIORIDADE DE ACAO (CONFIANTE/AMIGAVEL)', 'space':870, 
	'text':"""1- Se for a Rodada 6, ataca qualquer jogador.
	2- Investiga um jogador HOSTILIZADO/SUSPEITADO que tenha Guerreiro.
	3- Ataca um jogador REVOLTANTE.
	4- Ataca um jogador HOSTILIZADO.
	5- Ataca um jogador SUSPEITADO que tenha Guerreiro, mas apenas se ele for SUSPEITO de pelo menos mais um outro jogador.
	6- Compartilha informação com um jogador HOSTILIZADO/SUSPEITADO que tenha Guerreiro sobre um ataque vindo contra ele.
	7- Investiga o Agente de uma mensagem que ele recebeu de um jogador SUSPEITADO.
	8- Se não for a primeira na Ordem no Trono, aumenta sua Influência.
	9- Conta para um jogador CONFIÁVEL/AMIGO que um jogador HOSTILIZADO/REVOLTANTE irá atacá-lo.
	10- Escolhe qualquer jogador X de quem Edraele tem uma carta. Então, escolha um jogador Y que seja CONFIANTE/AMIGÁVEL com ele. Gasta Ações para modificar a carta de X para dizer 'X vai atacar Y'.
	11- Re-envia a carta modificada de X para Y.
	12- Investiga um jogador."""}
	],
	['text', {'title':'PRIORIDADE DE ACAO (SUSPEITA)', 'space': 670, 'color':Color.black,
	'text':"""1- Se for a Rodada 6, ataca qualquer jogador.
	2- Investiga um jogador HOSTILIZADO/SUSPEITADO que tenha Guerreiro.
	3- Ataca um jogador REVOLTANTE.
	4- Ataca um jogador HOSTILIZADO.
	5- Ataca um jogador SUSPEITADO que tenha Guerreiro, mas apenas se ele for SUSPEITO de pelo menos mais um outro jogador.
	6- Compartilha informação com um jogador HOSTILIZADO/SUSPEITADO que tenha Guerreiro sobre um ataque vindo contra ele.
	7- Investiga o Sujeito de uma mensagem que ele recebeu de um jogador SUSPEITADO.
	8- Investiga um jogador SUSPEITADO.
	9- Escolhe qualquer jogador X de quem Edraele tem uma carta. Então, escolha um jogador Y que seja CONFIANTE/AMIGÁVEL com ele. Gasta Ações para modificar a carta de X para dizer 'X vai atacar Y'.
	10- Re-envia a carta modificada de X para Y.
	11- Conta para um jogador CONFIÁVEL/AMIGO que um jogador SUSPEITADO irá atacá-lo.
	12- Se não for a primeira na Ordem no Trono, aumenta sua Influência.
	13- Ataca um jogador SUSPEITADO."""}
	],
	['text', {'title':'PRIORIDADE DE ACAO (HOSTIL/REVOLTADA)', 'space':280, 'color':Color.black,
	'text':"""1- Ataca um jogador REVOLTANTE.
	2- Conta para um jogador CONFIÁVEL/AMIGO com IRMANDADE que um jogador REVOLTANTE mencionado em (1) irá atacá-la.
	3- Re-envia uma carta que ela acredita seja falsa e escrita por um jogador REVOLTANTE para outro que está SUSPEITO desse jogador.
	4- Ataca um jogador HOSTILIZADO.
	5- Conta para um jogador CONFIÁVEL/AMIGO com IRMANDADE que um jogador HOSTILIZADO irá atacá-la.
	6- Reduz a Influência de um jogador REVOLTANTE.
	7- Se não for a primeira na Ordem no Trono, aumenta sua Influência."""}
	],
	['text', {'title':'POLITICA DE VOTACAO',
	'text':"""1- Não se for um ataque contra um jogador AMIGO ou ela mesma.
	2- Sim se for um ataque contra um jogador HOSTILIZADO/REVOLTANTE.
	3- Sim se o Líder for CONFIÁVEL/AMIGO.
	4- Não se o Líder for HOSTILIZADO/REVOLTANTE."""}
	],
	['text', {'title':'PRIORIDADE DE PROPOSTAS',
	'text':"""1- Ataque contra um jogador REVOLTANTE.
	2- Ataque contra um jogador HOSTILIZADO.
	3- Paz para ela mesma."""}
	]],
	
	# Drakoth
	[['text', {'title':'DRAKOTH', 'space':180,
	'text':("O herdeiro impulsivo ao trono do Império é tão bom em batalha quanto no conselho, usando seus " +
	"poderes dinásitcos para todo seu potencial.\n" +
	"Raca: Dragonborn")}
	],
	['text', {'title':'RELACOES INICIAIS', 'space':260, 
	'text':"""-SUSPEITO de Salem.
	-HOSTIL para Grolk.
	-HOSTIL para Zardri.
	-HOSTIL para Kallysta.
	-CONFIANTE de Obrulena.
	-CONFIANTE de Horlin.
	-CONFIANTE de Thoren."""}
	],
	['text', {'title':'CARACTERISTICAS - TL;DR', 'space':480, 
	'text':("Drakoth é o ambicioso herdeiro ao trono do império, e por isso avalia o jogador " +
	"baseado na forma de como eles votam e torna-se Revoltado quando alguém tenta tirar sua posição de Líder dele. " +
	"Como um feroz e honrado guerreiro, Drakoth protege e consolida seu círculo de aliados, ficando Confiante daqueles " +
	"que confiam em seus aliados mas torna-se Hostil contra aqueles que os atacam. Ele também não aprecia quando alguém " +
	"se alia com seus inimigos Revoltantes. Além disso, Drakoth reage apropriadamente à agressão, atacando inimigos que " +
	"atacam ele e fazendo paz com os que também o fazem. Ele, porém, apenas acredita em seus aliados, o que dificulta " +
	"tentativas de manipulação.")}
	],
	['text', {'title':'ESTRATEGIA', 'color':Color.brown,
	'text':"""Sua Prioridade de Propostas muda no começo de cada round baseado em sua Relação com o Personagem do Jogador."""}
	],
	['text', {'title':'HERDEIRO', 'color':Color.darkviolet,
	'text':("Torna-se REVOLTADO com jogadores que, reduzindo sua Influência ou aumentando a de outra pessoa " +
	"faz ele perder posição na Ordem do Trono.")}
	],
	['text', {'title':'AMBICIOSO', 'color':Color.orangered,
	'text':"""Reduz sua relação com jogadores que reduzem sua Influência. O oposto ocorre com jogadores não-REVOLTANTES que aumentam-a."""}
	],
	['text', {'title':'REATIVO', 'space':290, 'color':Color.aqua,
	'text':"""Torna-se HOSTIL (exceto quando já REVOLTADO) a um jogador quando ele descobre que este está planejando atacá-lo ou é REVOLTADO/HOSTIL contra ele. Torna-se SUSPEITO de um jogador REVOLTANTE/HOSTILIZADO quando ele descobre que este está planejando se aliar com ele."""}
	],
	['text', {'title':'JUSTICA', 'space':140, 'color':Color.darkslategray,
	'text':"""Fica REVOLTADO com jogadores que MASSACRAM (Agressiva vs Passiva) ele."""}
	],
	['text', {'title':'DISCERNIMENTO', 'space':340, 'color':Color.lightseagreen,
	'text':"""Pode deduzir a relação do Personagem do Jogador com outros jogadores baseado em como ele vota em propostas específicas com tais jogadores como alvos:
	-Sim para Guerra: REVOLTADO
	-Não para Paz: HOSTIL
	-Nulo: SUSPEITO
	-Sim para Paz: CONFIANTE
	-Não para Guerra: AMIGÁVEL"""}
	],
	['text', {'title':'IRMANDADE', 'space':300, 'color':Color.darkblue,
	'text':"""Torna-se HOSTIL (exceto quando já REVOLTADO ou AMIGÁVEL) a um jogador ou quando descobre que esse jogador vai atacar um jogador CONFIÁVEL/AMIGO dele, ou quando descobre que esse jogador é REVOLTADO/HOSTIL contra um jogador CONFIÁVEL/AMIGO dele."""}
	],
	['text', {'title':'ALIANCA', 'space':300, 'color':Color.blue,
	'text':"""Torna-se CONFIANTE (exceto quando já REVOLTADO or AMIGÁVEL) de um jogador ou quando descobre que esse jogador vai se aliar a um jogador CONFIÁVEL/AMIGO dele, ou quando descobre que um jogador CONFIÁVEL/AMIGO dele considera esse jogador CONFIÁVEL/AMIGO."""}
	],
	['text', {'title':'LEALDADES', 'space':260, 'color':Color.orange,
	'text':"""Torna-se HOSTIL (exceto quando já REVOLTADO) a um jogador ou quando descobre que este irá se aliar com um jogador REVOLTANTE ou quando descobre que este considera um jogador REVOLTANTE como CONFIÁVEL/AMIGO."""}
	],
	['text', {'title':'SIMPLES', 'color':Color.darkgreen,
	'text':"""Sempre acredita em jogadores CONFIÁVEIS/AMIGOS. Nunca acredita em outros, mas ainda lembra do que eles disseram (para ativar General)."""}
	],
	['text', {'title':'DIPLOMATICO', 'color':Color.darkmagenta,
	'text':"""Sua relação com outros votantes e o Líder melhora/piora quando eles concordam/discordam de sua Política de Votação."""}
	],
	['text', {'title':'PRIORIDADE DE ACAO',
	'text':"""1- Ataca um jogador REVOLTANTE.
	2- Conta para um jogador CONFIÁVEL/AMIGO com IRMANDADE que um jogador REVOLTANTE irá atacá-la.
	3- Ataca um jogador HOSTILIZADO.
	4- Se houver alguém com mais ou igual Influência que ele, aumenta sua Influência.
	5-  Conta para um jogador CONFIÁVEL/AMIGO com IRMANDADE que um jogador HOSTILIZADO irá atacá-la.
	6- Investiga um jogador SUSPEITO.
	7- Aumenta a Influência de um jogador AMIGO que não é o segundo na Ordem do Trono (a não ser que já houver um jogador AMIGO naquela posição).
	8a- Se for um round par, investiga um jogador HOSTILIZADO/REVOLTANTE.
	8b- Se for um round ímpar, investiga um jogador CONFIÁVEL/AMIGO."""}
	],
	['text', {'title':'POLITICA DE VOTACAO',
	'text':"""1- Não."""}
	],
	['text', {'title':'PRIORIDADE DE PROPOSTAS (SUSP/CONFIAVEL/AMIGÁV)',
	'text':"""1- Se a soma de todos os votos de jogadores CONFIÁVEIS/AMIGOS for maior que 2, paz para si.
	2- Se nenhum jogador CONFIÁVEL/AMIGO com LEALDADES estiver REVOLTADO com um jogador SUSPEITO, paz para este jogador SUSPEITO.
	3- Se nenhum jogador CONFIÁVEL/AMIGO for AMIGO com um jogador HOSTIL/REVOLTADO, guerra para este jogador HOSTIL/REVOLTADO.
	4- Paz para si."""}
	],
	['text', {'title':'PRIORIDADE DE PROPOSTAS (HOSTIL/REVOLTADO)',
	'text':"""1- Atacar um jogador REVOLTANTE.
	2- Atacar um jogador HOSTILIZADO."""}
	]],
	]
	
	return br_pages
