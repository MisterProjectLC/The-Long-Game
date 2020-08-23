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
	'text':"""Influência mede o poder e notoriedade de um jogador no reino. Jogadores com maior Influência agem antes no turno e têm uma maior chance de receberem mensagens ou serem atacados.
	Um jogador pode mudar sua posição na ordem de Influência usando os botões na parte inferior da tela. Tenha em mente que a ordem apenas se atualiza no fim de cada round."""}
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
	'text':"""No início de cada turno, o líder da Ordem do Trono propõe um Decreto para o Conselho. Um Decreto se
	consiste de uma Postura e um Alvo e, caso aprovado, força todos os jogadores a tomar a Postura escolhida contra o Alvo
	escolhido, no próximo turno.
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
	['text', {'title':'ORDEM DE TURNO', 'space':120, 
	'text':"""Edraele/Salem/Thoren/Grolk"""}
	], 
	['text', {'title':'TERMOS COMUNS', 'space':440, 
	'text':"""INFORMAÇÃO/MENSAGENS
	Feita de três partes, em ordem: Sujeito/Ação/Objeto

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
	-SUSPEITO de Edraele."""}
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
	5- Ataca um jogador SUSPEITADO."""}
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
	-SUSPEITO de Edraele."""}
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
	Se não houve partida (Turno 1): SUSPEITO """}
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
	3- Se for um turno par, conta uma mentira para um jogador HOSTILIZADO.
	4- Investiga um jogador SUSPEITADO."""}
	],
	['text', {'title':'POLITICA DE VOTACAO',
	'text':"""1- Não se for um ataque contra ele mesmo.
	2a- Sim se for um ataque contra qualquer outro jogador.
	2b- Sim se for paz com ele mesmo.
	"""}
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
	-SUSPEITA de Edraele."""}
	],
	['text', {'title':'CARACTERISTICAS - TL;DR', 'space':550, 
	'text':"""A natureza individualista de Kallysta faz ela impossível de tornar-se Amigável com alguém. Ela é excelente em encontrar e interpretar informação, e usa essa habilidade para prever o comportamento de outros jogadores.
	Com a habilidade exclusiva Quebra-Correntes, Kallysta torna-se Hostil contra jogadores com muitos aliados. Usando diplomacia e investigação, a líder tiefling consegue facilmente desmontar amizades em um ou dois turnos.
	Ela também reage de forma apropriada a mensagens recebidas, defendendo-se de inimigos."""}
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
	2- Se for um turno ímpar, investiga um jogador SUSPEITADO.
	3- Re-envia uma carta que ela acredita seja falsa e escrita por um jogador HOSTILIZADO para outro que está SUSPEITO desse jogador.
	4- Primeiro, escolhe um jogador X HOSTILIZADO. Então, escolhe dois jogadores, Y e Z, que acham X CONFIÁVEL.
	  4a- Se Y tiver Lealdades e estiver REVOLTADO com  Z, conta para Y que X vai cooperar com Z.
	  4b Se Y tiver Irmandade e estiver CONFIANTE/AMIGÁVEL com ela e Z, conta para Y que X vai atacar Z.
	5- Ataca um jogador HOSTILIZADO.
	6- Conta para um jogador SUSPEITADO que ela irá se aliar com ele.
	7- Investiga um jogador HOSTILIZADO.
	8- Investiga um jogador CONFIÁVEL."""}
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
	-CONFIANTE de Edraele."""}
	],
	['text', {'title':'CARACTERISTICAS - TL;DR', 'space':480, 
	'text':("Horlin é um péssimo general, mas um grande escritor. Por isso, ele interpreta mensagens recebidas não como informação, " +
	"mas como pedidos. Quando alguém envia um pedido, ele tenta falsificar uma de suas cartas e enviá-la para o pedinte, o qual ele pode " +
	"usar como quiser. Tirando isso, Horlin tem características comuns, reagindo a outros tipos de informação de forma apropriada.")}
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
	4- Ataca um jogador REVOLTANTE.
	5- Investiga um jogador CONFIÁVEL.
	6- Se não for o segundo na Ordem de Influência, aumenta sua Influência.
	7- Ataca um jogador HOSTILIZADO."""}
	],
	['text', {'title':'POLITICA DE VOTACAO',
	'text':"""1- Não se for um ataque contra ele mesmo.
	2- Sim se o Líder for AMIGO.
	3- Sim se for paz com ele mesmo.
	4- Não se o Líder for HOSTILIZADO/REVOLTANTE.
	"""}
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
	-SUSPEITA de Edraele."""}
	],
	['text', {'title':'CARACTERISTICAS - TL;DR', 'space':480, 
	'text':"""Obrulena, como uma ativista da paz, rapidamente faz amizade com jogadores com quem ela corresponde ou são amigos de algum amigo dela.
	Porém, na via contrária, qualquer descobrimento de Massacres causa grande ressentimento de sua parte. Ela sempre acredita em seus aliados e nunca acredita em jogadores os quais ainda não confia. Devido a suas tradições,
	ela também tem maior respeito para o jogador com mais Influência."""}
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
	Se não houve partida (Turno 1): SUSPEITO """}
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
	4- Investiga o Sujeito de uma mensagem na qual ela acredita e envolve um ataque.
	5- Ataca um jogador REVOLTANTE.
	6- Ataca um jogador HOSTILIZADO.
	7- Conta para um jogador HOSTILIZADO que ela irá atacá-lo.
	8- Se não for a primeira ou segunda na Ordem no Trono, aumenta sua Influência.
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
	-CONFIANTE de Edraele."""}
	],
	['text', {'title':'CARACTERISTICAS - TL;DR', 'space':500, 
	'text':"""Thoren acredita em seus amigos e, no geral, não acredita em seus inimigos. Ele tenta investigar info suspeita, mas ignora-a se não puder.
	Ele também odeia jogadores que atacam seus amigos, e se alia a jogadores que se aliam a seus amigos. Porém, se alguém se aliar a um de seus inimigos revoltantes, ele fica hostil contra esta pessoa.
	Thoren reage de forma apropriada a info que ele acredita, atacando inimigos que atacam ele e fazendo paz com aqueles que também o fazem. Ele odeia ser traído."""}
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
	Se não houve partida (Turno 1): SUSPEITO """}
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
	6- Investiga o Sujeito de uma mensagem que ele recebeu de um jogador SUSPEITADO.
	7- Conta para um jogador CONFIÁVEL/AMIGO que outro jogador CONFIÁVEL/AMIGO irá se aliar com Thoren.
	8- Investiga um jogador SUSPEITADO.
	9- Se não for o primeiro na Ordem do Trono, aumenta sua influência.
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
	7- Investiga o Sujeito de uma mensagem que ele recebeu de um jogador Suspeitado.
	8- Compartilha informação com um jogador CONFIÁVEL/AMIGO sobre um ataque vindo contra ele.
	9- Se não for a primeira na Ordem no Trono, aumenta sua Influência.
	10- Conta para um jogador CONFIÁVEL/AMIGO que um jogador HOSTILIZADO/REVOLTANTE irá atacá-lo.
	11- Conta para um jogador CONFIÁVEL/AMIGO que outro jogador SUSPEITADO irá atacá-lo. Apenas uma vez por rodada.
	12- Investiga um jogador REVOLTANTE/HOSTILIZADO/SUSPEITADO que não tenha Guerreiro."""}
	],
	['text', {'title':'PRIORIDADE DE ACAO (SUSPEITA)', 'space': 670, 'color':Color.black,
	'text':"""1- Se for a Rodada 6, ataca qualquer jogador.
	2- Investiga um jogador HOSTILIZADO/SUSPEITADO que tenha Guerreiro.
	3- Ataca um jogador REVOLTANTE.
	4- Ataca um jogador HOSTILIZADO.
	5- Ataca um jogador SUSPEITADO que tenha Guerreiro, mas apenas se ele for SUSPEITO de pelo menos mais um outro jogador.
	5- Compartilha informação com um jogador HOSTILIZADO/SUSPEITADO que tenha Guerreiro sobre um ataque vindo contra ele.
	6- Investiga o Sujeito de uma mensagem que ele recebeu de um jogador SUSPEITADO.
	7- Investiga um jogador SUSPEITADO.
	8- Conta para um jogador CONFIÁVEL/AMIGO que um jogador SUSPEITADO irá atacá-lo.
	9- Se não for a primeira na Ordem no Trono, aumenta sua Influência.
	10- Ataca um jogador SUSPEITADO."""}
	],
	['text', {'title':'PRIORIDADE DE ACAO (HOSTIL/REVOLTADA)', 'space':280, 'color':Color.black,
	'text':"""1- Ataca um jogador REVOLTANTE.
	2- Conta para um jogador CONFIÁVEL/AMIGO com Irmandade que um jogador REVOLTANTE mencionado em (1) irá atacá-la.
	3- Re-envia uma carta que ela acredita seja falsa e escrita por um jogador REVOLTANTE para outro que está SUSPEITO desse jogador.
	4- Ataca um jogador HOSTILIZADO.
	5- Conta para um jogador CONFIÁVEL/AMIGO com Irmandade que um jogador HOSTILIZADO irá atacá-la.
	6- Compartilha informação com um jogador HOSTILIZADO/SUSPEITADO que tenha Guerreiro sobre um ataque vindo contra ele.
	7- Investiga o jogador REVOLTANTE mencionado em (2)."""}
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
	'text':"""Becomes ENRAGED to players who steal his Leader position."""}
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
	['text', {'title':'PROPOSAL PRIORITY (SUSP/TRUSTFUL/FRIENDLY)',
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
	
	return br_pages
